/*
 * File:   systemTime.c
 * Author: vikra
 *
 * Created on April 3, 2025, 10:53 AM
 */


#include <avr/io.h>

#include "systemTime.h"

int CURRENT_TIME = 0;

void ClockInitialization(){
    _PROTECTED_WRITE(CLKCTRL.OSCHFCTRLA, CLKCTRL_FRQSEL_16M_gc);
    /*
    // set new clock frequency to 24MHz
    CLKCTRL.OSCHFCTRLA = 0b00100100;
    // wait till clock stablizes before procceding
    while(CLKCTRL.MCLKSTATUS & 0b00000001);
     */
    
    // sets max period for receting clock 
    TCA0.SINGLE.PER = 0xFFFF;
    // enable TCA and set division to be fclk/ 16
    // this produces a resolution of 0.6667us
    TCA0.SINGLE.CTRLA = 0b00001001;
    TCA0.SINGLE.CNT = 0x00;
}

void SuperLoopSleep(){
    // this function is to be run at the end of the super loop
    while(TCA0.SINGLE.CNT < 37500);
    TCA0.SINGLE.CNT = 0;
}

unsigned long SysCurrentTimeUS(){
    return 1+((11*TCA0.SINGLE.CNT) >> 4);
}

void Wait(int us){
    // evil bit trickery, this 1+(11/16)cnt is an approximation for 0.66667cnt
    // (3/2) = 3*us >> 2 to convert from us to cnt
    int start = TCA0.SINGLE.CNT;
    while(start + ((8*us) >> 5) >= TCA0.SINGLE.CNT);
}


int CURRENT_TIME = 0;

void ClockInitialization(){
    // wait till clock stablizes before procceding
    while(CLKCTRL.MCLKSTATUS & 0b00000001);
    
    // sets max period for receting clock 
    TCA0.SINGLE.PER = 0xFFFF;
    // enable TCA and set division to be fclk/ 16
    // this produces a resolution of 0.6667us
    TCA0.SINGLE.CTRLA = 0b00001001;
    TCA0.SINGLE.CNT = 0x00;
}

void SuperLoopSleep(){
    // this function is to be run at the end of the super loop
    while(TCA0.SINGLE.CNT < 37500);
    TCA0.SINGLE.CNT = 0;
}

unsigned long SysCurrentTimeUS(){
    return 1+((11*TCA0.SINGLE.CNT) >> 4);
}

void Wait(int us){
    // evil bit trickery, this 1+(11/16)cnt is an approximation for 0.66667cnt
    // (3/2) = 3*us >> 2 to convert from us to cnt
    int start = TCA0.SINGLE.CNT;
    while(start + ((8*us) >> 5) >= TCA0.SINGLE.CNT);
}


