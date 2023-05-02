EESchema Schematic File Version 4
LIBS:soilmoisture-cache
EELAYER 26 0
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
L Fanstel-modules:BT840 U1
U 1 1 5BBD5037
P 3950 2650
F 0 "U1" H 4000 4654 45  0000 C CNN
F 1 "BT840" H 4000 4570 45  0000 C CNN
F 2 "Fanstel_modules:BT840-BT840" H 3780 2800 20  0001 C CNN
F 3 "" H 3750 2650 60  0001 C CNN
	1    3950 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5BBD60DC
P 1400 1650
F 0 "#PWR0101" H 1400 1400 50  0001 C CNN
F 1 "GND" H 1405 1477 50  0000 C CNN
F 2 "" H 1400 1650 50  0001 C CNN
F 3 "" H 1400 1650 50  0001 C CNN
	1    1400 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1050 1400 1050
Wire Wire Line
	1400 1050 1400 1200
Wire Wire Line
	1500 1500 1400 1500
Connection ~ 1400 1500
Wire Wire Line
	1400 1500 1400 1650
Wire Wire Line
	1500 1350 1400 1350
Connection ~ 1400 1350
Wire Wire Line
	1400 1350 1400 1500
Wire Wire Line
	1500 1200 1400 1200
Connection ~ 1400 1200
Wire Wire Line
	1400 1200 1400 1350
$Comp
L power:GND #PWR0103
U 1 1 5BBD7652
P 6500 2950
F 0 "#PWR0103" H 6500 2700 50  0001 C CNN
F 1 "GND" V 6505 2822 50  0000 R CNN
F 2 "" H 6500 2950 50  0001 C CNN
F 3 "" H 6500 2950 50  0001 C CNN
	1    6500 2950
	0    -1   -1   0   
$EndComp
Text Label 6500 2050 0    50   ~ 0
SWDIO
Text Label 6500 2200 0    50   ~ 0
SWDCLK
Text Label 6500 2350 0    50   ~ 0
nRST
Text Label 8700 2250 2    50   ~ 0
nRST
Text Label 8700 1950 2    50   ~ 0
SWDIO
Text Label 8700 2050 2    50   ~ 0
SWDCLK
$Comp
L power:GND #PWR0102
U 1 1 5BBD64BC
P 9200 1350
F 0 "#PWR0102" H 9200 1100 50  0001 C CNN
F 1 "GND" H 9205 1177 50  0000 C CNN
F 2 "" H 9200 1350 50  0001 C CNN
F 3 "" H 9200 1350 50  0001 C CNN
	1    9200 1350
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J1
U 1 1 5BBD51D4
P 9200 1950
F 0 "J1" H 8759 1904 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 8759 1995 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD" H 9250 1400 50  0001 L TNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.faqs/attached/13634/cortex_debug_connectors.pdf" V 8850 700 50  0001 C CNN
	1    9200 1950
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0104
U 1 1 5BBD88BD
P 6000 3900
F 0 "#PWR0104" H 6000 3750 50  0001 C CNN
F 1 "+BATT" H 6015 4073 50  0000 C CNN
F 2 "" H 6000 3900 50  0001 C CNN
F 3 "" H 6000 3900 50  0001 C CNN
	1    6000 3900
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR0105
U 1 1 5BBD8948
P 9200 2550
F 0 "#PWR0105" H 9200 2400 50  0001 C CNN
F 1 "VDD" H 9218 2723 50  0000 C CNN
F 2 "" H 9200 2550 50  0001 C CNN
F 3 "" H 9200 2550 50  0001 C CNN
	1    9200 2550
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR0106
U 1 1 5BBD8996
P 6500 3100
F 0 "#PWR0106" H 6500 2950 50  0001 C CNN
F 1 "VDD" V 6517 3228 50  0000 L CNN
F 2 "" H 6500 3100 50  0001 C CNN
F 3 "" H 6500 3100 50  0001 C CNN
	1    6500 3100
	0    1    1    0   
$EndComp
$Comp
L BAT-HLD-001:BAT-HLD-001 U2
U 1 1 5BBD8E14
P 3050 5700
F 0 "U2" H 3050 5700 50  0001 L BNN
F 1 "BAT-HLD-001" H 3050 5700 50  0001 L BNN
F 2 "BAT-HLD-001:BAT-HLD-001" H 3050 5700 50  0001 L BNN
F 3 "None" H 3050 5700 50  0001 L BNN
F 4 "Unavailable" H 3050 5700 50  0001 L BNN "Field4"
F 5 "Linx Technologies" H 3050 5700 50  0001 L BNN "Field5"
F 6 "BAT-HLD-001-TR" H 3050 5700 50  0001 L BNN "Field6"
F 7 "None" H 3050 5700 50  0001 L BNN "Field7"
F 8 "CR2032 Battery Holder Surface Mount Tape and Reel" H 3050 5700 50  0001 L BNN "Field8"
	1    3050 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0107
U 1 1 5BBD90BC
P 3050 5600
F 0 "#PWR0107" H 3050 5450 50  0001 C CNN
F 1 "+BATT" H 3065 5773 50  0000 C CNN
F 2 "" H 3050 5600 50  0001 C CNN
F 3 "" H 3050 5600 50  0001 C CNN
	1    3050 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5BBD91D5
P 3050 5900
F 0 "#PWR0108" H 3050 5650 50  0001 C CNN
F 1 "GND" H 3055 5727 50  0000 C CNN
F 2 "" H 3050 5900 50  0001 C CNN
F 3 "" H 3050 5900 50  0001 C CNN
	1    3050 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Variable C1
U 1 1 5BBD936A
P 1600 6100
F 0 "C1" H 1715 6146 50  0000 L CNN
F 1 "C_Variable" H 1715 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1600 6100 50  0001 C CNN
F 3 "~" H 1600 6100 50  0001 C CNN
	1    1600 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5BBD94E2
P 1600 5450
F 0 "R1" H 1670 5496 50  0000 L CNN
F 1 "100k" H 1670 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1530 5450 50  0001 C CNN
F 3 "~" H 1600 5450 50  0001 C CNN
	1    1600 5450
	1    0    0    -1  
$EndComp
Text Label 1500 2950 2    50   ~ 0
CAP_CHARGE
Text Label 1600 5300 0    50   ~ 0
CAP_CHARGE
Text Label 1500 3100 2    50   ~ 0
CAP_DISCHARGE
$Comp
L Device:R R2
U 1 1 5BBD96BB
P 1250 6100
F 0 "R2" H 1320 6146 50  0000 L CNN
F 1 "220" H 1320 6055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1180 6100 50  0001 C CNN
F 3 "~" H 1250 6100 50  0001 C CNN
	1    1250 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 5950 1250 5950
Connection ~ 1600 5950
Text Label 1250 6250 2    50   ~ 0
CAP_DISCHARGE
Text Label 1600 5950 0    50   ~ 0
SOIL_READ
Wire Wire Line
	1600 5600 1600 5950
Text Label 1500 2650 2    50   ~ 0
SOIL_READ
$Comp
L power:GND #PWR0109
U 1 1 5BBD9BC0
P 1600 6250
F 0 "#PWR0109" H 1600 6000 50  0001 C CNN
F 1 "GND" H 1605 6077 50  0000 C CNN
F 2 "" H 1600 6250 50  0001 C CNN
F 3 "" H 1600 6250 50  0001 C CNN
	1    1600 6250
	1    0    0    -1  
$EndComp
$Comp
L ABS07-32.768KHZ-T:ABS07-32.768KHZ-T Y1
U 1 1 5BC00583
P 5200 5900
F 0 "Y1" H 5200 6137 50  0000 C CNN
F 1 "ABS07-32.768KHZ-T" H 5200 6046 50  0000 C CNN
F 2 "ABS07-32.768KHZ-T:XTAL320X150X90" H 5200 5900 50  0001 L BNN
F 3 "SMD-2 Abracon" H 5200 5900 50  0001 L BNN
F 4 "Abracon" H 5200 5900 50  0001 L BNN "Field4"
F 5 "None" H 5200 5900 50  0001 L BNN "Field5"
F 6 "ABS07-32.768KHZ-T" H 5200 5900 50  0001 L BNN "Field6"
F 7 "Unavailable" H 5200 5900 50  0001 L BNN "Field7"
F 8 "ABS07 Series 32.768 kHz ±20 ppm 12.5 pF -40 to +85 °C SMT Low Profile Crystal" H 5200 5900 50  0001 L BNN "Field8"
	1    5200 5900
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C2
U 1 1 5BC006CA
P 4900 6150
F 0 "C2" H 5078 6196 50  0000 L CNN
F 1 "12pF" H 5078 6105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4900 6150 50  0001 C CNN
F 3 "" H 4900 6150 50  0001 C CNN
	1    4900 6150
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C3
U 1 1 5BC007BA
P 5500 6150
F 0 "C3" H 5678 6196 50  0000 L CNN
F 1 "12pF" H 5678 6105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5500 6150 50  0001 C CNN
F 3 "" H 5500 6150 50  0001 C CNN
	1    5500 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5BC00A7B
P 5200 6400
F 0 "#PWR0110" H 5200 6150 50  0001 C CNN
F 1 "GND" H 5205 6227 50  0000 C CNN
F 2 "" H 5200 6400 50  0001 C CNN
F 3 "" H 5200 6400 50  0001 C CNN
	1    5200 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6400 5200 6400
Connection ~ 5200 6400
Wire Wire Line
	5200 6400 5500 6400
Text Label 4900 5900 2    50   ~ 0
XL1
Text Label 5500 5900 0    50   ~ 0
XL2
Text Label 1500 2350 2    50   ~ 0
XL1
Text Label 1500 2500 2    50   ~ 0
XL2
$EndSCHEMATC
