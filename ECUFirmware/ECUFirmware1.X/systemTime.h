/*
 * File:   systemTime.h
 * Author: vikra
 *
 * Created on April 3, 2025, 10:54 AM
 */


#ifndef XC_SYSTEM_TIME_H
#define	XC_SYSTEM_TIME_H

#include <avr/io.h>

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
void ClockInitialization();
unsigned long SysCurrentTimeMS();
unsigned long SysCurrentTimeMS();

#endif	/* XC_SYSTEM_TIME_H */
