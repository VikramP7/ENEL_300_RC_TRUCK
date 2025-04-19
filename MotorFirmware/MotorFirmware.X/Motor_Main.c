#include <xc.h>


// avr128db48-bare-metal-twi-mplab Main Initialization
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "peripherals/CLKCTRL/CLKCTRL.h"
#include "peripherals/TWI/TWI_client.h"
#include "TWI_blockData.h"

FUSES = {
	.WDTCFG = 0x00, // WDTCFG {PERIOD=OFF, WINDOW=OFF}
	.BODCFG = 0x06, // BODCFG {SLEEP=SAMPLE, ACTIVE=ENABLE, SAMPFREQ=128Hz, LVL=BODLEVEL0}
	.OSCCFG = 0x00, // OSCCFG {CLKSEL=OSCHF}
	.SYSCFG0 = 0xC8, // SYSCFG0 {EESAVE=CLEAR, RSTPINCFG=RST, CRCSEL=CRC16, CRCSRC=NOCRC}
	.SYSCFG1 = 0x0C, // SYSCFG1 {SUT=8MS, MVSYSCFG=DUAL}
	.CODESIZE = 0x00, // CODESIZE {CODESIZE=User range:  0x0 - 0xFF}
	.BOOTSIZE = 0x00, // BOOTSIZE {BOOTSIZE=User range:  0x0 - 0xFF}
};

LOCKBITS = 0x5CC5C55C; // {KEY=NOLOCK}

#define DATA_SIZE 16

// Didsbury Diddlers Proprietary Function Definitions

// === GLOBAL VARIABLES (I2C-assigned) ===
volatile uint8_t left_sm = 0;
volatile uint8_t right_sm = 0;

// Fairly sure that his clock setup is handled in the library

//// === CLOCK SETUP ===
//void setup_clock() {
//    CCP = 0xD8;
//    CLKCTRL.OSCHFCTRLA = 0b00010100;      // Set 16 MHz internal oscillator
//    while (CLKCTRL.MCLKSTATUS & 0b00000001); // Wait for clock switch to complete
//}

// Lowkey might need to readdress the pin setup, I have to fucking clue what
// the library is doing rn.

// === PIN SETUP ===
void setup_pins() {
    PORTC.DIRSET = 0b00001100;            // PC2 (TCB0), PC3 (TCB1) as PWM outputs
    PORTD.DIRSET = 0b00011110;            // PD1–PD4 as motor direction control outputs
}

// === PWM SETUP ===
void setup_pwm() {
    // TCB0: Left motor on PC2
    TCB0.CTRLA = 0b00000011;              // CLKSEL = CLKDIV1 (bit 0), ENABLE (bit 1)
    TCB0.CTRLB = 0b00000101;              // CNTMODE = PWM8
    TCB0.CCMP = 0;
    TCB0.CNT = 0;

    // TCB1: Right motor on PC3
    TCB1.CTRLA = 0b00000011;
    TCB1.CTRLB = 0b00000101;
    TCB1.CCMP = 0;
    TCB1.CNT = 0;
}

// === MOTOR CONTROL FUNCTION ===
void drive_motor(uint8_t sm, uint8_t fwd_pin, uint8_t bwd_pin, volatile TCB_t *tcb) {
    uint8_t sign = sm & 0x80;             // Bit 7 = direction
    uint8_t magnitude = sm & 0x7F;        // Bits 6–0 = speed

    uint16_t pwm = (uint16_t)magnitude * 515; // Scale 0–127 to 0–65535

    if (sign) {
        PORTD.OUTSET = (1 << bwd_pin);    // Set backward pin high
        PORTD.OUTCLR = (1 << fwd_pin);    // Clear forward pin
    } else {
        PORTD.OUTSET = (1 << fwd_pin);    // Set forward pin high
        PORTD.OUTCLR = (1 << bwd_pin);    // Clear backward pin
    }

    tcb->CCMP = pwm;                      // Update PWM duty cycle
}

// === MAIN LOOP ===
int main(void) {
    
    setup_pins();                         // Set up direction and PWM pins
    setup_pwm();                          // Configure PWM for TCB0 and TCB1
       
    //Setup CPU Clocks
    CLKCTRL_init();
    
    //Setup TWI I/O
    TWI_initPins();
    
    //Setup TWI Interface
    TWI_initClient(0x40);
    
    //Data to R/W to. (Must be volatile)
    volatile uint8_t data[DATA_SIZE];
    
    //Initialize Memory to 0x00
    for (uint8_t i = 0; i < DATA_SIZE; i++)
    {
        data[i] = 0x00;
    }
    
    //Attach R/W Buffers
    //Note: The buffers can be separated, or they can be the same memory, if desired.
    setupReadBuffer(&data[0], 16);
    setupWriteBuffer(&data[8], 8);
    
    //Assign ISRs to Block Memory Library
    TWI_assignByteWriteHandler(&_TWI_StoreByte);
    TWI_assignByteReadHandler(&_TWI_RequestByte);
    TWI_assignStopHandler(&_onTWIStop);
    
    //Enable Interrupts
    sei();
        
    TWI_initClient(0x11); // Initializes the motor board address to 0x11
    
    // Responsible for motor control from ECU I2C data.
    while (1)
    {   
        // `left_sm` and `right_sm` will be assigned externally by I2C library
        // This will look something like:
        left_sm = data[8];
        right_sm = data[9];

        drive_motor(left_sm, 1, 2, &TCB0);   // PD1 = FWD, PD2 = BWD (left)
        drive_motor(right_sm, 3, 4, &TCB1);  // PD3 = FWD, PD4 = BWD (right)
        
        // Flush the data array while waiting for new inputs; left_sm and 
        // right_sm will both auto update as data comes in, allegedly.
        for (uint8_t i = 0; i < DATA_SIZE; i++)
        {
            data[i] = 0x00;
        } 
    }
}
