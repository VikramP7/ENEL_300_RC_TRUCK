/*
 * File:   newavr-main.c
 * Author: vikra
 *
 * Created on April 1, 2025, 5:06 PM
 */

// External file includes
#include <avr/io.h>
#include "leds.h"
//#include "leds.c"
#include "systemTime.h"

// i2c library stuffs
#include <avr/interrupt.h>
#include <avr/eeprom.h>

//#include "peripherals/CLKCTRL/CLKCTRL.h"
//#include "peripherals/RTC/RTC.h"
//#include "peripherals/SLPCTRL/SLPCTRL.h"
#include "advanced_IO.h"
#include "peripherals/TWI/TWI_host.h"

/* ------- MACROS --------*/
/* I2C */
#define MOTOR_BOARD_ADDR ((uint8_t)0x11)
#define SENSOR_BOARD_ADDR ((uint8_t)0x22)

/*------ Main Loop Functions ------*/
void RadioLoop();
void I2CLoop();


/*------- Function Declarations -----*/

int main(void) {
    /* Low level Initialization */
    /* Global System Time Initialization */
    ClockInitialization();
    
    /* Led initialization */
    LedInitialization();
    LedOn(LED_DEBUG_RED); // turn on red while initializing
    
    /* PWM audio initialization */
    
    /* SPI initialization */
    //SPIInitialization();
    
    /* I2C */
    //Init the IO Expander
    advancedIO_init();
    
    // enable global interupts after initialization is done
    sei();
    /* Driver Initialization */
    /* Radio SPI initialization */
    //RadioInitialization();
    
    /* finished initialization turn off debug red led */
    LedOff(LED_DEBUG_RED);
    
    /*------- RADIO VARS ----------*/
    /*
    PORTD.DIRSET = 0b00000001;
    PORTD.OUTSET |= 0b00000001;
    char message[] = {0xEC, 0xFF, 0x12, 0x34};
    char status[1];
    */
    
    /*------- I2C VARS ----------*/
    static int motorRightSpeed = 0x7F;
    static int motorLeftSpeed = 0x7F;
    
    static long distanceCM = 0;
    static int metalDetected = 0;
    
    /*------- GENERAL VARS ----------*/
    int heartBeatOn = 0;
    while (1) {
        /* ------ RADIO PART ------ DEBUG
        if(RADIO_IRQ_CHECK){
            //LedOn(LED_DEBUG_RED);
        }
        RadioTransmitMessage(message, RADIO_PACKET_SIZE);
        Wait(500);
        RadioRecieveCommand(RA_RADIO_STATUS_REG, status, 1);
        //RadioRecieveCommand(RA_RADIO_RETRANS, status, 1);
        if(status[0] & 0b00100000){
            LedOn(LED_DEBUG_RED);
        }
        if(ledOn){
            LedOff(LED_DEBUG_GREEN);
            ledOn = 0;
        }else{
            LedOn(LED_DEBUG_GREEN);
            ledOn = 1;
        }
        */
        
        /* ----------- I2C ------------*/
        // send motor bytes
        TWI_sendByte(MOTOR_BOARD_ADDR, (uint8_t)motorRightSpeed);
        TWI_sendByte(MOTOR_BOARD_ADDR, (uint8_t)motorLeftSpeed);
        
        // receive data from sensor boards
        uint8_t byte1 = 0x00;
        uint8_t byte2 = 0x00;
        //TWI_readByte(SENSOR_BOARD_ADDR, *byte1);
        //TWI_readByte(SENSOR_BOARD_ADDR, *byte2);
        distanceCM = (byte1 << 7) + (byte2 >> 1);
        metalDetected = byte2 & 0x01;
        
        /* -------- Bluetooth Comms ------------*/
        
        
        
        if(heartBeatOn){
            LedOff(LED_DEBUG_RED);
            heartBeatOn = 0;
        }
        else{
            LedOn(LED_DEBUG_RED);
            heartBeatOn = 1;
        }
        SuperLoopSleep();
    }
}
