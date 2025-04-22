#include <avr/io.h>

#include "bluetoothM.h"

void BluetoothInitialize(){
    // Set baud rate
    USART0.BAUD = 6666;
    
    // Set frame format: 8-bit, no parity, 1 stop bit (8N1)
    USART0.CTRLC = 0b00001011;

    PORTMUX.USARTROUTEA = 0b00000001;

    // Set TXD (PA0) and RXD (PA1)
    PORTA.DIRSET = 0b00010000;
    PORTA.DIRCLR = 0b00100000; 

    // Enable transmitter and receiver
    USART0.CTRLB = 0b11000000;
    
    // set PA6 as 5V power for radio
    PORTA.DIR |= 0b01000000;
    PORTA.OUTSET |= 0b01000000;
}

void BluetoothTransmit(uint16_t data){
    while (!(USART0.STATUS & USART_DREIF_bm));  // Wait until buffer is empty
    USART0.TXDATAL = data;  // Send data
}

uint16_t BluetoothReceive(){
    // Wait for data
    uint16_t timeOutCount = 0;
    while (!(USART0.STATUS & USART_RXCIF_bm) && (timeOutCount<10000))  
    {
        timeOutCount++;
    }
    return USART0.RXDATAL;  // Return received byte
}

