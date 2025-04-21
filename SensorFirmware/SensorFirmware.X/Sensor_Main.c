#include <xc.h>

//******************************************************************************

// avr128db48-bare-metal-twi-mplab Main Initialization

//******************************************************************************

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "peripherals/CLKCTRL/CLKCTRL.h"
#include "peripherals/TWI/TWI_client.h"
#include "TWI_blockData.h"

#define DATA_SIZE 16

#define VALUE_U_SIZE 8

/* --------- GLOBAL VARS DECLARATION ------------- */
uint16_t value_u[VALUE_U_SIZE];
uint8_t value[5];
uint8_t count_u = 0;
uint8_t tally_u = 0;
uint8_t count = 0;
uint8_t tally = 0;
//uint8_t duty = 25000;
float distance = 0.0;
float distance_final = 0.0;

//Data to R/W to. (Must be volatile)
volatile uint8_t data[DATA_SIZE];

void SensorInitialization(){
    PORTA.DIRSET = 0b00000011;   //PA0 set as output
    TCA0.SINGLE.CTRLA = (0x01)<<3 | 0x01;//divide by 16 and enable clk
    TCA0.SINGLE.CTRLB = 0x03;   //single slope PWM
    TCA0.SINGLE.CTRLB |= 0x01 << 4; //PA0 enabled
    TCA0.SINGLE.PER = 31249;
    TCA0.SINGLE.CMP0 = 6; //set to very low trigg duty cycle
    EVSYS.CHANNEL0 = 0x45;    //PORTA pin PA5
    EVSYS.USERTCB2CAPT = 0x01;  //Choose channel 0
    TCB2.INTCTRL = 0x01; //Capture interupt enable
    TCB2.EVCTRL = 0x01; //enable input capture event
    TCB2.CTRLB = 0x04; //PWM measurement mode
    TCB2.CTRLA = 0x01; //TCB enable
    EVSYS.CHANNEL1 = 0x46;    //PORTA pin PA6
    EVSYS.USERTCB1CAPT = 0x02;  //Choose channel 1
    TCB1.INTCTRL = 0x01; //Capture interupt enable
    TCB1.EVCTRL = 0x01; //enable input capture event
    TCB1.CTRLB = 0x03; //Frequency measurement mode
    TCB1.CTRLA = 0x01; //TCB enable
}

/* ------ Define ISR -----*/
ISR(TCB2_INT_vect){
    TCB2.INTFLAGS = 0x01; //clears flag
    TCA0.SINGLE.CMP0 = 6;
    //distance = TCB2.CCMP;
    //distance_final = ((distance * 0.000000125)*(340))/2; //gives distance in m
    //distance_final = 17 * distance / 5^5 >> 8
    value_u[count_u] = TCB2.CCMP;
    count_u++;
    count_u %= VALUE_U_SIZE;
    long averageDist = 0;
    //RMS might be appropriate for emphasizing the larger values.
    for (int i = 0; i < VALUE_U_SIZE; i++){
       averageDist += value_u[i];
    }
    averageDist = averageDist >> 3;
    data[0] = (averageDist & 0xFE) | (data[0] & 0b00000001);
    data[1] = averageDist >> 8;
}

ISR(TCB1_INT_vect){
    TCB1.INTFLAGS = 0x01; //clears flag
    value[count] = TCB1.CCMP;
    if(value[count] < 200){
        tally++;
    }
    count++;
    if(count >= 5){
        if(tally == 5){
            PORTA.OUT = 0b00000010; 
            data[0] |= 0x01;
        }else{
            PORTA.OUT = 0b00000000;
            data[0] &= 0xFE;
        }
        count = 0;
        tally = 0;
    }
}

// === MAIN FUNCTION ===
int main(void) {
    //Setup CPU Clocks
    CLKCTRL_init();
    
    // Sensor Initialization
    SensorInitialization();
    
    //Setup TWI I/O
    TWI_initPins();
    
    //Setup TWI Interface
    TWI_initClient(0x22);
    
    
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
    
    while (1)
    {   
    }
}
