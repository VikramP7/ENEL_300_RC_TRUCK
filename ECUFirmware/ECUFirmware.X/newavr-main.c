/*
 * File:   newavr-main.c
 * Author: vikra
 *
 * Created on April 1, 2025, 5:06 PM
 */


#include <avr/io.h>
#include "leds.h"

/*Global Variable Definitions*/
volatile unsigned long G_u32SystemTimeMs = 0;
volatile unsigned long G_u32SystemFlags = 0;


int main(void) {
    
    /*Low level Initialization*/
    // Global System Time Initialization
    // PWM audio initialization
    // Led initialization
    LedInitialization();
    // SPI initialization
    // I2C initialization
    
    /*Driver Initialization*/
    // Radio SPI initialization
    // I2C bus initialization
    // !!NOT NEEDED ON ECU!! LCD I2C initialization
    
    /* Replace with your application code */
    //LedOn(LED_DEBUG_RED);
    //LedOn(LED_DEBUG_GREEN);
    //LedOn(LED_ALL);
    while (1) {
        
    }
}
