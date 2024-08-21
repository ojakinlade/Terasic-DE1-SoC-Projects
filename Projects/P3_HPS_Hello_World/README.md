# DE1-SoC HPS Setup and Hello World Program

This project outlines the steps to set up the HPS on the Terasic DE1-SoC board and run a simple "Hello, World!" program.

## 1. Preparing the SD Card with Linux Image

1. **Download the Linux Image**: Obtain the pre-built Linux image for the DE1-SoC from the Terasic website.
2. **Write the Image to SD Card**: Use the Win32DiskImager software to flash the downloaded image onto an SD card (at least 4GB).
3. **Insert the SD Card**: Insert the prepared SD card into the DE1-SoC board's SD card slot.

## 2. Installing the Intel SOC Embedded Design Suite (EDS)

1. **Download Intel SOC EDS**: Download the SOC EDS from the Intel website.
2. **Install the Software**: Follow the installation instructions to set up the SOC EDS on your PC.
3. **Configure Cygwin**: During the installation, configure Cygwin to work with the SOC EDS, enabling you to use Linux commands within Windows.

## 3. Writing the Hello World Program

1. **Set Up the Development Environment**:
   - Install Visual Studio Code (VSCode) if not already installed.
   - Configure VSCode to work with your development tools.
2. **Create the C Program**:
   - Write a simple `hello_world.c` program that prints "Hello, World!" to the console.
3. **Create the Makefile**:
   - Write a Makefile to compile the C program using the ARM toolchain provided by the SOC EDS.

## 4. Connecting the DE1-SoC Board to the PC

1. **Networking Setup**:
   - Connect the DE1-SoC board and your PC to the same router via Ethernet cables.
   - Ensure both devices are on the same network.
2. **Obtain the Board's IP Address**:
   - Boot the board with the Linux image and use the command `ifconfig` to find the IP address assigned to the board.

## 5. Transferring and Running the Program

1. **Transfer the Program**:
   - Use SCP from Cygwin to transfer the compiled `hello_world` executable from your PC to the DE1-SoC board.
2. **Run the Program**:
   - SSH into the board using its IP address.
   - Navigate to the directory where the `hello_world` program is located.
   - Run the program with `./hello_world` and verify that "Hello, World!" is printed on the console.

## Helpful resources
- [My first HPS](docs/UserManual/My_First_HPS)
- https://youtube.com/watch?v=45TIG2S36Xw&t=1592s

