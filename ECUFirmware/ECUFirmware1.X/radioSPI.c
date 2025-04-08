/*
 * File:   RadioSPI.c
 * Author: vikra
 *
 * Created on April 2, 2025, 4:32 PM
 */

/*
 * USEFUL INFORMATION:
 * 
 * Transceiver pins:
 * RaSCK: PA6 Serial Clock
 * RaMISO: PA5 Master In Slave Out
 * RaMOSI: PA4 Master Out Slave in
 * RaCSN: PA7 Chip Select Not (Slave Select) // Starts listening for commands when PA7 goes low
 * RaIRQ: PC1 Interrut Request
 * RaCE: PC2 Chip Enable // Should always be 1 for while the car is active I think
 *  
 */


#include <avr/io.h>

#include "radioSPI.h"

char MASTER_RECEIVE_REQUEST[] = {0xFF, 0x00, 0x00, 0x00};

void SPIInitialization(){
    // sets the SPI output lines to be outputs
    PORTA.DIRSET = 0b11110000;
    
    PORTA.OUT |= 0b10000000;
    
    // sets the output pins for SPI0 to be default pin configuration
    // see useful information above
    PORTMUX.SPIROUTEA = 0b00000000;
    
    // disabled multi master
    SPI0.CTRLB = 0b00000100;
    
    // Enable SPI and set as master. And set clock prescaler to divide by 4
    // this runs SPI clock at 1.5MHz, can up to 10MHz MAX by changing prescaler
    // Also set Data order to send MSb first
    SPI0.CTRLA = 0b00100011; 
    SPI0.INTCTRL = 0b00000001;
    
}

void RadioTransmitCommand(char addr, char* data, int dataLength){
    PORTA.OUT &= 0b01111111;
    SPI0.DATA = addr;
    for(int i = 0; i < dataLength; i++){
        DATA_TRANSFER_STALL;
        SPI0.DATA = data[i];
        /*
        if(DATA_WCOL_CHECK){
            LedOn(LED_DEBUG_RED);
        }
        else{
            LedOff(LED_DEBUG_RED);
        }
        */      
    }
    DATA_TRANSFER_STALL;
    PORTA.OUT |= 0b10000000;
}
int RadioRecieveCommand(char addr, char* data, int dataLength){
    PORTA.OUT &= 0b01111111;
    SPI0.DATA = addr;
    DATA_TRANSFER_STALL;
    for(int i = 0; i < dataLength; i++){
        SPI0.DATA = 0b00000000;
        DATA_TRANSFER_STALL;
        data[i] = SPI0.DATA;
    }
    PORTA.OUT |= 0b10000000;
    if(data[0] == 0){
        // if data is not valid command / no data
        return -1;
    }
    else{
        return dataLength;
    }

}

void RadioInitialization(){
    // Set PC2 as  input pin for interrupt request
    PORTC.DIRSET = 0b00000100;
    PORTC.DIRCLR = 0b00000100;
    
    //RADIO_CONGIG_DATA 0b00001010
    //W_RADIO_CONFIG 0b00100000
    if(RADIO_MASTER){
        // sets master board to transmit by default
        RadioTransmitCommand(A_RADIO_CONFIG,  &(char){0b00001010}, 1);
    }
    else{
        // sets slave board to receive by default
        RadioTransmitCommand(A_RADIO_CONFIG,  &(char){0b00111011}, 1);
    }
    
    RadioTransmitCommand(A_RADIO_AUTOACK, &(char){0b00000001}, 1);
    RadioTransmitCommand(A_RADIO_RXADDR,  &(char){0b00000001}, 1);
    // sets to automatically retransmit dropped packets 15 times
    RadioTransmitCommand(A_RADIO_RETRANS, &(char){0b00001111}, 1);
    // sets packet size to 4 bytes
    RadioTransmitCommand(A_RADIO_PACKET_SIZE, &(char){0b00000100}, 1);
    //RadioTransmitCommand(A_RADIO_RF_CHAN, &(char){0b00000000}, 1); // leaving as default
    //RadioReceiveMessage(A_RADIO_RF_CHAN, &(char){0b00000000}, 1); // leaving as default
}

void RadioTransmitMessage(char data[], int dataLength){
    RadioTransmitCommand(W_TX_PAYLOAD, data, dataLength);
    if(!RADIO_MASTER){
        RadioTransmitCommand(A_RADIO_CONFIG,  &(char){0b00001011}, 1);
    }
}

int RadioReceiveMessage(char data[], int dataLength){
    if (!RADIO_MASTER){
        RadioRecieveCommand(R_RX_PAYLOAD, data, dataLength);
        if(data[0] == MASTER_RECEIVE_REQUEST[0]){
            RadioTransmitCommand(A_RADIO_CONFIG,  &(char){0b00001010}, 1);
            return 1;
        }
        return 0;
    }
    else if (RADIO_MASTER){
        // tell Slave board to go into transmit mode
        RadioTransmitMessage(MASTER_RECEIVE_REQUEST, 4);
        // config board into receiver mode
        RadioTransmitCommand(A_RADIO_CONFIG,  &(char){0b00001011}, 1);
        
        // poll for new data until data received is no longer invalid
        while(RadioRecieveCommand(R_RX_PAYLOAD, data, dataLength) == -1);
        RadioTransmitCommand(A_RADIO_CONFIG,  &(char){0b00001010}, 1);
    }
}