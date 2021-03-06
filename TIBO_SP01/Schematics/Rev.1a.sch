EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 8300 2050 2    50   Input ~ 0
VCC
Text GLabel 8300 1650 2    50   Input ~ 0
RY-VCC
Text GLabel 6850 1950 0    50   Input ~ 0
IN1
Text GLabel 8300 2150 2    50   Input ~ 0
ADC_VREF
Text GLabel 8300 2350 2    50   Input ~ 0
AGND
Text GLabel 6850 1850 0    50   Input ~ 0
GND
Text GLabel 8300 2550 2    50   Input ~ 0
ADC0
$Comp
L Connector_Generic:Conn_01x20 J2
U 1 1 606B3F0E
P 8100 2550
F 0 "J2" H 8180 2542 50  0001 L CNN
F 1 "RASP_PI_PICO" H 8350 2450 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 8100 2550 50  0001 C CNN
F 3 "~" H 8100 2550 50  0001 C CNN
	1    8100 2550
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x20 J1
U 1 1 606AEFE8
P 7050 2550
F 0 "J1" H 7130 2542 50  0001 L CNN
F 1 "Conn_01x20x2" H 7300 2650 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x20_P2.54mm_Vertical" H 7050 2550 50  0001 C CNN
F 3 "~" H 7050 2550 50  0001 C CNN
	1    7050 2550
	1    0    0    -1  
$EndComp
Wire Notes Line
	2600 3000 1100 3000
Text Notes 1550 1650 0    50   ~ 0
CST_MODULE
Wire Notes Line
	1100 3000 1100 1500
Wire Notes Line
	2600 1500 2600 3000
Wire Notes Line
	1100 1500 2600 1500
$Comp
L Device:R R3
U 1 1 606B09FA
P 2950 2250
F 0 "R3" H 3020 2296 50  0000 L CNN
F 1 "77Ω" H 3020 2205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2880 2250 50  0001 C CNN
F 3 "~" H 2950 2250 50  0001 C CNN
	1    2950 2250
	1    0    0    -1  
$EndComp
Wire Notes Line
	2700 1500 5900 1500
Wire Notes Line
	2700 3500 5900 3500
Text Notes 3800 1650 0    50   ~ 0
BUFFER_MODULE
Wire Notes Line
	5900 3500 5900 1500
Wire Notes Line
	2700 1500 2700 3500
Text GLabel 5450 3300 2    50   Input ~ 0
AGND
Text GLabel 5400 2100 2    50   Input ~ 0
ADC_VREF
Text GLabel 5400 1850 2    50   Input ~ 0
ADC0
$Comp
L Device:D_TVS_ALT D1
U 1 1 6073D70F
P 2050 2250
F 0 "D1" V 2004 2330 50  0000 L CNN
F 1 "D_TVS_ALT" V 2095 2330 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 2050 2250 50  0001 C CNN
F 3 "~" H 2050 2250 50  0001 C CNN
	1    2050 2250
	0    1    1    0   
$EndComp
Connection ~ 3100 2650
Wire Wire Line
	4850 2100 5400 2100
Connection ~ 4850 3300
Wire Wire Line
	4850 3300 5450 3300
Wire Wire Line
	3600 2100 4850 2100
Connection ~ 4850 2100
Wire Wire Line
	4850 2150 4850 2100
Wire Wire Line
	3600 2100 3600 2350
Wire Wire Line
	3100 2650 3100 3000
Wire Wire Line
	3100 3000 4050 3000
Wire Wire Line
	3100 2650 3300 2650
$Comp
L Amplifier_Operational:LM358 U1
U 1 1 605E062D
P 3600 2650
F 0 "U1" H 3600 3017 50  0000 C CNN
F 1 "." H 3600 2926 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 3600 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 3600 2650 50  0001 C CNN
	1    3600 2650
	-1   0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U1
U 3 1 605E16AB
P 3500 2650
F 0 "U1" H 3458 2696 50  0000 L CNN
F 1 "." H 3458 2605 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 3500 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 3500 2650 50  0001 C CNN
	3    3500 2650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 6062D898
P 4850 2300
F 0 "R8" H 4920 2346 50  0000 L CNN
F 1 "20KΩ" H 4920 2255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4780 2300 50  0001 C CNN
F 3 "~" H 4850 2300 50  0001 C CNN
	1    4850 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 6062F1D7
P 4850 2900
F 0 "R9" H 4920 2946 50  0000 L CNN
F 1 "20KΩ" H 4920 2855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4780 2900 50  0001 C CNN
F 3 "~" H 4850 2900 50  0001 C CNN
	1    4850 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2550 3900 2550
Wire Wire Line
	4050 3000 4050 2750
Wire Wire Line
	4050 2750 3900 2750
Wire Wire Line
	4500 2550 4500 2750
$Comp
L Device:CP C1
U 1 1 6062E08C
P 4500 2900
F 0 "C1" H 4618 2946 50  0000 L CNN
F 1 "1uF" H 4618 2855 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H11.0mm_P2.00mm" H 4538 2750 50  0001 C CNN
F 3 "~" H 4500 2900 50  0001 C CNN
	1    4500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 2450 4850 2550
Wire Wire Line
	4850 2550 4500 2550
Connection ~ 4850 2550
Wire Wire Line
	4850 2550 4850 2750
Connection ~ 4500 2550
Wire Wire Line
	3600 3300 3600 2950
Wire Wire Line
	4500 3050 4500 3300
Connection ~ 4500 3300
Wire Wire Line
	4500 3300 3600 3300
Wire Wire Line
	4850 3050 4850 3300
Wire Wire Line
	4850 3300 4500 3300
Wire Notes Line
	800  1050 9200 1050
Text Notes 4800 1250 0    50   ~ 0
TIBO_SP01_MODULE
Text GLabel 7600 4050 1    50   Input ~ 0
GND
Text GLabel 7600 5550 3    50   Input ~ 0
VCC
Text GLabel 6850 2150 0    50   Input ~ 0
UART1_TX
Text GLabel 6850 2250 0    50   Input ~ 0
UART1_RX
Text GLabel 7000 5050 0    50   Input ~ 0
UART1_TX
Text GLabel 7000 5250 0    50   Input ~ 0
UART1_RX
Wire Notes Line
	6100 1200 9050 1200
Wire Notes Line
	9050 6000 6100 6000
Text Notes 7300 1350 0    50   ~ 0
MAIN_MODULE
$Comp
L Isolator:SFH617A-3 U2
U 1 1 60776834
P 2150 5000
F 0 "U2" H 2150 5325 50  0000 C CNN
F 1 "817C" H 2150 5234 50  0000 C CNN
F 2 "" H 1950 4800 50  0001 L CIN
F 3 "http://www.vishay.com/docs/83740/sfh617a.pdf" H 2150 5000 50  0001 L CNN
	1    2150 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60777ADA
P 2700 5300
F 0 "R2" H 2770 5346 50  0000 L CNN
F 1 "510Ω" H 2770 5255 50  0000 L CNN
F 2 "" V 2630 5300 50  0001 C CNN
F 3 "~" H 2700 5300 50  0001 C CNN
	1    2700 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 4900 2450 4350
Wire Wire Line
	2450 5100 2450 5300
Wire Wire Line
	2450 5300 2550 5300
Wire Wire Line
	1700 4900 1700 4750
Connection ~ 2450 4350
Text GLabel 1700 4150 1    50   Input ~ 0
VCC
Text GLabel 2450 4150 1    50   Input ~ 0
RY-VCC
Wire Wire Line
	1550 5100 1400 5100
$Comp
L Relay:DIPxx-1Cxx-51x K1
U 1 1 6076C6B0
P 3900 4650
F 0 "K1" H 4330 4696 50  0000 L CNN
F 1 "RELAY" H 4330 4605 50  0000 L CNN
F 2 "" H 4350 4600 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 3900 4650 50  0001 C CNN
	1    3900 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BCE Q1
U 1 1 60774680
P 3050 5300
F 0 "Q1" H 3241 5346 50  0000 L CNN
F 1 "Q_NPN_BCE" H 3241 5255 50  0000 L CNN
F 2 "" H 3250 5400 50  0001 C CNN
F 3 "~" H 3050 5300 50  0001 C CNN
	1    3050 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4950 3700 4950
Wire Wire Line
	3150 5100 3150 4950
Text GLabel 3150 5500 3    50   Input ~ 0
GND
$Comp
L Simulation_SPICE:DIODE D2
U 1 1 607ADBC7
P 3150 4650
F 0 "D2" V 3196 4570 50  0000 R CNN
F 1 "DIODE" V 3105 4570 50  0000 R CNN
F 2 "" H 3150 4650 50  0001 C CNN
F 3 "~" H 3150 4650 50  0001 C CNN
F 4 "Y" H 3150 4650 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 3150 4650 50  0001 L CNN "Spice_Primitive"
	1    3150 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3150 4500 3150 4350
Wire Wire Line
	3150 4350 3700 4350
Wire Wire Line
	3150 4800 3150 4950
Connection ~ 3150 4950
Wire Wire Line
	2450 4350 3150 4350
Connection ~ 3150 4350
Wire Wire Line
	1850 4900 1700 4900
Text GLabel 4000 4350 1    50   Input ~ 0
NC
Text GLabel 4200 4350 1    50   Input ~ 0
NO
Text GLabel 4100 4950 3    50   Input ~ 0
COM
$Comp
L Device:LED IN1
U 1 1 607AA55C
P 1700 5100
F 0 "IN1" H 1700 5000 50  0000 C CNN
F 1 "LED" H 1700 4900 50  0000 C CNN
F 2 "" H 1700 5100 50  0001 C CNN
F 3 "~" H 1700 5100 50  0001 C CNN
	1    1700 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6078F037
P 1700 4600
F 0 "R1" H 1770 4646 50  0000 L CNN
F 1 "1KΩ" H 1770 4555 50  0000 L CNN
F 2 "" V 1630 4600 50  0001 C CNN
F 3 "~" H 1700 4600 50  0001 C CNN
	1    1700 4600
	1    0    0    -1  
$EndComp
Text Notes 2650 3850 0    50   ~ 0
RELAY_MODULE
Text GLabel 1400 5100 0    50   Input ~ 0
IN1
Wire Notes Line
	1100 3700 4650 3700
Wire Wire Line
	2450 4150 2450 4350
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 607FF3B0
P 2050 4350
F 0 "JP1" H 2050 4585 50  0000 C CNN
F 1 "Jumper_2_Open" H 2050 4494 50  0000 C CNN
F 2 "" H 2050 4350 50  0001 C CNN
F 3 "~" H 2050 4350 50  0001 C CNN
	1    2050 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4350 1700 4350
Wire Wire Line
	1700 4150 1700 4350
Wire Wire Line
	1700 4350 1700 4450
Connection ~ 1700 4350
Wire Wire Line
	2250 4350 2450 4350
$Comp
L Transformer:CST1 T1
U 1 1 607605CF
P 1550 2250
F 0 "T1" V 1596 2206 50  0000 R CNN
F 1 "CST1" V 1505 2206 50  0000 R CNN
F 2 "" H 1550 2250 50  0001 C CNN
F 3 "https://www.coilcraft.com/pdfs/cst.pdf" H 1550 2250 50  0001 C CNN
	1    1550 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 2400 2050 2650
Connection ~ 2050 2650
Wire Wire Line
	2050 2650 2950 2650
Wire Wire Line
	2950 2400 2950 2650
Connection ~ 2950 2650
Wire Wire Line
	2950 2650 3100 2650
Wire Wire Line
	5400 1850 2950 1850
Wire Wire Line
	1550 1850 1550 1950
Wire Wire Line
	1550 2550 1550 2650
Wire Wire Line
	1550 2650 2050 2650
Wire Wire Line
	2050 2100 2050 1850
Connection ~ 2050 1850
Wire Wire Line
	2050 1850 1550 1850
Wire Wire Line
	2950 2100 2950 1850
Connection ~ 2950 1850
Wire Wire Line
	2950 1850 2050 1850
Text Notes 10000 2700 0    50   ~ 0
AC_LOAD
Wire Notes Line
	9400 2550 11000 2550
Wire Notes Line
	9400 4300 9400 2550
Wire Notes Line
	11000 4300 9400 4300
Wire Notes Line
	11000 2550 11000 4300
Wire Wire Line
	10550 3200 10550 3350
Wire Wire Line
	9850 3150 9850 3250
Text GLabel 10550 3200 1    50   Input ~ 0
COM
Text GLabel 9850 3150 1    50   Input ~ 0
NO
Wire Wire Line
	10550 4100 10550 3750
Wire Wire Line
	9850 4100 10550 4100
Wire Wire Line
	9850 3850 9850 4100
$Comp
L pspice:VSOURCE V1
U 1 1 6081AB9A
P 9850 3550
F 0 "V1" H 10078 3596 50  0000 L CNN
F 1 "220V_AC" H 10078 3505 50  0000 L CNN
F 2 "" H 9850 3550 50  0001 C CNN
F 3 "~" H 9850 3550 50  0001 C CNN
	1    9850 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:Lamp LA1
U 1 1 60810C8A
P 10550 3550
F 0 "LA1" H 10678 3596 50  0000 L CNN
F 1 "Lamp" H 10678 3505 50  0000 L CNN
F 2 "" V 10550 3650 50  0001 C CNN
F 3 "~" V 10550 3650 50  0001 C CNN
	1    10550 3550
	1    0    0    -1  
$EndComp
Text Notes 9900 4600 0    50   ~ 0
control from both relay/button\nled/dimmer?\ndetect button state
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 6083BCEE
P 4050 5750
F 0 "J3" H 3942 5425 50  0000 C CNN
F 1 "Conn_01x03_Female" H 3942 5516 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4050 5750 50  0001 C CNN
F 3 "~" H 4050 5750 50  0001 C CNN
	1    4050 5750
	-1   0    0    1   
$EndComp
Text GLabel 4250 5850 2    50   Input ~ 0
GND
Text GLabel 4250 5750 2    50   Input ~ 0
IN1
Text GLabel 4250 5650 2    50   Input ~ 0
VCC
Wire Notes Line
	9200 6200 800  6200
Wire Notes Line
	4650 6000 1100 6000
Wire Notes Line
	4650 3700 4650 6000
Wire Notes Line
	1100 3700 1100 6000
Wire Notes Line
	800  1050 800  6200
Wire Notes Line
	9200 1050 9200 6200
Wire Notes Line
	9050 1200 9050 6000
Wire Notes Line
	6100 1200 6100 6000
$Comp
L Custom:ESP8266 U3
U 1 1 608A39EF
P 7600 4750
F 0 "U3" H 7300 4050 50  0000 C CNN
F 1 "ESP-07" H 7300 3950 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 7600 4750 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 7250 4850 50  0001 C CNN
	1    7600 4750
	-1   0    0    1   
$EndComp
Text GLabel 8200 5150 2    50   Input ~ 0
VCC
$EndSCHEMATC
