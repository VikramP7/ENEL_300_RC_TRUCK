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
#include "bluetoothM.h"
#include <util/delay.h>

// i2c library stuffs
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "advanced_IO.h"
#include "peripherals/TWI/TWI_host.h"

/* ------- MACROS --------*/
/* I2C */
#define MOTOR_BOARD_ADDR ((uint8_t)0x11)
#define SENSOR_BOARD_ADDR ((uint8_t)0x22)

/* Bluetooth */
#define BT_RX_PACKET_SIZE 3

/* Lights */
#define LIGHTS_ON_AVERAGE_SIZE 10

/*------- Function Declarations -----*/

int main(void) {
    /* Low level Initialization */
    /* Global System Time Initialization */
    ClockInitialization();
    
    /* Led initialization */
    LedInitialization();
    LedOn(LED_DEBUG_RED); // turn on red while initializing
    
    /* Bluetooth USART Initialization */
    BluetoothInitialize();
    
    /* PWM audio initialization */
    
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
    
    /*------- I2C VARS ----------*/
    static uint8_t motorRightSpeed = 0x00;
    static uint8_t motorLeftSpeed = 0x00;
    
    static uint8_t distanceMeasured = 0;
    static uint8_t metalDetected = 0;
    
    /*------- Bluetooth VARS ------*/
    static uint8_t btReceiveData[BT_RX_PACKET_SIZE] = {0,0,0};
    
    /*---------- LIGHTS ----------*/
    static uint8_t lightsOn = 0;
    
    /*------- GENERAL VARS ----------*/
    int heartBeatOn = 0;
    while (1) {   
        /* -------- Bluetooth Comms ------------*/
        uint8_t transmitPackage = (distanceMeasured & 0xfe) | (metalDetected);
        BluetoothTransmit(transmitPackage);
        
        _delay_ms(1);
        
        for(int i = 0; i < BT_RX_PACKET_SIZE; i++){
            btReceiveData[i] = BluetoothReceive();
        }
        
        motorLeftSpeed = btReceiveData[1];
        motorRightSpeed = btReceiveData[0];
        
        // averaging light data to reduce error packet issues
        if(btReceiveData[2]){
            lightsOn += (lightsOn > LIGHTS_ON_AVERAGE_SIZE) ? 0:1;
        }else{
            lightsOn += (lightsOn < 1 ) ? 0:-1;
        }
        
        /* --------- LIGHTS ---------*/
        if(lightsOn>5){
            LedOn(LED_ALL);
        }
        else{
            LedOff(LED_ALL);
        }
        
        
        /* ----------- I2C ------------*/
        // send motor bytes
        TWI_sendByte(MOTOR_BOARD_ADDR, (uint8_t)motorRightSpeed);
        TWI_sendByte(MOTOR_BOARD_ADDR, (uint8_t)motorLeftSpeed);
        
        // receive data from sensor boards
        uint8_t byte1 = 0x00;
        uint8_t byte2 = 0x00;
        TWI_readByte(SENSOR_BOARD_ADDR, &byte1);
        TWI_readByte(SENSOR_BOARD_ADDR, &byte2);
        distanceMeasured = byte2;//((byte2 << 7) + byte1);
        metalDetected = (byte1 & 0x01) ? 0x01:0x00;
        
        
        
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
