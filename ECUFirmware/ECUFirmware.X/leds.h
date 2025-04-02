/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/* 
 * File:   
 * Author: 
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
 * 
 * enum LedName{
    LED_DEBUG_1    = 0b00000010,  // PD1
    LED_DEBUG_2    = 0b00000100,  // PD2
    LED_LEFT_HEAD  = 0b00001000,  // PD3
    LED_RIGH_THEAD = 0b00010000,  // PD4
    LED_LEFT_TAIL  = 0b00100000,  // PD5
    LED_RIGHT_TAIL = 0b01000000,  // PD6
    LED_LIGHT_BAR  = 0b00000010,  // PA1 
};
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

