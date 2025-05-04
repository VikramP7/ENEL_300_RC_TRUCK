*<div align="right"> Vikram Procter, Caleb Garcia, Graham Coleman, Devon Calvin | Feb 12, 2025 </div>*

# DIDSBURY DIDDLERS & Co. Est. 2006 - README

## Project Overview
![Image of Truck]()

Remote control car for our ENEL 300 design class at the Schulich School of Engineering at University of Calgary.

Our car integrates a variety of features including distance measurement, metal detection, togglable head/tail lights, tank steering, and more. These features are implemented through 3 custom PCBs, designed in Altium or KiCad. Wireless locomotion control and light control is implemented using the HC-05 bluetooth transciever module. The physical design was inspired by a RAM 3500 Cummins 6.7 Twin Turbo and its stereotypical owner *(Devon)*. This allowed us to bring a part of Alberta culture to the academic enviroment through innovatation and design.

## Team Dynamic
![Group Photo w/ truck]()

The workload of the various systems  was divided amongst us based on interest and skill. Coleman was responsible for implemeting metal detection and distance measurement, in addtion to working on bluetooth communications, and controller design. Procter was responsible for ECU, power regulation, interboard communication, general code management and reveiew. Garcia was responsible for sofware development, 3D design and printing, and product selection. Calvin was responsible for motor driver development, 3D design, and Bluetooth communications.

## Systems Overview
![SystemArchitectureBlockDiagram](./Pictures/SystemArchitectureBlockDiagram.png)

The block diagram shows the operating architecture of the RC truck describing the PCB boards connections to eachother. There were four custom PCBs in which 3 were used in the final design. Each board design function and integration are described in detail in the sections bellow. 

All boards excluding the controler interface with eachother using an I2C bus, the ECU acts as the master on the bus and the Sensor Board/Motor Control Board act as slaves on the bus. The Controller board interfaces with the ECU alone using USART over a bluetooth connection.

The four boards include: 
- **Controller Board** | not utilized in the final design, but existed within the controler to offer UI to user.
- **ECU** | Electronics Control Board, acts to integrate funcionality of all other boards along with power supply regulation.
- **Sensor Board** | Finds and relays metal detection and distance sensing data.
- **Motor Control Board** | Houses motor drivers and receives data for locomotion control of vehicle.

## Sensors Systems (Sensor Board)
### Metal Detector
![Picture of Metal detector coil]()

The metal detection system is designed around a 555 timer IC and inductor capacitor (LC) circuit. The 555 timer produces an AC input inwhich the frequency response output varries with changes in inductance. By exposing the inductor coil placed on the bottom of the car to a copper sheet the inducatance of the coil changes and the frequency of the output changes in response.

The sensor board uses a built in timer module of the AVR128DB28 to measure the frecuency of the LC circuit. By tuning a threshold, the recorded frequency could be used to identify if the coil was exposed to metal. This information was then relayed over I<sup>2</sup>C to the ECU.


### Distance Sensor
An ultrasonic distance sensor was use to find the distance of the nearest object in frount of the car. The Sensor Board interfaced with the ultrasonic providing the appropriet 10 microsecond trigger and recording the echo. This raw echo data was transmitted over I<sup>2</sup>C to the ECU.

![Sensor board Schematic]()

## Power Systems (ECU)
### Battery
The battery we selected has a capacity of 3000 mAh with a nominal voltage of 12.6V, this was used to supply power to all boards and the motors excluding the metal detection circuit. This battery consisted of 4 cells with integrated charging and level balancing technology.

![Battery Picture]()

Through estimates of maximum current draw, the runtime on one full charge was calculated to be 228 minutes. This battery was initially chosen as previously we had sourced higher power motors, these higher power motors made the battery selection more reasonable for runtime calculations. However, in switching motors we decided not to change our battery selection as it was still sufficient for operation.

### Voltage Regulation (ECU)
![Picture of Bottom of ECU]()

To produce the voltage 5V and 3.3V lines linear dropout regulators (LDOs) were used. These regulators were placed on the ECU and using a custom Molex connector voltage levels were distributed to other boards (motor control board, and sensor board).

### Power Switch


## Communications Systems (ECU + Others)
### Bluetooth USART

![Picture of HC-05]()

The ECU board and controller boards preformed wireless communications via a USART over bluetooth communications module [HC-05](https://www.electronicwings.com/sensors-modules/bluetooth-module-hc-05-). The controller board would send movement control and light switch position data to the ECU board, describing positions of single axis joy sticks and if the lights should be on or not. The ECU board would send sensor data including distance and metal detection.

Three 8-bit data packets were sent from the controller. Two packets described the left and right joystick position encoded using sign magnitude. And the third packet contained the status of the light switch. 

One 8-bit packet was sent from the ECU to describe metal detection (most significant bit), and distance sensor data encoded in the 7 least significant bits. 

### I<sup>2</sup>C Interboard Communication
An I<sup>2</sup>C bus was utilized between boards within the vehicle (ECU, Motor Board, and Sensor Board). Connection between boards was accomplished using the same custom molex connector as described in the power regulation section.

![Picture of Molex connector standard]()

The ECU hosted the I<sup>2</sup>C bus housing the pull-up resistorsr and acted as the master on the bus. The ECU would relay motor control data recieved from the controller board to the Motor Board. The ECU would request data from the Sensor Board, recieving distance and metal detection data. I<sup>2</sup>C communications is a non-blocking function within the superloop of all boards. 

I<sup>2</sup>C packets took a very similar form to USART packets over bluetooth. The motor board would receive two 8-bit sign-magnitude packets one for each side of the vehicle. Two packets were received from the Sensor Board. The MSB of the first packet described the metal detection data, and the remaining 15 bits described the distance sensor data. The ECU would compress the data to 7 bits before relaying to the controler.

## Controller
### LCD UI
### Inputs

## Locomotion Systems (Motor Board)
### Motor Selection
### Motor Drivers