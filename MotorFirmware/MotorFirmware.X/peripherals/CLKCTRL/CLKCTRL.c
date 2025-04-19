#include "CLKCTRL.h"

#include <xc.h>

void CLKCTRL_init(void)
{    
    //Set HF Oscillator to 16 MHz
    _PROTECTED_WRITE(CLKCTRL.OSCHFCTRLA, CLKCTRL_FRQSEL_16M_gc); //  Changed from original for Bluetooth connectivity
    
    //Enable CLKOUT
    //_PROTECTED_WRITE(CLKCTRL.MCLKCTRLA, CLKCTRL_CLKOUT_bm); 
}