# VGA Project - DE1-SoC Board

## Overview
This project implements a VGA controller on the Terasic DE1-SoC board. It generates 640x480 resolution VGA signals and displays color patterns based on pixel positions.

## Features
- Resolution: 640x480 @ 60fps
- Color Output: Region-based colors (White, Yellow, Cyan, Green,etc)
- Testbench: Simulates VGA controller behavior and verifies RGB output.

# Setup
## Prerequisites
- Quartus Prime Lite
- QuestaSim
- DE1-Soc Board
- VGA monitor
- VGA cables

## Steps
1. Clone the project:
```
git clone https://github.com/ojakinlade/Terasic-DE1-SoC-Projects/tree/main/Projects/P6_VGA
```
2. Open the project in Quartus Prime and compile
3. Import Pin assignments from the DE1_SOC.qsf provided in the project directory. 
4. Program the FPGA with the .sof file in the output_files directory.

## Testbench
Run the testbench in QuestaSim to verify the correct operation of the VGA controller and compare the RGB output with the expected values.

## Images
### Output on VGA monitor 
![WhatsApp Image 2024-10-01 at 16 58 31](https://github.com/user-attachments/assets/bc2e934b-50ed-4376-8419-b4a052ee4a7a)
![WhatsApp Image 2024-10-01 at 16 58 31 (1)](https://github.com/user-attachments/assets/aa86f7d2-faae-4680-b4ef-47e538725b2f)

### RTL Viewer
![Screenshot from 2024-10-01 17-06-14](https://github.com/user-attachments/assets/a751ca35-d2ae-45dc-884f-f6b44b95462d)


## Customization
The color generation logic can easily be modified in the pixel_gen.vhd module to display different patterns or images. Simply adjust the ranges of pixel_x and pixel_y, and assign the desired RGB values.

## Useful Resources
- Pong P. Chu - FPGA Prototyping by VHDL Examples_ Xilinx MicroBlaze MCS SoC-Wiley-Blackwell (2017)
- FPGA Prototyping By VHDL Examples (Xilinx Spartan-3 Version) - Pong P. Chu
- Terasic DE1-SoC User Manual
