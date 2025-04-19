#include <xc.h>


// I2C Library Initialization
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "peripherals/CLKCTRL/CLKCTRL.h"
#include "peripherals/TWI/TWI_client.h"
#include "TWI_blockData.h"

FUSES = {
	.WDTCFG = 0x00, // WDTCFG {PERIOD=OFF, WINDOW=OFF}
	.BODCFG = 0x06, // BODCFG {SLEEP=SAMPLE, ACTIVE=ENABLE, SAMPFREQ=128Hz, LVL=BODLEVEL0}
	.OSCCFG = 0x00, // OSCCFG {CLKSEL=OSCHF}
	.SYSCFG0 = 0xC8, // SYSCFG0 {EESAVE=CLEAR, RSTPINCFG=RST, CRCSEL=CRC16, CRCSRC=NOCRC}
	.SYSCFG1 = 0x0C, // SYSCFG1 {SUT=8MS, MVSYSCFG=DUAL}
	.CODESIZE = 0x00, // CODESIZE {CODESIZE=User range:  0x0 - 0xFF}
	.BOOTSIZE = 0x00, // BOOTSIZE {BOOTSIZE=User range:  0x0 - 0xFF}
};

LOCKBITS = 0x5CC5C55C; // {KEY=NOLOCK}

#define DATA_SIZE 16

int main(void)
{           
    //Setup CPU Clocks
    CLKCTRL_init();
    
    //Setup TWI I/O
    TWI_initPins();
    
    //Setup TWI Interface
    TWI_initClient(0x40);
    
    //Data to R/W to. (Must be volatile)
    volatile uint8_t data[DATA_SIZE];
    
    //Initialize Memory to 0x00
    for (uint8_t i = 0; i < DATA_SIZE; i++)
    {
        data[i] = 0x00;
    }
    
    //Attach R/W Buffers
    //Note: The buffers can be separated, or they can be the same memory, if desired.
    setupReadBuffer(&data[0], 16);
    setupWriteBuffer(&data[8], 8);
    
    //Assign ISRs to Block Memory Library
    TWI_assignByteWriteHandler(&_TWI_StoreByte);
    TWI_assignByteReadHandler(&_TWI_RequestByte);
    TWI_assignStopHandler(&_onTWIStop);
    
    //Enable Interrupts
    sei();
        
    while (1)
    {   
        //Wait...
    }
}
