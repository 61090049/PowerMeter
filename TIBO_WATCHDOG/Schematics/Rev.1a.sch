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
$Comp
L Device:D_TVS D2
U 1 1 60CDAE6A
P 1950 6300
F 0 "D2" H 1950 6517 50  0000 C CNN
F 1 "D_TVS" H 1950 6426 50  0000 C CNN
F 2 "" H 1950 6300 50  0001 C CNN
F 3 "~" H 1950 6300 50  0001 C CNN
	1    1950 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 6000 2550 6000
Connection ~ 1950 6000
Wire Wire Line
	1950 6150 1950 6000
Wire Wire Line
	1950 6600 2350 6600
Connection ~ 1950 6600
Wire Wire Line
	1950 6450 1950 6600
Wire Wire Line
	1500 6000 1950 6000
$Comp
L Transformer:CST1 T1
U 1 1 605D3F76
P 1500 6300
F 0 "T1" H 1500 6725 50  0000 C CNN
F 1 "CST1" H 1500 6634 50  0000 C CNN
F 2 "" H 1500 6300 50  0001 C CNN
F 3 "https://www.coilcraft.com/pdfs/cst.pdf" H 1500 6300 50  0001 C CNN
	1    1500 6300
	0    -1   1    0   
$EndComp
$Comp
L Connector:AudioPlug3 J9
U 1 1 606834F6
P 1450 7000
F 0 "J9" H 1507 7367 50  0000 C CNN
F 1 "AudioPlug3" H 1507 7276 50  0000 C CNN
F 2 "" H 1550 6950 50  0001 C CNN
F 3 "~" H 1550 6950 50  0001 C CNN
	1    1450 7000
	1    0    0    1   
$EndComp
Wire Wire Line
	2350 6600 2350 6900
Wire Wire Line
	2350 6900 2050 6900
Wire Wire Line
	2050 7100 2550 7100
Wire Wire Line
	1500 6600 1950 6600
Wire Wire Line
	2550 6000 2550 7100
Text Notes 1400 5750 0    50   ~ 0
YHDC_SCT-013-000
Wire Notes Line
	800  5550 2800 5550
Wire Notes Line
	2800 5550 2800 7550
Wire Notes Line
	2800 7550 800  7550
Wire Notes Line
	800  7550 800  5550
$Comp
L Connector_Generic_MountingPin:Conn_01x15_MountingPin NODE_MCU_HEADER1
U 1 1 60AF59BB
P 7600 3550
F 0 "NODE_MCU_HEADER1" V 7733 3468 50  0001 C CNN
F 1 "NODE_MCU_HEADER" V 7700 3500 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" V 7733 3468 50  0001 C CNN
F 3 "~" H 7600 3550 50  0001 C CNN
	1    7600 3550
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic_MountingPin:Conn_01x15_MountingPin NODE_MCU_HEADER2
U 1 1 60AF84EE
P 7600 4250
F 0 "NODE_MCU_HEADER2" V 7825 4168 50  0001 C CNN
F 1 "CONN_HEADER_2X15" V 7700 4200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 7600 4250 50  0001 C CNN
F 3 "~" H 7600 4250 50  0001 C CNN
	1    7600 4250
	0    1    -1   0   
$EndComp
Connection ~ 6050 5100
Wire Wire Line
	6050 5100 8200 5100
Wire Wire Line
	5750 5100 6050 5100
Connection ~ 5400 5100
Wire Wire Line
	5400 5100 4500 5100
Wire Wire Line
	5750 5100 5400 5100
Connection ~ 5750 5100
Wire Wire Line
	8200 5000 8200 5100
Text GLabel 8200 5000 1    50   Input ~ 0
GND
Text GLabel 8200 4450 3    50   Input ~ 0
GND
Text GLabel 8300 3350 1    50   Input ~ 0
3V3
Text GLabel 8300 2750 3    50   Input ~ 0
3V3
Wire Wire Line
	7300 2850 7300 2700
Wire Wire Line
	7000 2850 7000 2800
Text GLabel 7300 3350 1    50   Input ~ 0
SDA
Text GLabel 7000 3350 1    50   Input ~ 0
SCL
Text GLabel 7300 2850 3    50   Input ~ 0
SDA
Text GLabel 7000 2850 3    50   Input ~ 0
SCL
Wire Wire Line
	8200 2750 8200 1700
Text GLabel 8200 3350 1    50   Input ~ 0
GND
Wire Wire Line
	8300 2400 8300 2750
Text GLabel 8200 2750 3    50   Input ~ 0
GND
Wire Wire Line
	6600 2100 6600 2200
Wire Wire Line
	6600 2200 5050 2200
Wire Wire Line
	5050 1850 5050 2200
Wire Wire Line
	5050 2200 5050 2800
Connection ~ 5050 2200
$Comp
L Connector:AudioJack2_Ground J1
U 1 1 606917E1
P 2600 1300
F 0 "J1" H 2632 1625 50  0000 C CNN
F 1 "AudioJack2_Ground" H 2632 1534 50  0000 C CNN
F 2 "Custom:Sparkfun_Audio_Jack_3.5mm" H 2600 1300 50  0001 C CNN
F 3 "~" H 2600 1300 50  0001 C CNN
	1    2600 1300
	0    1    1    0   
$EndComp
$Comp
L Connector:AudioJack2_Ground J3
U 1 1 606B09F2
P 1300 1300
F 0 "J3" H 1332 1625 50  0000 C CNN
F 1 "AudioJack2_Ground" H 1332 1534 50  0000 C CNN
F 2 "Custom:Sparkfun_Audio_Jack_3.5mm" H 1300 1300 50  0001 C CNN
F 3 "~" H 1300 1300 50  0001 C CNN
	1    1300 1300
	0    1    1    0   
$EndComp
$Comp
L Connector:AudioJack2_Ground J2
U 1 1 606917FE
P 1950 1300
F 0 "J2" H 1982 1625 50  0000 C CNN
F 1 "AudioJack2_Ground" H 1982 1534 50  0000 C CNN
F 2 "Custom:Sparkfun_Audio_Jack_3.5mm" H 1950 1300 50  0001 C CNN
F 3 "~" H 1950 1300 50  0001 C CNN
	1    1950 1300
	0    1    1    0   
$EndComp
$Comp
L Connector:AudioJack2_Ground J4
U 1 1 60A4F11A
P 3350 4250
F 0 "J4" H 3382 4575 50  0000 C CNN
F 1 "AudioJack2_Ground" H 3382 4484 50  0000 C CNN
F 2 "Custom:Sparkfun_Audio_Jack_3.5mm" H 3350 4250 50  0001 C CNN
F 3 "~" H 3350 4250 50  0001 C CNN
	1    3350 4250
	0    -1   -1   0   
$EndComp
Connection ~ 5750 2400
Wire Wire Line
	5750 1350 4500 1350
Wire Wire Line
	5750 2400 5750 1350
Wire Wire Line
	7000 1700 8200 1700
Wire Wire Line
	4950 2700 7300 2700
Wire Wire Line
	7000 2800 5050 2800
Wire Wire Line
	6250 2400 8300 2400
$Comp
L Device:R R5
U 1 1 6063CF20
P 2900 3550
F 0 "R5" H 2970 3596 50  0000 L CNN
F 1 "77Ω" H 2970 3505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2830 3550 50  0001 C CNN
F 3 "~" H 2900 3550 50  0001 C CNN
	1    2900 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 6069B1D0
P 2250 3550
F 0 "R6" H 2320 3596 50  0000 L CNN
F 1 "77Ω" H 2320 3505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2180 3550 50  0001 C CNN
F 3 "~" H 2250 3550 50  0001 C CNN
	1    2250 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 6069BD8D
P 1600 3550
F 0 "R7" H 1670 3596 50  0000 L CNN
F 1 "77Ω" H 1670 3505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1530 3550 50  0001 C CNN
F 3 "~" H 1600 3550 50  0001 C CNN
	1    1600 3550
	-1   0    0    1   
$EndComp
Connection ~ 6250 2400
Wire Wire Line
	6250 1700 6400 1700
Wire Wire Line
	6250 2400 6250 1700
Wire Wire Line
	5750 2400 6250 2400
Connection ~ 4950 2300
Wire Wire Line
	6700 2300 6700 2100
Wire Wire Line
	4950 2300 6700 2300
Wire Wire Line
	5750 2400 5750 3900
$Comp
L Custom:Si7050-A20 U5
U 1 1 60D507B3
P 6700 1700
F 0 "U5" V 7089 1700 50  0000 C CNN
F 1 "AHT10" V 7180 1700 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 6700 1300 50  0001 C CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/Si7050-1-3-4-5-A20.pdf" H 6500 2000 50  0001 C CNN
	1    6700 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 2550 6050 5100
Wire Wire Line
	2700 1850 2900 1850
Wire Wire Line
	2600 2600 2900 2600
Wire Wire Line
	2600 2600 2250 2600
Connection ~ 2600 2600
Wire Wire Line
	2050 1950 2250 1950
Wire Wire Line
	2250 1950 4100 1950
Connection ~ 2250 1950
Wire Wire Line
	1950 2600 2250 2600
Connection ~ 2250 2600
Wire Wire Line
	1300 2600 1600 2600
Wire Wire Line
	1600 2600 1950 2600
Connection ~ 1600 2600
Wire Wire Line
	1400 2050 1600 2050
Wire Wire Line
	1600 2050 4100 2050
Connection ~ 1600 2050
Wire Wire Line
	4000 1750 4100 1750
Wire Wire Line
	3550 3800 4000 3800
Wire Wire Line
	3550 3300 4100 3300
Connection ~ 3550 3800
Connection ~ 3550 3300
Wire Wire Line
	2900 3800 3350 3800
Wire Wire Line
	2900 3200 4100 3200
Connection ~ 2900 3800
Connection ~ 2900 3200
Wire Wire Line
	2900 2600 4000 2600
Connection ~ 2900 2600
Wire Wire Line
	2900 1850 4100 1850
Connection ~ 2900 1850
Wire Wire Line
	4000 3800 4000 4450
Connection ~ 4000 3800
Wire Wire Line
	3350 3800 3550 3800
Connection ~ 3350 3800
Wire Wire Line
	2700 3800 2900 3800
Connection ~ 2700 3800
Wire Wire Line
	2250 3800 2700 3800
Connection ~ 2250 3800
Wire Wire Line
	2050 3800 2250 3800
Connection ~ 2050 3800
Connection ~ 1600 3800
Wire Wire Line
	1600 3800 2050 3800
Wire Wire Line
	3550 3400 3550 3300
Wire Wire Line
	2900 3400 2900 3200
Wire Wire Line
	2600 3200 2900 3200
Wire Wire Line
	2250 3100 4100 3100
Connection ~ 2250 3100
Wire Wire Line
	2250 3400 2250 3100
Wire Wire Line
	1600 3000 4100 3000
Connection ~ 1600 3000
Wire Wire Line
	1600 3400 1600 3000
Wire Wire Line
	4000 2600 4000 3800
Wire Wire Line
	3550 3800 3550 3700
Wire Wire Line
	2900 3800 2900 3700
Wire Wire Line
	2250 3800 2250 3700
Wire Wire Line
	1600 3800 1600 3700
Wire Wire Line
	1400 3800 1600 3800
Wire Wire Line
	1950 3100 2250 3100
Wire Wire Line
	1300 3000 1600 3000
Wire Wire Line
	3250 3300 3550 3300
Wire Wire Line
	3250 4050 3250 3300
$Comp
L Connector:AudioJack2_Ground J7
U 1 1 605D4EF6
P 1400 4250
F 0 "J7" H 1432 4575 50  0000 C CNN
F 1 "AudioJack2_Ground" H 1432 4484 50  0000 C CNN
F 2 "Custom:Sparkfun_Audio_Jack_3.5mm" H 1400 4250 50  0001 C CNN
F 3 "~" H 1400 4250 50  0001 C CNN
	1    1400 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1300 4050 1300 3000
Wire Wire Line
	1400 3800 1400 4050
Wire Wire Line
	2700 4050 2700 3800
Wire Wire Line
	2050 4050 2050 3800
Wire Wire Line
	1950 4050 1950 3100
Wire Wire Line
	2600 4050 2600 3200
$Comp
L Connector:AudioJack2_Ground J6
U 1 1 60642BC4
P 2050 4250
F 0 "J6" H 2082 4575 50  0000 C CNN
F 1 "AudioJack2_Ground" H 2082 4484 50  0000 C CNN
F 2 "Custom:Sparkfun_Audio_Jack_3.5mm" H 2050 4250 50  0001 C CNN
F 3 "~" H 2050 4250 50  0001 C CNN
	1    2050 4250
	0    -1   -1   0   
$EndComp
$Comp
L Connector:AudioJack2_Ground J5
U 1 1 6063CF16
P 2700 4250
F 0 "J5" H 2732 4575 50  0000 C CNN
F 1 "AudioJack2_Ground" H 2732 4484 50  0000 C CNN
F 2 "Custom:Sparkfun_Audio_Jack_3.5mm" H 2700 4250 50  0001 C CNN
F 3 "~" H 2700 4250 50  0001 C CNN
	1    2700 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 4050 3350 3800
$Comp
L Device:R R4
U 1 1 60A4F112
P 3550 3550
F 0 "R4" H 3620 3596 50  0000 L CNN
F 1 "77Ω" H 3620 3505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3480 3550 50  0001 C CNN
F 3 "~" H 3550 3550 50  0001 C CNN
	1    3550 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4500 2550 4500 2800
Connection ~ 4500 2550
Wire Wire Line
	4500 2550 6050 2550
Wire Wire Line
	4500 2250 4500 2550
Wire Wire Line
	5050 2800 5050 3200
Connection ~ 5050 2800
Wire Wire Line
	4950 2700 4950 2300
Connection ~ 4950 2700
Wire Wire Line
	5050 3200 4900 3200
Wire Wire Line
	4900 1850 5050 1850
Wire Wire Line
	4950 1950 4900 1950
Wire Wire Line
	4900 3100 4950 3100
Wire Wire Line
	4000 4450 4000 4800
Connection ~ 4000 4450
Wire Wire Line
	4000 4800 4950 4800
Wire Wire Line
	4000 4450 4200 4450
Wire Wire Line
	1600 2150 1600 2050
Wire Wire Line
	2250 2150 2250 1950
Wire Wire Line
	2900 2150 2900 1850
Wire Wire Line
	1400 1500 1400 2050
Wire Wire Line
	2050 1500 2050 1950
Wire Wire Line
	2700 1500 2700 1850
$Comp
L Amplifier_Operational:LM358 U1
U 1 1 605E062D
P 4500 4450
F 0 "U1" H 4500 4817 50  0000 C CNN
F 1 "." H 4500 4726 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 4500 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 4500 4450 50  0001 C CNN
	1    4500 4450
	-1   0    0    -1  
$EndComp
$Comp
L Analog_ADC:ADS1115IDGS U4
U 1 1 605DA881
P 4500 3200
F 0 "U4" H 4500 2619 50  0000 C CNN
F 1 "ADS1115IDGS" H 4500 2710 50  0000 C CNN
F 2 "Custom:PinSocket_1x10_ADS1115" H 4500 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1113.pdf" H 4450 2300 50  0001 C CNN
	1    4500 3200
	1    0    0    1   
$EndComp
Wire Wire Line
	4500 3700 4500 3900
Connection ~ 4500 3900
Wire Wire Line
	4500 3900 4500 4150
$Comp
L Amplifier_Operational:LM358 U1
U 3 1 605E16AB
P 4400 4450
F 0 "U1" H 4358 4496 50  0000 L CNN
F 1 "." H 4358 4405 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 4400 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 4400 4450 50  0001 C CNN
	3    4400 4450
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 6062D898
P 5750 4100
F 0 "R8" H 5820 4146 50  0000 L CNN
F 1 "20KΩ" H 5820 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5680 4100 50  0001 C CNN
F 3 "~" H 5750 4100 50  0001 C CNN
	1    5750 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 6062F1D7
P 5750 4700
F 0 "R9" H 5820 4746 50  0000 L CNN
F 1 "20KΩ" H 5820 4655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5680 4700 50  0001 C CNN
F 3 "~" H 5750 4700 50  0001 C CNN
	1    5750 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4350 4800 4350
Wire Wire Line
	4950 4800 4950 4550
Wire Wire Line
	4950 4550 4800 4550
Wire Wire Line
	5400 4350 5400 4550
Wire Wire Line
	4500 3900 5750 3900
$Comp
L Device:CP C1
U 1 1 6062E08C
P 5400 4700
F 0 "C1" H 5518 4746 50  0000 L CNN
F 1 "1uF" H 5518 4655 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H11.0mm_P2.00mm" H 5438 4550 50  0001 C CNN
F 3 "~" H 5400 4700 50  0001 C CNN
	1    5400 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4250 5750 4350
Wire Wire Line
	5750 3950 5750 3900
Connection ~ 5750 3900
Wire Wire Line
	5750 4350 5400 4350
Connection ~ 5750 4350
Wire Wire Line
	5750 4350 5750 4550
Connection ~ 5400 4350
Wire Wire Line
	4500 5100 4500 4750
Wire Wire Line
	5400 4850 5400 5100
Wire Wire Line
	5750 4850 5750 5100
$Comp
L Analog_ADC:ADS1115IDGS U3
U 1 1 6066EE84
P 4500 1850
F 0 "U3" H 4500 1269 50  0000 C CNN
F 1 "ADS1115IDGS" H 4500 1360 50  0000 C CNN
F 2 "Custom:PinSocket_1x10_ADS1115" H 4500 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1113.pdf" H 4450 950 50  0001 C CNN
	1    4500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1500 2600 2600
$Comp
L Device:R R1
U 1 1 606917EC
P 2900 2300
F 0 "R1" H 2970 2346 50  0000 L CNN
F 1 "77Ω" H 2970 2255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2830 2300 50  0001 C CNN
F 3 "~" H 2900 2300 50  0001 C CNN
	1    2900 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2450 2900 2600
Wire Wire Line
	1950 1500 1950 2600
$Comp
L Device:R R2
U 1 1 60691806
P 2250 2300
F 0 "R2" H 2320 2346 50  0000 L CNN
F 1 "77Ω" H 2320 2255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2180 2300 50  0001 C CNN
F 3 "~" H 2250 2300 50  0001 C CNN
	1    2250 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2450 2250 2600
Wire Wire Line
	1300 1500 1300 2600
$Comp
L Device:R R3
U 1 1 606B09FA
P 1600 2300
F 0 "R3" H 1670 2346 50  0000 L CNN
F 1 "77Ω" H 1670 2255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1530 2300 50  0001 C CNN
F 3 "~" H 1600 2300 50  0001 C CNN
	1    1600 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2450 1600 2600
Connection ~ 1950 2600
Text Notes 5700 1000 0    50   ~ 0
TIBO_WATCHDOG
Wire Notes Line
	8600 5100 8600 1000
Wire Notes Line
	10650 5100 8600 5100
Wire Notes Line
	10650 1000 10650 5100
Wire Notes Line
	8600 1000 10650 1000
Text GLabel 9050 3500 0    50   Input ~ 0
SCL
Text GLabel 9050 3400 0    50   Input ~ 0
SDA
Connection ~ 9650 4750
Wire Wire Line
	9650 4900 10050 4900
Wire Wire Line
	9650 4750 9650 4900
Wire Wire Line
	9650 4750 9900 4750
Wire Wire Line
	9650 4600 9650 4750
Text GLabel 10050 4900 2    50   Input ~ 0
GND
Text GLabel 9900 4750 2    50   Input ~ 0
USB_V-
Text GLabel 10250 2300 2    50   Input ~ 0
3V3
Text GLabel 9650 1800 1    50   Input ~ 0
USB_V+
Wire Notes Line
	800  5350 800  750 
Wire Notes Line
	800  750  10900 750 
Wire Notes Line
	10900 750  10900 5350
Wire Notes Line
	800  5350 10900 5350
Wire Notes Line
	3000 5550 6100 5550
Text GLabel 4650 7150 0    50   Input ~ 0
HV-
$Comp
L Custom:ZMPT101B U6
U 1 1 606786C6
P 5150 6950
F 0 "U6" H 5150 6483 50  0000 C CNN
F 1 "ZMPT101B" H 5150 6574 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 5150 6600 50  0001 C CNN
F 3 "https://www.tracopower.com/products/tmr2.pdf" H 5150 6450 50  0001 C CNN
	1    5150 6950
	-1   0    0    -1  
$EndComp
Text GLabel 4650 6750 0    50   Input ~ 0
HV+
$Comp
L pspice:VSOURCE V1
U 1 1 60834CF0
P 3500 6650
F 0 "V1" H 3728 6696 50  0000 L CNN
F 1 "220V_AC" H 3728 6605 50  0000 L CNN
F 2 "" H 3500 6650 50  0001 C CNN
F 3 "~" H 3500 6650 50  0001 C CNN
	1    3500 6650
	1    0    0    -1  
$EndComp
Text GLabel 5450 6300 2    50   Input ~ 0
USB_V-
Text GLabel 5450 6100 2    50   Input ~ 0
USB_V+
$Comp
L Converter_ACDC:VTX-214-010-105 PS1
U 1 1 6062D315
P 5050 6200
F 0 "PS1" H 5050 6567 50  0000 C CNN
F 1 "USB_WALL_WART_5V_2A" H 5050 6476 50  0000 C CNN
F 2 "" H 5050 6650 50  0001 C CNN
F 3 "http://www.vigortronix.com/10WattACDCPCBPowerModule.aspx" H 6150 5400 50  0001 C CNN
	1    5050 6200
	1    0    0    -1  
$EndComp
Text GLabel 4650 6300 0    50   Input ~ 0
HV-
Text GLabel 4650 6100 0    50   Input ~ 0
HV+
Wire Wire Line
	3500 6150 3800 6150
Wire Wire Line
	3500 6350 3500 6150
Wire Wire Line
	3500 7100 3500 6950
Wire Wire Line
	3800 7100 3500 7100
Text GLabel 3800 7100 2    50   Input ~ 0
HV-
Text GLabel 3800 6150 2    50   Input ~ 0
HV+
Text GLabel 5650 6750 2    50   Input ~ 0
3V3
Text GLabel 5650 6950 2    50   Input ~ 0
GND
Text GLabel 4000 1500 1    50   Input ~ 0
AIN0
Wire Wire Line
	4000 1500 4000 1750
Wire Notes Line
	6100 5550 6100 7550
Wire Notes Line
	6100 7550 3000 7550
Wire Notes Line
	3000 5550 3000 7550
Text Notes 4300 5700 0    50   ~ 0
AC_HV_MODULE
$Comp
L Custom:NODE_MCU_DOIT_V1_ESP8266 U7
U 1 1 60637BF9
P 9650 3200
F 0 "U7" H 9600 5150 50  0000 L CNN
F 1 "NODE_MCU_DOIT_V1_ESP8266 (REF_ONLY)" H 8850 5050 50  0000 L CNN
F 2 "" H 9650 1700 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 9350 3250 50  0001 C CNN
	1    9650 3200
	-1   0    0    -1  
$EndComp
Text GLabel 5650 7150 2    50   Input ~ 0
AIN0
Wire Wire Line
	4950 3100 4950 2700
Wire Wire Line
	4950 2300 4950 2050
Wire Wire Line
	4900 2050 4950 2050
Connection ~ 4950 2050
Wire Wire Line
	4950 2050 4950 1950
$EndSCHEMATC
