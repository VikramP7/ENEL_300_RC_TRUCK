/*
 * File:   Controller_Main.c
 * Author: caleb
 *
 * Created on April 21, 2025, 3:26 PM
 */


#include <avr/io.h>

#include "LCD.h"
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

#define F_CPU 16000000UL
#define PACKET_SIZE 3
volatile uint16_t result_right = 0;
volatile uint16_t result_left = 0;
volatile uint8_t result_8_bit = 0;
volatile uint8_t button_pressed = 0;
volatile uint16_t rx_buffer = 0;
volatile uint16_t tx_buffer[PACKET_SIZE];
volatile int count = 0;
volatile uint16_t last_rx = 1;

uint8_t adc_to_signmag_custom(uint16_t adc_val) {
    uint8_t sign = 0; 
    uint8_t magnitude = 0;

    if (adc_val >= 2071) {
        // Reverse direction (negative)
        sign = 0x80;
        // Scale to 0?127, where 2071 maps to 0 and 4095 maps to 127
        magnitude = (uint8_t)((float)(adc_val - 2071) * 127 / (4095 - 2071));
    }
    else if (adc_val <= 2039) {
        // Forward direction (positive)
        sign = 0x00;
        // Scale to 0?127, where 0 maps to 127 and 2039 maps to 0
        magnitude = (uint8_t)((float)(2039 - adc_val) * 127 / 2039);
    }
    else {
        // Deadzone ? output zero
        return 0x00;
    }

    // Ensure magnitude is within the 0?127 range
    if (magnitude > 127) magnitude = 127;

    return sign | magnitude;
}
 
 //Define Clock speed, 16MHZ and Do not enable global interrupts before running USART_Init()
 void setup_clock() {
     CCP = 0xD8;
     CLKCTRL.OSCHFCTRLA = 0b00011100;      // Set 16 MHz internal oscillator
     while (CLKCTRL.MCLKSTATUS & 0b00000001); // Wait for clock switch to complete
 }
 
 void USART_Transmit(uint16_t data) {
     while (!(USART0.STATUS & USART_DREIF_bm));  // Wait until buffer is empty
     USART0.TXDATAL = data;  // Send data
 }
 
 uint16_t USART_Receive(void) {
    
     while (!(USART0.STATUS & USART_RXCIF_bm)){         count++;
         if(count == 10000)
             break;
     }  // Wait for data
     return USART0.RXDATAL;  // Return received byte
 }
 
 void USART_Init() {
     // Set baud rate
     //USART1.BAUD = 0000010011100010;
     USART0.BAUD = 6666;
     // Set frame format: 8-bit, no parity, 1 stop bit (8N1)
     USART0.CTRLC = 0b00001011;
    
     // Set TXD (PC0 and PC1) as output
     PORTA.DIRSET = 0b00000001;
     PORTA.DIRCLR = 0b00000010; 
    
     // Enable transmitter and receiver
     USART0.CTRLB = 0b11000000;
 }
 
int main(void) {
    LCDIntialize();
    
    setup_clock();
    USART_Init();
    
        //Boot Sequence
    LCDClrScreen();
    for(int i = 0; i < 100; i++ ) _delay_ms(100);
    LCDWriteStr("Didsbury Diddlers");
    for(int i = 0; i < 100; i++ ) _delay_ms(100);
    LCDMoveCursor(0,1);
    LCDWriteStr("& Co. Est. 2006");
    for(int i = 0; i < 100; i++ ) _delay_ms(100);
    
    // Enable global interrupts.
    SREG = 0b10000000;

    // Set the ADC reference level to VDD.
    VREF.ADC0REF = 0b10000101;

    // Enable the ADC interrupt.
    ADC0.INTCTRL = 0b00000001;

    // Start by selecting PD2 (AIN7) as the ADC input.
    ADC0.MUXPOS = 0x03;  // 0x02 corresponds to PD2 (AIN7)

    // Select minimum clock divide.
    ADC0.CTRLC = 0x00;

    // Select single-ended mode, 12-bit resolution, and free-running mode.
    ADC0.CTRLA = 0b00000011;

    // Start conversion.
    ADC0.COMMAND = 0x01;

    // Set PORTD as input.
    PORTD.DIRCLR = 0b11111111;
    
    PORTA.DIRCLR = PIN7_bm;
     
    PORTA.PIN7CTRL = PORT_PULLUPEN_bm;
    
    LCDClrScreen();
    LCDWriteStr("Distance: ");

    while (1) {
        if((PORTA.IN & PIN7_bm) == 0){
            button_pressed = 1;
        }else{
            button_pressed = 0;
             }
        // Check if ADC result is ready.
        if (ADC0.INTFLAGS & 0b00000001) {
            // Check which channel is selected
            if (ADC0.MUXPOS == 0x04) {   // PD2 (AIN7)
                result_left = adc_to_signmag_custom(ADC0.RES);
                //result_right = ADC0.RES;   // Read ADC value for PD2
                ADC0.MUXPOS = 0x03;       // Switch to PD1 (AIN6)
            } else if (ADC0.MUXPOS == 0x03) {  // PD1 (AIN6)
                result_right = adc_to_signmag_custom(ADC0.RES);   // Read ADC value for PD1
                //result_left = ADC0.RES;
                ADC0.MUXPOS = 0x04;       // Switch back to PD2 (AIN7)
            }
            ADC0.INTFLAGS = 0b00000001;
            
            // --- Transmit control packet ---
            tx_buffer[0] = 0b00000000 | result_left;
            tx_buffer[1] = 0b00000000 | result_right;
            tx_buffer[2] = 0b00000000 | button_pressed;
            
            // Receive and Write LCD Data (Assuming that the metal detection data appears in the LSB)
            rx_buffer = USART_Receive();
            
            if(last_rx != rx_buffer) {
                LCDMoveCursor(10,0);
                uint8_t distance = (rx_buffer >> 1) * 17 / 8000;
                LCDWriteInt(rx_buffer >> 1, -1); // Write to the LCD. This will have to be formatted on the ECU side.
                LCDWriteStr("cm");
                LCDMoveCursor(0,1);
                if(rx_buffer & 0x01)
                    LCDWriteStr("Metal   "); // Extra spacing so we don't need to clear.
                else
                    LCDWriteStr("No Metal");
                last_rx = rx_buffer;
            }
            
            _delay_ms(1);
            
            // Transmit Data
            for (int i = 0; i < PACKET_SIZE; i++) {
                USART_Transmit(tx_buffer[i]);
                }
        }
        }
    }
