# Stopwatch Project

## Overview

This project implements a simple stopwatch on the DE1-SoC board, featuring four 7-segment displays to show elapsed time. The stopwatch is controlled via buttons, allowing for start, stop, and reset functionality.

## Project Structure

- **src/**: Contains the VHDL source files for the project.
  - `stopwatch_top.vhd`: The top-level module that integrates the stopwatch functionality.
  - `sseg_counter.vhd`: A counter module for the 7-segment displays.
  - `sseg_rom.vhd`: A ROM module that converts binary values to 7-segment display patterns.

## Functionality
- **Start/Stop**: The stopwatch starts counting when powered on and stops when the button connected to `KEY(1)` is pressed. The count is held until the reset button is pressed.
- **Reset**: Pressing the button connected to `KEY(0)` resets the stopwatch to zero.

## Pin Assignments

Set up the pin assignments by importing the included `DE1_SOC.qsf` file. In Quartus Prime, navigate to **Assignments** > **Import Assignments**, then select the `.qsf` file located in the project directory.

## Clock Configuration

The project uses the 50 MHz clock (`CLOCK_50`) available on the DE1-SoC board. A PLL is instantiated to generate the necessary clock signals for the stopwatch operation.

## 7-Segment Display Mapping

The binary values for the elapsed time are displayed on the four 7-segment displays (`HEX0` to `HEX3`). The `sseg_rom` module is used to map the binary values to their corresponding 7-segment display patterns.

## Output Files

The compiled `.sof` file is located in the `output_files` folder after building the project in Quartus Prime. This file can be used to program the FPGA.

## How to Build

1. Open the project in Quartus Prime.
2. Import the pin assignments as described in the **Pin Assignments** section.
3. Compile the project to generate the `.sof` file.
4. Program the FPGA with the generated `.sof` file.

## Usage

- **Starting the Stopwatch**: The stopwatch begins counting automatically when powered on.
- **Stopping**: Press the button connected to `KEY(1)` to stop the count at the desired time. The count will not resume until reset.
- **Resetting**: Press the button connected to `KEY(0)` to reset the stopwatch to zero.

## Requirements

- DE1-SoC Board
- Quartus Prime Software
