/*
 * File:   ENEL_300_SPI_Master.c
 * Author: caleb
 *
 * Created on March 26, 2025, 8:13 AM
 */


#include <avr/io.h>

int main(void) {
//    IMPORTANT REGISTERS AND FUNCTIONS
//    Must figure out how to configure Slave Select (SS) in the port peripheral
//    SPIn.CTRLA(); // Selects the SPI master/slave operation by writing 
//                  // to the master/slave select bit in this register.
//                  // Also have to select clock speed by writing to the pre-scaler and clock bit 
//                  // in this register. Optionally, write the DATA ORDER bit
//                  // Enable the SPI by writing a '1' to the ENABLE bit in this register.
//    
//    SPIn.CTRLB(); // Optionally,  select the Data Transfer Mode by writing to the MODE bits in this register.
//                  // Optionally, set up the Buffer Mode by writing to the  BUFEN and BUFWR bits in this register. Probably not gonna use this because it looks yucky.
//                  // Optionally,  to disable the multi-master support in MASTER MODE, write a '1' to the Slave Select Disable (SSD) in this register.
//    SPIn.DATA();
//    
//    SPIn.INTFLAGS();
    
    PORTD.DIRCLR() = 0b00011110; // Set D1, D2, D3, and D4 as input pins

    PORTA.DIRSET() = 0b11110000; // Set A4-7 as output pins
    PORTA.OUTSET() = 0b10000000; // Default PA7 to high; Want it to not listening for commands yet???

    PORTMUX.SPIROUTEA() = 0b00000000; // Set SPI??
    PORTMUX.TCAROUTEA() = 0b00000000; // Set TCA??

    CLKCTRL.OSCHFCTRLA() = 0b00011000; // Apparently the max clock speed we can run SPI at is 1/2 the max clock speed; 12 MHz.

    SPIn.CTRLA() = 0b00100001; // Enable SPI and set as master.

    CPU.SREG() = 0b10000001; // Enables global interrupts???
    SPIn.INTCTRL() = 0b00000001; // Enables interrupts for the non-buffer mode.
    
    // Need to figure out how to write to the registers and such using the SPI interface
    // It seems like we need the AVR to be the master and the nRF to be the slave; receiving commands
    // The nRF on the other end must receive the data and transmit it to the AVR on the ECU

    while (1) 
    {
        if (SPIn.INTFLAGS() | 0b1110000)
        {
            SPIn.DATA() = // Receive data from button input and send it to the ECU.
        }       
    }
}
/* Operation 
 * Master Mode Operation: When the SPI is configured in Master mode, a write to the SPIn.DATA register will start a new transfer. The SPI
   master can operate in two modes, Normal and Buffer, as explained below.
 * 
 * After a transfer has completed, the Interrupt Flag (IF) will be set in the Interrupt Flags (SPIn.INTFLAGS) register. This
    will cause the corresponding interrupt to be executed if this interrupt and the global interrupts are enabled. Setting the
    Interrupt Enable (IE) bit in the Interrupt Control (SPIn.INTCTRL) register will enable the interrupt.
 * 
 * TRANSCEIVER LIBRARY: https://github.com/thehelvijs/nRF24L01-avr-bareminimum/blob/master/includes/spi.c
 * 
 * Transceiver pins
 * RaSCK: PA6 Serial Clock
 * RaMISO: PA5 Master In Slave Out
 * RaMOSI: PA4 Master Out Slave in
 * RaCSN: PA7 Chip Select Not (Slave Select) // Starts listening for commands when PA7 goes low
 * RaIRQ: PC1 Interrut Request
 * RaCE: PC2 Chip Enable // Should always be 1 for while the car is active I think
 * 
 * Tenative Button Input Pins
 * D1:
 * D2:
 * D3:
 * D4:
 * 
 /*