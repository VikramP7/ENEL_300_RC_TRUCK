/* 
 * File:   bluetooth.h
 * Author: vikra
 *
 * Created on April 21, 2025, 3:38 PM
 */

#ifndef BLUETOOTHM_H
#define	BLUETOOTHM_H

void BluetoothInitialize();
void BluetoothTransmit(uint16_t data);
uint16_t BluetoothReceive();

#endif	/* BLUETOOTH_H */

