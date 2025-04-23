*<div align="right"> Written by Vikram Procter | January 11, 2025 </div>*

# DIDSBURY DIDDLERS & Co. Est. 2006 - Power Supply Board

## Purpose Overview
- Provide stable voltage sources for the various boards
- Provide adequete current and voltage supply for motors
- Required voltages is 3V3, 5V, 7.2V (5A)

## Resource Overview
### Power Chips
- 3V3 LDO <a href="https://www.digikey.ca/en/products/detail/stmicroelectronics/LDL1117S33R/7102071">LDL1117S33R</a>
- 5V LDO <a href="https://www.digikey.ca/en/products/detail/stmicroelectronics/LDL1117S50R/7102072">LDL1117S50R</a>
- 7V2 Buck <a href="https://www.digikey.ca/en/products/detail/texas-instruments/LM25085MYX-NOPB/2020207">LM25085MYX</a>

### Interfacing
- <a href="https://www.digikey.ca/en/products/detail/phoenix-contact/1984617/950849">Terminal blocks</a> for 3 voltage outputs and ground
- Terminal blocks for battery input

## Resource Specs
### Current limmiting
-   The Electronic Fuse Regulator [TPS259251DRCR](https://www.digikey.ca/en/products/detail/texas-instruments/TPS259251DRCR/5481850) is used to limit current draw to bellow 5A battery max
-   The limiting resistor $R_{Ilim}=\frac{I_{lim}-0.7}{3*10^{-5}}=142k\Omega$ based on pg.19
-   The $C_{dVdt}=\frac{T_{dVdt}}{10^6*V_{IN}}-70pF$ as described on pg. 15
-   No external capacitor $C_{dVdt}$ is required as thermal shutoff time for application is within acceptable limit as descibed on pg.21
-   The reset of the components are copied from the typical application section (pg.18)

### 3V3 LDO LDL1117S33R
-   Fixed Value, only extra components are caps specified by data sheet
### 5V LDO LDL1117S50R
-   Fixed Value, only extra components are caps specified by data sheet
### 7V2 Buck LM25085MYX
-   Output Voltage: EQ(15) Pg(18)
    - $R_{FB2}/R_{FB1}=(V_{out}/1.25)-1$
    - We are looking for $V_{out}=7.2V$ therefore $R_{FB2}/R_{FB1}=4.76$
    - These resistor values are supposed to be between 1k and 20k, so $R_{FB2}=18.7k\Omega, R_{FB1}=3.9k\Omega$
-   Finding the $R_T$ resistor:
    - Using the [STS5P3LLH6](https://www.digikey.ca/en/products/detail/stmicroelectronics/STS5P3LLH6/5244768) pFET with delay time difference (pg.3, pFET resistor):
    - $t_D=t_{d(off)}-t_{d(on)}=19.2ns-5.4ns=13.8ns$ 
    - Using equation 5 (pg. 13)
    - $R_T=\frac{Vout\times(Vin-1.56V)}{1.45\times10^{-7}\times Vin \times Fs}-\frac{t_D\times(Vin-1.56)}{1.47\times 10^{-7}}-1.4$
    - With $F_s=300kHz$ then $R_T=141.6k\Omega$
    - Yeilds duty of 0.6, and a $T_{ON}=2027.6ns$
-   Finding L1:
    - Current ripple amplitude, should be 20% of max current load
    - $I_{OR}=4A\times 20\% = 0.8A$
    - Based on a max input voltage of 12.6V, $L1=13.7\mu H$
-   Setting Current limmiting:
    - From pg. 14, eq.9: $I_{CL}=40\mu A \times \frac{R_{ADJ}}{R_{SEN}}$
    - This yeilds $\frac{R_{ADJ}}{R_{SEN}}=100000$ we can use $R_{ADJ}=1.392k\Omega$ and $R_{SEN}=10m\Omega$
-   Finding Cout:
    - $C_{out}$ can be any value between $2-40\mu F$
-   Finding R3, C1, C2:
    - Found $V_A=6.98$, and $R3\times C1=1.632\times 10^{-4}$
    - $C1 = 4000pF$, and $R3 = 40.8k\Omega$
    - C2 just has to be large therefore $C2=0.1\mu F$
-   The Cvcc cap val is recommended to be 0.47uF (pg.22) and should be placed close to Vin and Vcc pins
