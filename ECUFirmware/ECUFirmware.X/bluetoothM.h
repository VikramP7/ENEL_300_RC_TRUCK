/* 
 * File:   bluetooth.h
 * Author: vikra
 *
 * Created on April 21, 2025, 3:38 PM
 */

#ifndef BLUETOOTHM_H
#define	BLUETOOTHM_H


void BluetoothInitialize();
/* BluetoothInitialize()
 * Requires: nothing
 * Promises: Initialization of USART Bluetooth
 * 
 * Configures PA0 and PA1 as pins used for USART
 * Enables Rx and Tx
 */

void BluetoothTransmit(uint16_t data);
/* BluetoothTransmit()
 * Requires: 16-bit data packet, in which only the lower 8-bits will be transmitted
 * Promises: To transmit the lower 8-bits over USART
 */

uint16_t BluetoothReceive();
/* BluetoothReceive()
 * Requires: The transmitting USART device to be transmitting
 * Promises: Returns the 16-bit packet, in which only the lower 8-bits are used
 * 
 * this function is blocking and will wait until receive 
 */

#endif	/* BLUETOOTH_H */

