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


// ---- library functions ----
void ClockInitialization();
unsigned long SysCurrentTimeMS();
void SuperLoopSleep();
void Wait(int us);

#endif	/* XC_SYSTEM_TIME_H */
