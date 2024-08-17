# Seven-Segment Display Project

## Overview

This project is designed to rotate and display characters on six 7-segment displays using the DE1-SoC board. The design features a shift register that rotates the display data every half-second, creating a visual effect of moving text. The top module, `sseg_top`, manages the logic, including clock generation, timing, and data rotation. The display data is mapped to the 7-segment displays using a ROM-based lookup table.

## Project Structure

- **`src/`**: This directory contains the VHDL source files for the project.
  - **`sseg_top.vhd`**: The top-level VHDL file that orchestrates the overall operation. It includes the clock management, shift register logic, and instantiation of the ROM module for character mapping.
  - **`sseg_rom.vhd`**: A ROM module that stores the 7-segment display patterns for the characters. The ROM outputs the corresponding segment pattern based on the input address.
  
- **Pin Assignment File (`DE1_SOC.qsf`)**: This file contains the pin assignments for the DE1-SoC board, ensuring that the signals are correctly mapped to the FPGA's physical pins. It is included in the project directory.

## Functionality

### `sseg_top`

- **Clock Generation**: The input 50 MHz clock (`CLOCK_50`) is passed through a PLL to generate a 10 MHz clock (`clk_out`). This clock is used to drive the display update logic.

- **Shift Register**: The `shift_reg` signal holds the data to be displayed on the six 7-segment displays. The register shifts its data every 0.5 seconds to create a rotating effect.

- **Display Mapping**: The 4-bit segments of the `shift_reg` are mapped to the `HEX0` to `HEX5` outputs using the `sseg_rom` component, which contains the predefined 7-segment display patterns.

### `sseg_rom`

- **ROM Contents**: The ROM stores patterns corresponding to the characters "INTEL FPGA". Each 4-bit input address maps to a 7-segment pattern for the character.

## How to Use

1. **Compilation**: Open the project in Quartus, and compile the design.
2. **Pin Assignments**: Set up the pin assignments by importing the included `DE1_SOC.qsf` file. In Quartus Prime, navigate to **Assignments** > **Import Assignments**, then select the `DE1_SOC.qsf` file located in the project directory.
3. **Programming the FPGA**: Load the generated `.sof` file onto the DE1-SoC board.
4. **Operation**:
   - The display will start by showing "INTEL FPGA" on the six 7-segment displays.
   - Every 0.5 seconds, the displayed text will rotate to the left, creating a moving text effect.
5. **Reset**: Pressing `KEY(0)` will reset the display to the initial state and restart the rotation sequence.

## Customization

- **Changing Displayed Text**: Modify the `shift_reg` initialization in `sseg_top.vhd` and the ROM contents in `sseg_rom.vhd` to change the displayed text.
  
- **Adjusting Speed**: Modify the `ticks` counter in the `sseg_top` module to speed up or slow down the rotation effect.

## Requirements

- DE1-SoC Board
- Quartus Prime Software
