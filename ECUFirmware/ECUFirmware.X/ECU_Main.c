#include <xc.h>

//******************************************************************************

// avr128db48-bare-metal-twi-mplab Main Initialization

//******************************************************************************

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "peripherals/CLKCTRL/CLKCTRL.h"
#include "peripherals/RTC/RTC.h"
#include "peripherals/SLPCTRL/SLPCTRL.h"
#include "advanced_IO.h"

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

//******************************************************************************

// Disbury Diddlers Proprietary Libraries Initialization

//******************************************************************************

#include "leds.h"
#include "buzzer.h"
#include "systemTime.h"

// Bluetooth Functions (Thanks Marc)
// We need to implement the initialization here.
// Also need to address u16s instead of u8s
// In the event that we never receive the data these functions might be kinda
// cooked, although the high data rate and retransmissions probably deal with 
// it well enough

void USART_Transmit(uint8_t data) {
    while (!(USART1.STATUS & USART_DREIF_bm));  // Wait until buffer is empty
    USART1.TXDATAL = data;  // Send data
}


uint8_t USART_Receive(void) {
   
    while (!(USART1.STATUS & USART_RXCIF_bm)){
       
    }  // Wait for data
    return USART1.RXDATAL;  // Return received byte
}


void USART_Init(uint16_t baud) {
    // Set baud rate
    //USART1.BAUD = 0000010011100010;
    USART1.BAUD = 6666;
    // Set frame format: 8-bit, no parity, 1 stop bit (8N1)
    USART1.CTRLC = USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_CHSIZE_8BIT_gc;
   
    // Set TXD (PC0 and PC1) as output
    PORTC.DIRSET = PIN0_bm;
    PORTC.DIRCLR = PIN1_bm;  
   
    // Enable transmitter and receiver
    USART1.CTRLB = USART_TXEN_bm | USART_RXEN_bm;
}

//******************************************************************************

// Main

//******************************************************************************

int main(void)
{    
    // Led initialization
    LedInitialization();
    LedOn(LED_DEBUG_RED); // turn on red while initializing
    LedOff(LED_DEBUG_RED);
    
    //Setup CPU Clocks
    CLKCTRL_init();
    ClockInitialization();
               
    //Setup Sleep Controller (Probably not needed))
//    SLPCTRL_init();
    
    //Init RTC (Probably not needed))
//    RTC_init();
    
    //Init the IO Expander
    advancedIO_init();
    
    //Enable Interrupts
    sei();
    
    //Set the I/O Expander Pins as Outputs (Don't care about I/O Expander)
//    advancedIO_setPinsAsOutputs(0xFF);
    
    //Set initial pattern (Don't care about I/O Expander)
//    advancedIO_setOutputsHigh(0xAA);
    
    volatile uint8_t left_sm = 0;
    volatile uint8_t right_sm = 0;   
    

//******************************************************************************
    
//    Super Loop
    
//******************************************************************************
    
    // Responsible for all ECU functionality. Bluetooth interface, and communication
    // sensor and motor boards. The only things that the ECU will be receiving
    // are motor data and the toggle bit for the lights.
    
    while (1)
    {   
        //Sleep until the PIT triggers
//        asm("SLEEP"); // Can also get rid of this probably.
        
        //Flip the pin-state
        // This might be unnecessary, but the initialization is for sure required to the pin outs and baud rate type shit
        // advancedIO_toggleBitsInRegister(ADV_IO_LATx, 0xFF);
        
        TWI_sendByte(0x11, 0x69);
        
        
        // Theoretical Code for Motor Interface via I2C
        left_sm = USART_Receive();
        right_sm = USART_Receive();
        
        TWI_sendByte(0x11, left_sm);
        TWI_sendByte(0x11, right_sm);
        
        SuperLoopSleep();
        
    }
}
