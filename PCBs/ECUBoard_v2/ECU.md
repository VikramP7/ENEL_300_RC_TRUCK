*<div align="right"> Written by Vikram Procter | Feb 12, 2025 </div>*

# DIDSBURY DIDDLERS & Co. Est. 2006 - ECU Board

## Purpose Overview
- Houses power supply providing voltages for self and other boards
- Provide adequete current and voltage supply for motors
- Connect to other boards using 6 position Molex connector to provide I2C lines and power
- Sends and recieves data over I2C for motor control, distance sensor, metal detection, light control
- If extra ports measure battery voltage
- Control buzzer

## v2 Improvements
- ~~Power indicators for 5V, 3V3, and battery~~
- ~~Fix screw terminals~~
- ~~fix programming header~~ 
- ~~Remove fuse and buck~~
- ~~Lots of test points / vias for osciliscope~~
- ~~Good power switch~~
- ~~Fix Radio connector~~
- ~~Silk screen labels out the oiseau~~
- ~~Mounting holes in the corners~~



## Resource Overview
### Connectors
- Molex Connectors (Board side) [2125201006](https://www.digikey.ca/en/products/detail/molex/2125201006/13693762?s=N4IgTCBcDa4IxgKxgAxxSgbCAugXyA)
- Molex Connector (Wire side) [2125141006](https://www.digikey.ca/en/products/detail/molex/2125141006/13693743?s=N4IgTCBcDa4IxgKxwCxwAzoGwgLoF8g)
- Molex Crimps (in wire side) [2125153102](https://www.digikey.ca/en/products/detail/molex/2125153102/13693772)

### Buzzer
- PWM buzzer should be connected to PA0 or PC0 for comparitor TCA0 waveform generation, use 0 Ohm for config
- Port A or C can be configured in PORTMUX, and specific n pin is enabled in TCAn.CTRLB.CMPnEN
- Tenative Buzzer 5V buzzer [WT-1205](https://www.digikey.ca/en/products/detail/soberton-inc/WT-1205/479674)

### Debug LEDs
- Debug leds will be attached to PORTD, LED are wired active low
- There is a red LED ([SML-D12U1WT86](https://www.digikey.ca/en/products/detail/rohm-semiconductor/SML-D12U1WT86/5843853)) and a green LED ([SML-D12P8WT86](https://www.digikey.ca/en/products/detail/rohm-semiconductor/SML-D12P8WT86/1641798))

### Head Lights, Tail Lights and Light Bar:
- All lights will be connected via screw terminals
- Lights will be controlled through 

### I2C Interface
- Ports PA2 (SDA MS) and PA3 (SCL MS) are used for the two I2C lines
- ECU will be configured as master, other boards are configured as slaves
- The lines connected to the bus are described in the connector section

### Radio SPI Interface
- Using the [NRF24L01+PA+LNA](https://www.amazon.ca/Aideepen-NRF24L01-Transceiver-Breakout-Compatible/dp/B07ZGQ2X7Q?psc=1&pd_rd_w=Y23yF&content-id=amzn1.sym.1d3fa88f-aa61-4d59-895c-470dda2309ea&pf_rd_p=1d3fa88f-aa61-4d59-895c-470dda2309ea&pf_rd_r=JPZBBXBD13EF7SSG62RF&pd_rd_wg=VORpK&pd_rd_r=4c1f84a5-b26b-48cf-a5c1-2cd251cb3906&ref_=sspa_dk_detail_1&sp_csd=d2lkZ2V0TmFtZT1zcF9kZXRhaWxfdGhlbWF0aWM=)
- PinOut from header to radio board: 
    - pin(Headerpin)=NAME(radiopin)
    - pin1=MISO(pin7)
    - pin2=SCK(pin5)
    - pin3=CE(pin3)
    - pin4=GND(pin1)
    - pin5=VCC(pin2)
    - pin6=CSN(pin4)
    - pin7=MOSI(pin6)
    - pin8=IRQ(pin8)
- Pin connections to AVR (as described in SPI and pinout sections):
    - AVRpin=NAME=radio header pin
    - PA5=MISO=pin1
    - PA6=SCK=pin2
    - PA4=MOSI=pin7
    - PA7=SS/CSN=pin6
    - PC1=IRQ=pin8
    - PC2=CE=pin3

### Power and Bus Connector
- Refer to following image for connector specifications
![Molex Connector Standar](/CarMolex.png)
- In the schematic 
    - pin1=SCL
    - pin2=GND
    - pin3=7V2
    - pin4=SDA
    - pin5=3V3
    - pin6=5V


### Microcontroller
- [AVR128DB28](https://www.digikey.ca/en/products/detail/microchip-technology/AVR128DB28-I-SP/12807495) is the main microcontroller
- Placed in dips IC connector [ED281DT](https://www.digikey.ca/en/products/detail/on-shore-technology-inc/ED281DT/4147600)