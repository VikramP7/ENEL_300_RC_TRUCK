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

void SPIInitialization(){
    // sets the SPI output lines to be outputs
    PORTA.DIRSET = 0b11110000;
    
    // sets the output pins for SPI0 to be default pin configuration
    // see useful information above
    PORTMUX.SPIROUTEA = 0b00000000;
    
    // disabled multi master
    SPI0.CTRLB = 0b00000100;
    
    // Enable SPI and set as master. And set clock prescaler to divide by 16
    // this runs SPI clock at 1.5MHz, can up to 10MHz MAX by changing prescaler
    // Also set Data order to send MSb first
    SPI0.CTRLA = 0b00100011; 
    
}

RadioTransmitCommand(char addr, char* data, int dataLength){
    SPI0.DATA = addr;
    for(int i = 0; i < dataLength; i++){
        DATA_TRANSFER_STALL();
        SPI0.DATA = data[i];
    }
}
void RadioRecieveCommand(char addr, char* data, int dataLength){
    SPI0.DATA = addr;
    DATA_TRANSFER_STALL();
    for(int i = 0; i < dataLength; i++){
        SPI0.DATA = 0b00000000;
        DATA_TRANSFER_STALL();
        data[i] = SPI0.DATA;
    }
    if(data[0] != 0){
        return -1;
    }
    else{
        return dataLength;
    }
}

void RadioInitialization(){
    /*Check MASTER value to determine which initialization to do*/
    // turn on chip enable for radio
    PORTC.DIRSET = 0b00000100;
    PORTC.OUT   |= 0b00000100;
    
    //RADIO_CONGIG_DATA 0b00001010
    //W_RADIO_CONFIG 0b00100000
    if(RADIO_MASTER){
        // sets master board to transmit by default
        RadioTransmitCommand(A_RADIO_CONFIG,  &(0b00001010), 1);
    }
    else{
        // sets slave board to receive by default
        RadioTransmitCommand(A_RADIO_CONFIG,  &(0b00001011), 1);
    }
    
    RadioTransmitCommand(A_RADIO_AUTOACK, &(0b00000001), 1);
    RadioTransmitCommand(A_RADIO_RXADDR,  &(0b00000001), 1);
    RadioTransmitCommand(A_RADIO_RETRANS, &(0b00001111), 1);
    RadioTransmitCommand(A_RADIO_RETRANS, &(0b00001111), 1);
    //RadioTransmitCommand(A_RADIO_RF_CHAN, &(0b00000000), 1); // leaving as default
    //RadioReceiveMessage(A_RADIO_RF_CHAN, &(0b00000000), 1); // leaving as default
    
    
}

void RadioTransmitMessage(char* data, int dataLength){
    if (RADIO_MASTER){
        RadioTransmitCommand(W_TX_PAYLOAD, data, dataLength);
    }
    
}

void RadioReceiveMessage(char* data, int dataLength){
    if (!RADIO_MASTER){
        RadioRecieveCommand(R_RX_PAYLOAD, data, dataLength);
    }
    else if (RADIO_MASTER){
        // tell Slave board to go into transmit mode
        RadioTransmitMessage(&MASTER_RECEIVE_REQUEST, 4);
        // config board into receiver mode
        RadioTransmitCommand(A_RADIO_CONFIG,  &(0b00001011), 1);
        
        RadioRecieveCommand(R_RX_PAYLOAD, data, dataLength);
    }
}

