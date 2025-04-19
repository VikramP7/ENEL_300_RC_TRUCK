/*
 * File:   newavr-main.c
 * Author: vikra
 *
 * Created on April 1, 2025, 5:06 PM
 */


#include <avr/io.h>
#include "leds.h"
#include "leds.c"
//#include "radioSPI.h"
//#include "radioSPI.c"

/*Global Variable Definitions*/
volatile unsigned long G_u32SystemFlags = 0;

int main_not(void) {
    /*Low level Initialization*/
    // Led initialization
    LedInitialization();
    LedOn(LED_DEBUG_RED); // turn on red while initializing
    // Global System Time Initialization
    // PWM audio initialization
    // SPI initialization
    
    SPIInitialization();
    // I2C initialization
    
    /*Driver Initialization*/
    // Radio SPI initialization
    RadioInitialization();
    // I2C bus initialization
    // !!NOT NEEDED ON ECU!! LCD I2C initialization
    
    LedOff(LED_DEBUG_RED);
    
    //LedOn(LED_ALL);
    PORTD.DIRSET = 0b00000001;
    PORTD.OUTSET |= 0b00000001;
    int ledOn = 0;
    char message[] = {0xEC, 0xFF, 0x12, 0x34};
    char status[1];
    
    while (1) {
        if(RADIO_IRQ_CHECK){
            LedOn(LED_DEBUG_RED);
        }
        RadioTransmitMessage(message, RADIO_PACKET_SIZE);
        //RadioRecieveCommand(RA_RADIO_RETRANS, status, 1);
        if(ledOn){
            LedOff(LED_DEBUG_GREEN);
            ledOn = 0;
        }else{
            LedOn(LED_DEBUG_GREEN);
            ledOn = 1;
        }
        
        long i = 0;
        while(i < 200000){
            i++;
        }
    }
}
