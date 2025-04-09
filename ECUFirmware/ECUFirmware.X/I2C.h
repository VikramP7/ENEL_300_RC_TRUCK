/* 
 * File: radioSPI.h
 * Author: Vikram Procter and Caleb Garcia
 * Comments: ENEL 300 Didsbury Diddlers & Co, est. 2006
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef XC_RADIO_SPI_H
#define	XC_RADIO_SPI_H

#include <xc.h> // include processor files - each processor file is guarded.

#define I2C_MASTER 1

// Least significant bit of these values is set to one so that it is possible
// to add one for configuration purposes.

#define I2C_MTR_SLV_ADDR 0b11111110
#define I2C_SNSR_SLV_ADDR 0b01111110
#define I2C_SCRN_SLV_ADDR 0b00111110

#define WI_STALL while(!(TWI0.MSTATUS & 0b01000000)) // Write interrupt stall
#define RI_STALL while(!(TWI0.MSTATUS & 0b10000000)) // Read interrupt stall
#define MASTER_STOP TWI0.MCTRLB() = 0b00000111 // Ends master transmission
#define DI_STALL while(!(TWI0.SSTATUS & 0b10000000)) // Slave data interrupt stall                                                

// #include <>


//  Insert declarations
void I2CInitialization(); // Initializes TWI depending on the value of the 
                          // I2C_MASTER macro; whether the board is set as a
                          // master or a slave.

// As of now these definitions are slightly shoddy as they necessitate the
// creation of both master and slave side transfer and receive commands.
// We might be able to fix this issue with the use of function pointers or 
// function overloading.

void I2CMasterTransfer(char *data, int dataLength); // Initiates a data transfer.
                                                    // Must decide on data length.
void I2CMasterReceieve(char *data); // Receives and writes data to a local variable

void I2CSlaveTransfer(char *data, int dataLength); // Initiates a data transfer.
                                                    // Must decide on data length

void I2CSlaveRecieve(char *data); // Receives and writes data to a local variable



#endif	/* XC_RADIO_SPI_H */

