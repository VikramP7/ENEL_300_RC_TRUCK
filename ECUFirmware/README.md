*<div align="right"> April 5, 2025 </div>*

# DIDSBURY DIDDLERS & Co. Est. 2006 - ECU Board

## RADIO PROTOCOL
### Radio Packet (4 bytes)
-   BYTE 0: Header
    - Receive request: 0xFF
    - Controller data: 0xCE
    - ECU data: 0xEC
-   BYTE 1, 2, 3: (ECU data)
    - Bit 0: metal detection
    - Bit [1:24]: distance
-   BYTE 1: (Controller Data)
    - Buttons
-   BYTE 2:
    - Left Steering as Two's complement 
-   BYTE 3:
    - Right Steering as Two's complement


## I2C PROTOCOL

