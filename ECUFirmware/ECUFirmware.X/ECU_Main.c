#include <xc.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>

#include "peripherals/CLKCTRL/CLKCTRL.h"
#include "peripherals/RTC/RTC.h"
#include "peripherals/SLPCTRL/SLPCTRL.h"
#include "advanced_IO.h"

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

// Disbury Diddlers Proprietary Libraries Initialization
#include "leds.h"
#include "buzzer.h"

int main(void)
{           
    //Setup CPU Clocks
    CLKCTRL_init();
               
    //Setup Sleep Controller
    SLPCTRL_init();
    
    //Init RTC
    RTC_init();
    
    //Init the IO Expander
    advancedIO_init();
    
    //Enable Interrupts
    sei();
    
    //Set the I/O Expander Pins as Outputs
    advancedIO_setPinsAsOutputs(0xFF);
    
    //Set initial pattern
    advancedIO_setOutputsHigh(0xAA);
        
    while (1)
    {   
        //Sleep until the PIT triggers
        asm("SLEEP");
        
        //Flip the pin-state
        advancedIO_toggleBitsInRegister(ADV_IO_LATx, 0xFF);
    }
}
