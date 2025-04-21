/* 
 * File:   LCD.h
 * Author: caleb
 *
 * Created on April 21, 2025, 1:32 PM
 */

#ifndef LCD_H
#define	LCD_H

#define DISPLAY_ADDR 0x27


void LCDIntialize(void);
void LCDWriteStr(char* str);
void LCDClrScreen(void);
void LCDWriteChar(char chr);
void LCDWriteInt(uint8_t num, uint8_t decimal);
void LCDMoveCursor(uint8_t x, uint8_t y);

// Geoff Code
void LCDWrite(uint8_t nibble, uint8_t rs, uint8_t rw, uint8_t ledOn);
void I2CWrite(uint8_t address, uint8_t data);


#endif	/* LCD_H */

