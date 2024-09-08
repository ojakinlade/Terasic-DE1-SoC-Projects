# HPS_FPGA_Template Setup Guide (Linux)

This guide details how to set up the `HPS_FPGA_Template` for the Terasic DE1-SoC board on a Linux machine. It integrates the Hard Processor System (HPS) with FPGA logic, facilitating hardware-software co-design projects.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Step-by-Step Setup](#step-by-step-setup)
  1. [Install Quartus Prime Lite 23.1](#1-install-quartus-prime-lite-231)
  2. [Install Intel SoC EDS and Arm DS](#2-install-intel-soc-eds-and-arm-ds)
  3. [Configure USB Rules](#3-configure-usb-rules)
  4. [Use `direnv` for Project Environment](#4-use-direnv-for-project-environment)
  5. [Generate Template Top File](#5-generate-template-top-file)
  6. [Convert Verilog to VHDL](#6-convert-verilog-to-vhdl)
  7. [Configure Platform Designer and Add Components](#7-configure-platform-designer-and-add-components)
  8. [Generate Header File for HPS](#8-generate-header-file-for-hps)
  9. [Write and Compile C Code](#9-write-and-compile-c-code)
- [Conclusion](#conclusion)
- [Useful Resources](#useful-resources)
- [TO-DO](#to-do)

## Introduction

This template allows you to leverage the capabilities of both the HPS and FPGA on the Terasic DE1-SoC board, facilitating hardware-software co-design projects. The Linux setup includes necessary installations and environment configurations.

## Prerequisites

Ensure you have the following:

- **Quartus Prime Lite**: FPGA development tool (Version 23.1 was used).
- **Intel SoC EDS**: Required for HPS development.
- **Arm DS Toolchain**: For compiling HPS code.
- **Terasic DE1-SoC board**: Connected to your development environment.

## Step-by-Step Setup

### 1. Install Quartus Prime Lite 23.1

1. Download **Quartus Prime Lite 23.1** from Intel's website.
2. Run the installation script:

   ```bash
   sudo ./QuartusLiteSetup-23.1.run
   ```

3. Follow the on-screen instructions to complete the installation

4. Add Quartus to your PATH in `.bashrc`:

   ```bash
   export PATH=$PATH:{Install_directory}/intelFPGA_lite/23.1/quartus/bin
   ```

### 2. Install Intel SoC EDS and Arm DS

1. Download the **Intel SoC Embedded Design Suite (EDS)**.
2. Install by running:

   ```bash
   sudo ./SoCEDSProSetup-23.1.run
   ```

3. Download and extract the **Arm DS toolchain**. Extract it to `/opt`:

   ```bash
   sudo tar -xvf arm-gnu-toolchain.tar.xz -C /opt/
   ```

4. Add all environment variables to `.envrc`:

   ```bash
   
   ```

### 3. Configure USB Rules

1. Create a new file in `/etc/udev/rules.d/` to set up USB access for the Terasic DE1-SoC board. Use the following command:

   ```bash
   sudo nano /etc/udev/rules.d/51-usbblaster.rules
   ```

2. Add this line for the USB-Blaster:

   ```
   # USB Blaster
   SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
   SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
   SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"

   # USB Blaster II
   SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
   SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
   ```

3. Reload the udev rules:

   ```bash
   sudo udevadm control --reload-rules
   sudo udevadm trigger
   ```

### 4. Use `direnv` for Project Environment

1. Install `direnv`:

   ```bash
   sudo apt install direnv
   ```

2. Enable `direnv` in your shell by adding this to `.bashrc`:

   ```bash
   eval "$(direnv hook bash)"
   ```

3. In your project directory (`HPS_FPGA_Template`), create a `.envrc` file:

   ```bash
   echo "INTEL FPGA QUARTUS 23.1std"
   echo "INTEL SOC EDS 20.1"
   echo "Linaro GCC 7.5"

   export ARCH=arm
   export QUARTUSPATH={INSTALL_DIR}/intelFPGA/23.1std
   export PATH=$PATH:${QUARTUSPATH}/quartus/bin/
   export PATH=$PATH:${QUARTUSPATH}/nios2eds/

   export ALTERAPATH={INSTALL_DIR}/intelFPGA_pro/20.1
   export PATH=$PATH:${ALTERAPATH}/embedded/
   export PATH=$PATH:${ALTERAPATH}/embedded/host_tools/altera/preloadergen/

   export SOCEDS_DEST_ROOT=${ALTERAPATH}/embedded
   export SOCEDS_HWLIB=${ALTERAPATH}/embedded/ip/altera/hps/altera_hps/hwlib/

   export GCC_Linaro=/opt/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin
   export PATH=$PATH:${GCC_Linaro}

   export ARCH=arm
   export CROSS_COMPILE=arm-linux-gnueabihf-
   ```
4. Run "direnv allow" afetr making edits to the .envrc file

### 5. Generate Template Top File

1. Open **Quartus Prime** and generate the template top file using the SoC Builder tool.
2. The file is generated in Verilog format.

### 6. Convert Verilog to VHDL

Manually convert the generated Verilog top file to VHDL.

### 7. Configure Platform Designer and Add Components

1. Open **Platform Designer** (Qsys).
2. Add components like the **HPS** block, **SDRAM**, and **PIO**.
3. Save and generate HDL files.

### 8. Generate Header File for HPS

Use the `sopc-create-header` command to generate the necessary header file:

```bash
sopc-create-header --sopc-file=<path_to_sopcinfo_file> --single=<output_header_file.h>
```

### 9. Write and Compile C Code

1. Write your C code.
2. Compile using a Makefile configured for the **SoC EDS toolchain**.
3. Transfer the compiled binary to the HPS using `scp` or any preferred method.

## Conclusion

Following these steps, your Linux environment is now ready for developing and testing FPGA and HPS projects with the Terasic DE1-SoC.

## Useful Resources
- [HPS - Hello PIO core](https://www.youtube.com/watch?v=6hjsMUAKtT8)

## TO-DO
- Set up automatic FPGA programming via the HPS.