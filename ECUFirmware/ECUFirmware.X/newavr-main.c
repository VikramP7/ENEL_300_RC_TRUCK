/*
 * File:   newavr-main.c
 * Author: vikra
 *
 * Created on April 1, 2025, 5:06 PM
 */


#include <avr/io.h>
#include "leds.h"
#include "radioSPI.h"

/*Global Variable Definitions*/
volatile unsigned long G_u32SystemFlags = 0;


int main(void) {
    
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
    char message[] = {0xEC, 0xFF, 0x12, 0x34};
    char recieve[4];
    while (1) {
        if(RADIO_MASTER){
            RadioTransmitMessage(&message, 4);
        }
        else{
            RadioReceiveMessage(&recieve, 4);
            if(recieve[0] = message[0]){
                PORTD.OUT &= 0b11111110;
            }
        }
        long i = 0;
        while(i < 1600){
            i++;
        }
    }
}
