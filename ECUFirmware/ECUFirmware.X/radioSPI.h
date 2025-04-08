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

#define RADIO_MASTER 0

#define R_RX_PAYLOAD    0b01100001
#define W_TX_PAYLOAD    0b10100000
#define A_RADIO_CONFIG  0b00100000
#define A_RADIO_AUTOACK 0b00000001
#define A_RADIO_RXADDR  0b00000010
#define A_RADIO_RETRANS 0b00000100
#define A_RADIO_RF_CHAN 0b00000101
#define A_RADIO_STATUS_REG 0b00000111
#define A_RADIO_PACKET_SIZE 0b00010001

#define DATA_TRANSFER_STALL while(!(SPI0.INTFLAGS & 0b10000000))
#define DATA_WCOL_CHECK (SPI0.INTFLAGS & 0b01000000)


// #include <>

extern const unsigned char MASTER_RECEIVE_REQUEST[];

//  Insert declarations
void SPIInitialization(); // Set up AVR registers
void RadioTransmitCommand(char addr, char* data, int dataLength); // useful for RadioInitialization
int RadioRecieveCommand(char addr, char* data, int dataLength); // useful for RadioInitialization
void RadioInitialization(); // Set up radio (nRF) registers

void RadioTransmitMessage(char data[], int dataLength); // once initialized send data to other board
int RadioReceiveMessage(char data[], int dataLength); // once initialized receive data from other board


#endif	/* XC_RADIO_SPI_H */

