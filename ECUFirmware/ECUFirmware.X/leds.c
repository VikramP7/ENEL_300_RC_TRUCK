/*
 * File:   leds.c
 * Author: Vikram Procter
 *
 * Created on April 2, 2025, 8:54 AM
 */

/*----------------
 * USEFUL INFO
 * enum LedName{
    LED_DEBUG_1    = 0b00000010,  // PD1
    LED_DEBUG_2    = 0b00000100,  // PD2
    LED_LEFT_HEAD  = 0b00001000,  // PD3
    LED_RIGH_THEAD = 0b00010000,  // PD4
    LED_LEFT_TAIL  = 0b00100000,  // PD5
    LED_RIGHT_TAIL = 0b01000000,  // PD6
    LED_LIGHT_BAR  = 0b00000010,  // PA1 
};
 * 
 * LEDs are wired for AVR pin to act as ground, therefore light on is pin low
 * 
 * ------------------
 */

#include <avr/io.h>

#include "leds.h"


void LedInitialization(){
    
    PORTD.DIRSET |= 0b01111110;
    PORTA.DIRSET |= 0b00000010;
    
    PORTD.OUTSET |= 0b01111110;
    PORTA.OUTSET |= 0b00000010;
}

void LedOn(LedName selectedLed){
    switch((char)(selectedLed)){
        char s = selectedLed;
        case 0:
            //LED_DEBUG_RED    = 0b00000010
            PORTD.OUT &= ~(0b00000010);  // PD1
            break;
        case 1:
            //LED_DEBUG_GREEN    = 0b00000100,  // PD2
            PORTD.OUT &= ~(0b00000100);
            break;
        case 2:
            //LED_LEFT_HEAD  = 0b00001000,  // PD3
            PORTD.OUT &= ~(0b00001000);
            break;
        case 3:
            //LED_RIGH_THEAD = 0b00010000,  // PD4
            PORTD.OUT &= ~(0b00010000);
            break;
        case 4:
            //LED_LEFT_TAIL  = 0b00100000,  // PD5
            PORTD.OUT &= ~(0b00100000);
            break;
        case 5:
            //LED_RIGHT_TAIL = 0b01000000,  // PD6
            PORTD.OUT &= ~(0b01000000);
            break;
        case 6:
            //LED_LIGHT_BAR  = 0b00000010,  // PA1
            PORTA.OUT &= ~(0b00000010);
            break;
        case 7:
            PORTD.OUT &= ~(0b01111110);
            PORTA.OUT &= ~(0b00000010);
            break;
        default:
            break;
    }
}

void LedOff(LedName selectedLed){
    switch((char)(selectedLed)){
        case 0:
            //LED_DEBUG_RED    = 0b00000010
            PORTD.OUT |= 0b00000010;  // PD1
            break;
        case 1:
            //LED_DEBUG_GREEN    = 0b00000100,  // PD2
            PORTD.OUT |= 0b00000100;
            break;
        case 2:
            //LED_LEFT_HEAD  = 0b00001000,  // PD3
            PORTD.OUT |= 0b00001000;
            break;
        case 3:
            //LED_RIGH_THEAD = 0b00010000,  // PD4
            PORTD.OUT |= 0b00010000;
            break;
        case 4:
            //LED_LEFT_TAIL  = 0b00100000,  // PD5
            PORTD.OUT |= 0b00100000;
            break;
        case 5:
            //LED_RIGHT_TAIL = 0b01000000,  // PD6
            PORTD.OUT |= 0b01000000;
            break;
        case 6:
            //LED_LIGHT_BAR  = 0b00000010,  // PA1
            PORTA.OUT |= 0b00000010;
            break;
        case 7:
            PORTD.OUT |= 0b01111110;
            PORTA.OUT |= 0b00000010;
            break;
        default:
            break;
    }
    
}
