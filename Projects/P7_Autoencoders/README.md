# DE1-SoC Autoencoder Implementation

This repository contains a simple 4-2-4 autoencoder implemented on the Terasic DE1-SoC FPGA board using Verilog, with weights trained in PyTorch. The project demonstrates a basic hardware realization of an autoencoder, compressing a 4-bit input to a 2-bit latent space and reconstructing it back to 4 bits, leveraging the DE1-SoC’s switches and LEDs for I/O.

## Overview

- **Purpose**: Showcase an autoencoder’s encode-decode structure in hardware.
- **Components**:
  - **Python**: PyTorch script to train weights on sample 4-bit binary patterns.
  - **Verilog**: FPGA design with a top-level module (`de1_auto_top.v`) and core autoencoder logic (`auto_enc_core.v`).
- **Hardware**: Terasic DE1-SoC (Cyclone V FPGA).
- **I/O**:
  - Input: 4-bit vector from switches SW[3:0] (up = `0`, down = `1` due to pull-ups).
  - Output: 4-bit vector on LEDs LEDR[3:0] (active-low, `0` = on, `1` = off).

## Prerequisites

### Software
- **Python 3.6+**: For training weights.
- **PyTorch**: Install via pip:
  ```bash
  pip install torch
- Quartus Prime Lite: For Verilog synthesis and FPGA programming.

### Hardware
- **Terasic DE1-SoC Board**: With USB-Blaster for programming.
- **OS**: Linux

## Setup and Usage
1. **Training Weights with PyTorch**: The weights are trained using a simple 4-2-4 autoencoder in Python. The script is located in `model/autoencoders.py` directory.

2. Verilog Implementation
- Top-Level Module: `src/de1_auto_enc_top.v` 
  - It connects the DE1-SoC's I/O to the autoencoder core.
- Core Module: `src/auto_enc_core.v`
  - Implements the 4-2-4 autoencoder with trained, quantized weights.

## Notes
- **weights**: Quantized from PyTorch output (scaled x4, offset +3)
- **Threshold**: Adjusted to `>5` to match scaling.