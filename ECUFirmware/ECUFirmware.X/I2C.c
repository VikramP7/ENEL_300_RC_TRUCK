/*
 * File:   I2C.c
 * Author: Caleb
 *
 * Created on April 8, 2025,
 */

#include <avr/io.h>

#include "I2C.h"
#include <util/delay.h>
#include <avr/interrupt.h>




void I2CInitialization(){
    if (I2C_MASTER)
    {
        // MUST CHANGE CLOCK for != 4 MHz /// 
        TWI0.MBAUD() =  0b00001111; //  Standard mode is up to 100kHz
                                    //  Need to figure out what our main clock is going to
                                    //  run at. I think we're at the default 4MHz
        
        PORTMUX.TWIROUTEA() = 0b00000000; // Selects  PA2 and PA3 as Serial Data (SDA) and Serial Clock (SCL), respectively
        TWI0.CTRLA() = 0b00000000;        // Initialize hold times and shit
        
        TWI0.MCTRLA() = 0b11000011;       // Enable read and write interrupts, enables
                                          // smart mode, and configures the MCU as
                                          // TWI master.
        
        TWI0.MCTRLB() = 0b00000100; // Enables Smart mode auto-acknowledge.
        
        TWI0.MSTATUS() = 0b00000001; // Forces the bus state to idle.
    }
    
    else
    {
        TWI0.SCRTLA() = 0b00000011; // Register used for interrupts, although I
                                    // don't have these enabled right now.
                                    // Currently this enables Smart mode and
                                    // enables the device as the TWI slave.
        
        TWI0.SADDR() = I2C_MTR_SLV_ADDR + 1; // This is a dummy address for now.
                                             // Change this macro to reflect which
                                             // device is acting as a slave. Demonic
                                             // addition trick to use the same macro
                                             // to configure master and slave side
                                             // operations.
        
    }
}

// Remains to be seen how these work with the Smart mode auto acknowledge.
// In theory, most of the code here should be handled by Smart mode, but this 
// looks way to easy.

void I2CMasterTransfer(char slaveAddr, char *data){  
    TWI0.MADDR = slaveAddr;
    
    WI_STALL;
    
    TWI0.MDATA() = data;

    WI_STALL;
    
    TWI0.MCTRLB( = 0b00000011; // Assert stop condition; end transaction
    _delay_ms(1);
}

char I2CMasterReceive(char slaveAddr, char *data){
    
    TWI0.MADDR = slaveAddr + 1; 
    
    RI_STALL;
    
    TWI0.MCTRLB( = 0b00000011; // Assert stop condition; end transaction
    
    _delay_ms(1);
    
    return data = TWI0.MDATA;
}

void I2CSlave(char *readData, char* writeData) {
    if(TWI0.SSTATUS & 0b01000010){ // Master Read Operation; master is requesting data
        TWI0.SDATA = readData;
        DI_STALL;
        // Thus far we're only sending one byte at a time so we can just wait
        // for the NACK I think
    }
    else if (TWI0.SSTATUS & 0b01000000){ // Master Write Operation; master is writing data
        writeData = TWI0.SDATA;
        DI_STALL;
    }
    
    _delay_ms(1);
    return;
}

