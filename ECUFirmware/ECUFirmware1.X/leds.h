/* 
 * File: leds.h
 * Author: Vikram Procter
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef XC_LED_DRIVER_H
#define	XC_LED_DRIVER_H

#include <xc.h> // include processor files - each processor file is guarded.  

// user #include <> here
#include <avr/io.h>

/*
#define LED_LEFT_HEAD  0b00001000;  // PD3
#define LED_RIGH_THEAD 0b00010000;  // PD4
#define LED_LEFT_TAIL  0b00100000;  // PD5
#define LED_RIGHT_TAIL 0b01000000;  // PD6
#define LED_LIGHT_BAR  0b00000010;  // PA1 
*/

//---- global Macro values and types ----
typedef enum {
    LED_DEBUG_RED,    // PD1
    LED_DEBUG_GREEN,    // PD2
    LED_LEFT_HEAD,  // PD3
    LED_RIGH_THEAD, // PD4
    LED_LEFT_TAIL,  // PD5
    LED_RIGHT_TAIL, // PD6
    LED_LIGHT_BAR,  // PA1 
    LED_ALL
}LedName;


// ---- library functions ----
void LedInitialization();
void LedOn(LedName selectedLed);
void LedOff(LedName selectedLed);

#endif	/* XC_LED_DRIVER_H */

