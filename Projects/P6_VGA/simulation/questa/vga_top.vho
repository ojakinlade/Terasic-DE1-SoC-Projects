-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

-- DATE "09/26/2024 22:58:56"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	vga_top IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	VGA_HS : OUT std_logic;
	VGA_VS : OUT std_logic;
	VGA_CLK : OUT std_logic;
	video_on : OUT std_logic;
	VGA_R : OUT std_logic_vector(7 DOWNTO 0);
	VGA_G : OUT std_logic_vector(7 DOWNTO 0);
	VGA_B : OUT std_logic_vector(7 DOWNTO 0)
	);
END vga_top;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_HS	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_VS	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_CLK	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- video_on	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[0]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[1]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[2]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[3]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[4]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[5]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[6]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[7]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[0]	=>  Location: PIN_J9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[1]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[3]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[4]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[5]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[6]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[7]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[0]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[1]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[2]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[3]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[4]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[5]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[6]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[7]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF vga_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_VGA_HS : std_logic;
SIGNAL ww_VGA_VS : std_logic;
SIGNAL ww_VGA_CLK : std_logic;
SIGNAL ww_video_on : std_logic;
SIGNAL ww_VGA_R : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(7 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \vga_sync_unit|mod2_reg~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|mod2_reg~q\ : std_logic;
SIGNAL \vga_sync_unit|Add0~25_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~26\ : std_logic;
SIGNAL \vga_sync_unit|Add0~29_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~30\ : std_logic;
SIGNAL \vga_sync_unit|Add0~33_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~34\ : std_logic;
SIGNAL \vga_sync_unit|Add0~37_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~38\ : std_logic;
SIGNAL \vga_sync_unit|Add0~17_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~18\ : std_logic;
SIGNAL \vga_sync_unit|Add0~13_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~14\ : std_logic;
SIGNAL \vga_sync_unit|Add0~21_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~22\ : std_logic;
SIGNAL \vga_sync_unit|Add0~9_sumout\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|Add0~10\ : std_logic;
SIGNAL \vga_sync_unit|Add0~6\ : std_logic;
SIGNAL \vga_sync_unit|Add0~1_sumout\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|Equal0~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[1]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|Equal0~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|Equal0~2_combout\ : std_logic;
SIGNAL \vga_sync_unit|Add0~5_sumout\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|h_sync_next~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|h_sync_reg~q\ : std_logic;
SIGNAL \vga_sync_unit|Add1~37_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~18\ : std_logic;
SIGNAL \vga_sync_unit|Add1~5_sumout\ : std_logic;
SIGNAL \vga_sync_unit|vsync_counter~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[5]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|Add1~6\ : std_logic;
SIGNAL \vga_sync_unit|Add1~9_sumout\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[8]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[1]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|Add1~10\ : std_logic;
SIGNAL \vga_sync_unit|Add1~1_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Equal1~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|Equal1~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~38\ : std_logic;
SIGNAL \vga_sync_unit|Add1~25_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~26\ : std_logic;
SIGNAL \vga_sync_unit|Add1~21_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~22\ : std_logic;
SIGNAL \vga_sync_unit|Add1~33_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~34\ : std_logic;
SIGNAL \vga_sync_unit|Add1~29_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~30\ : std_logic;
SIGNAL \vga_sync_unit|Add1~13_sumout\ : std_logic;
SIGNAL \vga_sync_unit|Add1~14\ : std_logic;
SIGNAL \vga_sync_unit|Add1~17_sumout\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[3]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[4]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|v_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|v_sync_next~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|v_sync_next~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|v_sync_reg~q\ : std_logic;
SIGNAL \pixel_generate|rgb_out[0]~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|LessThan5~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|video_on~0_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[16]~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|h_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \pixel_generate|rgb_out[0]~2_combout\ : std_logic;
SIGNAL \pixel_generate|LessThan2~0_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[16]~3_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[16]~4_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[16]~5_combout\ : std_logic;
SIGNAL \pixel_generate|LessThan0~1_combout\ : std_logic;
SIGNAL \pixel_generate|LessThan0~0_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[16]~6_combout\ : std_logic;
SIGNAL \pixel_generate|LessThan0~2_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[16]~7_combout\ : std_logic;
SIGNAL \rgb_reg[16]~feeder_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[8]~8_combout\ : std_logic;
SIGNAL \pixel_generate|b~2_combout\ : std_logic;
SIGNAL \pixel_generate|b~3_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[0]~9_combout\ : std_logic;
SIGNAL \pixel_generate|b~0_combout\ : std_logic;
SIGNAL \pixel_generate|b~1_combout\ : std_logic;
SIGNAL \pixel_generate|rgb_out[0]~10_combout\ : std_logic;
SIGNAL \rgb_reg[0]~feeder_combout\ : std_logic;
SIGNAL rgb_reg : std_logic_vector(23 DOWNTO 0);
SIGNAL \vga_sync_unit|v_count_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga_sync_unit|h_count_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[3]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[1]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[3]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[4]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[1]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[5]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[8]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_Equal1~1_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[0]~10_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[0]~9_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_b~3_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_b~2_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_b~1_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_b~0_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[16]~7_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[16]~6_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[16]~5_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[16]~4_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[16]~3_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[0]~2_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_LessThan2~0_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[16]~1_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_v_sync_next~0_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb_out[0]~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_LessThan5~0_combout\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_mod2_reg~q\ : std_logic;
SIGNAL \vga_sync_unit|ALT_INV_h_count_reg\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \vga_sync_unit|ALT_INV_v_count_reg\ : std_logic_vector(9 DOWNTO 0);

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
VGA_CLK <= ww_VGA_CLK;
video_on <= ww_video_on;
VGA_R <= ww_VGA_R;
VGA_G <= ww_VGA_G;
VGA_B <= ww_VGA_B;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\vga_sync_unit|ALT_INV_h_count_reg[3]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[3]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[2]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[1]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[1]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_v_count_reg[3]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[3]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_v_count_reg[4]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[4]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_v_count_reg[1]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[1]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[2]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[4]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[5]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\ <= NOT \vga_sync_unit|h_count_reg[9]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_v_count_reg[5]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[5]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_v_count_reg[8]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[8]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\ <= NOT \vga_sync_unit|v_count_reg[9]~DUPLICATE_q\;
\vga_sync_unit|ALT_INV_Equal1~1_combout\ <= NOT \vga_sync_unit|Equal1~1_combout\;
\pixel_generate|ALT_INV_rgb_out[0]~10_combout\ <= NOT \pixel_generate|rgb_out[0]~10_combout\;
\pixel_generate|ALT_INV_rgb_out[0]~9_combout\ <= NOT \pixel_generate|rgb_out[0]~9_combout\;
\pixel_generate|ALT_INV_b~3_combout\ <= NOT \pixel_generate|b~3_combout\;
\pixel_generate|ALT_INV_b~2_combout\ <= NOT \pixel_generate|b~2_combout\;
\pixel_generate|ALT_INV_b~1_combout\ <= NOT \pixel_generate|b~1_combout\;
\pixel_generate|ALT_INV_b~0_combout\ <= NOT \pixel_generate|b~0_combout\;
\pixel_generate|ALT_INV_rgb_out[16]~7_combout\ <= NOT \pixel_generate|rgb_out[16]~7_combout\;
\pixel_generate|ALT_INV_rgb_out[16]~6_combout\ <= NOT \pixel_generate|rgb_out[16]~6_combout\;
\pixel_generate|ALT_INV_rgb_out[16]~5_combout\ <= NOT \pixel_generate|rgb_out[16]~5_combout\;
\pixel_generate|ALT_INV_rgb_out[16]~4_combout\ <= NOT \pixel_generate|rgb_out[16]~4_combout\;
\pixel_generate|ALT_INV_rgb_out[16]~3_combout\ <= NOT \pixel_generate|rgb_out[16]~3_combout\;
\pixel_generate|ALT_INV_rgb_out[0]~2_combout\ <= NOT \pixel_generate|rgb_out[0]~2_combout\;
\pixel_generate|ALT_INV_LessThan2~0_combout\ <= NOT \pixel_generate|LessThan2~0_combout\;
\pixel_generate|ALT_INV_rgb_out[16]~1_combout\ <= NOT \pixel_generate|rgb_out[16]~1_combout\;
\pixel_generate|ALT_INV_LessThan0~2_combout\ <= NOT \pixel_generate|LessThan0~2_combout\;
\pixel_generate|ALT_INV_LessThan0~1_combout\ <= NOT \pixel_generate|LessThan0~1_combout\;
\pixel_generate|ALT_INV_LessThan0~0_combout\ <= NOT \pixel_generate|LessThan0~0_combout\;
\vga_sync_unit|ALT_INV_Equal0~1_combout\ <= NOT \vga_sync_unit|Equal0~1_combout\;
\vga_sync_unit|ALT_INV_Equal0~0_combout\ <= NOT \vga_sync_unit|Equal0~0_combout\;
\vga_sync_unit|ALT_INV_v_sync_next~0_combout\ <= NOT \vga_sync_unit|v_sync_next~0_combout\;
\pixel_generate|ALT_INV_rgb_out[0]~0_combout\ <= NOT \pixel_generate|rgb_out[0]~0_combout\;
\vga_sync_unit|ALT_INV_LessThan5~0_combout\ <= NOT \vga_sync_unit|LessThan5~0_combout\;
\vga_sync_unit|ALT_INV_mod2_reg~q\ <= NOT \vga_sync_unit|mod2_reg~q\;
\vga_sync_unit|ALT_INV_h_count_reg\(3) <= NOT \vga_sync_unit|h_count_reg\(3);
\vga_sync_unit|ALT_INV_h_count_reg\(2) <= NOT \vga_sync_unit|h_count_reg\(2);
\vga_sync_unit|ALT_INV_h_count_reg\(1) <= NOT \vga_sync_unit|h_count_reg\(1);
\vga_sync_unit|ALT_INV_h_count_reg\(0) <= NOT \vga_sync_unit|h_count_reg\(0);
\vga_sync_unit|ALT_INV_v_count_reg\(0) <= NOT \vga_sync_unit|v_count_reg\(0);
\vga_sync_unit|ALT_INV_v_count_reg\(3) <= NOT \vga_sync_unit|v_count_reg\(3);
\vga_sync_unit|ALT_INV_v_count_reg\(4) <= NOT \vga_sync_unit|v_count_reg\(4);
\vga_sync_unit|ALT_INV_v_count_reg\(1) <= NOT \vga_sync_unit|v_count_reg\(1);
\vga_sync_unit|ALT_INV_v_count_reg\(2) <= NOT \vga_sync_unit|v_count_reg\(2);
\vga_sync_unit|ALT_INV_h_count_reg\(6) <= NOT \vga_sync_unit|h_count_reg\(6);
\vga_sync_unit|ALT_INV_h_count_reg\(4) <= NOT \vga_sync_unit|h_count_reg\(4);
\vga_sync_unit|ALT_INV_h_count_reg\(5) <= NOT \vga_sync_unit|h_count_reg\(5);
\vga_sync_unit|ALT_INV_h_count_reg\(7) <= NOT \vga_sync_unit|h_count_reg\(7);
\vga_sync_unit|ALT_INV_h_count_reg\(8) <= NOT \vga_sync_unit|h_count_reg\(8);
\vga_sync_unit|ALT_INV_h_count_reg\(9) <= NOT \vga_sync_unit|h_count_reg\(9);
\vga_sync_unit|ALT_INV_v_count_reg\(6) <= NOT \vga_sync_unit|v_count_reg\(6);
\vga_sync_unit|ALT_INV_v_count_reg\(5) <= NOT \vga_sync_unit|v_count_reg\(5);
\vga_sync_unit|ALT_INV_v_count_reg\(8) <= NOT \vga_sync_unit|v_count_reg\(8);
\vga_sync_unit|ALT_INV_v_count_reg\(7) <= NOT \vga_sync_unit|v_count_reg\(7);
\vga_sync_unit|ALT_INV_v_count_reg\(9) <= NOT \vga_sync_unit|v_count_reg\(9);

-- Location: IOOBUF_X36_Y81_N53
\VGA_HS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga_sync_unit|h_sync_reg~q\,
	devoe => ww_devoe,
	o => ww_VGA_HS);

-- Location: IOOBUF_X34_Y81_N42
\VGA_VS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga_sync_unit|v_sync_reg~q\,
	devoe => ww_devoe,
	o => ww_VGA_VS);

-- Location: IOOBUF_X38_Y81_N36
\VGA_CLK~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga_sync_unit|mod2_reg~q\,
	devoe => ww_devoe,
	o => ww_VGA_CLK);

-- Location: IOOBUF_X32_Y81_N53
\video_on~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \vga_sync_unit|video_on~0_combout\,
	devoe => ww_devoe,
	o => ww_video_on);

-- Location: IOOBUF_X40_Y81_N53
\VGA_R[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(16),
	devoe => ww_devoe,
	o => ww_VGA_R(0));

-- Location: IOOBUF_X38_Y81_N2
\VGA_R[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(17),
	devoe => ww_devoe,
	o => ww_VGA_R(1));

-- Location: IOOBUF_X26_Y81_N59
\VGA_R[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(18),
	devoe => ww_devoe,
	o => ww_VGA_R(2));

-- Location: IOOBUF_X38_Y81_N19
\VGA_R[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(19),
	devoe => ww_devoe,
	o => ww_VGA_R(3));

-- Location: IOOBUF_X36_Y81_N36
\VGA_R[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(20),
	devoe => ww_devoe,
	o => ww_VGA_R(4));

-- Location: IOOBUF_X22_Y81_N19
\VGA_R[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(21),
	devoe => ww_devoe,
	o => ww_VGA_R(5));

-- Location: IOOBUF_X22_Y81_N2
\VGA_R[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(22),
	devoe => ww_devoe,
	o => ww_VGA_R(6));

-- Location: IOOBUF_X26_Y81_N42
\VGA_R[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(23),
	devoe => ww_devoe,
	o => ww_VGA_R(7));

-- Location: IOOBUF_X4_Y81_N19
\VGA_G[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(8),
	devoe => ww_devoe,
	o => ww_VGA_G(0));

-- Location: IOOBUF_X4_Y81_N2
\VGA_G[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(9),
	devoe => ww_devoe,
	o => ww_VGA_G(1));

-- Location: IOOBUF_X20_Y81_N19
\VGA_G[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(10),
	devoe => ww_devoe,
	o => ww_VGA_G(2));

-- Location: IOOBUF_X6_Y81_N2
\VGA_G[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(11),
	devoe => ww_devoe,
	o => ww_VGA_G(3));

-- Location: IOOBUF_X10_Y81_N59
\VGA_G[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(12),
	devoe => ww_devoe,
	o => ww_VGA_G(4));

-- Location: IOOBUF_X10_Y81_N42
\VGA_G[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(13),
	devoe => ww_devoe,
	o => ww_VGA_G(5));

-- Location: IOOBUF_X18_Y81_N42
\VGA_G[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(14),
	devoe => ww_devoe,
	o => ww_VGA_G(6));

-- Location: IOOBUF_X18_Y81_N59
\VGA_G[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(15),
	devoe => ww_devoe,
	o => ww_VGA_G(7));

-- Location: IOOBUF_X40_Y81_N36
\VGA_B[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(0),
	devoe => ww_devoe,
	o => ww_VGA_B(0));

-- Location: IOOBUF_X28_Y81_N19
\VGA_B[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(1),
	devoe => ww_devoe,
	o => ww_VGA_B(1));

-- Location: IOOBUF_X20_Y81_N2
\VGA_B[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(2),
	devoe => ww_devoe,
	o => ww_VGA_B(2));

-- Location: IOOBUF_X36_Y81_N19
\VGA_B[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(3),
	devoe => ww_devoe,
	o => ww_VGA_B(3));

-- Location: IOOBUF_X28_Y81_N2
\VGA_B[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(4),
	devoe => ww_devoe,
	o => ww_VGA_B(4));

-- Location: IOOBUF_X36_Y81_N2
\VGA_B[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(5),
	devoe => ww_devoe,
	o => ww_VGA_B(5));

-- Location: IOOBUF_X40_Y81_N19
\VGA_B[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(6),
	devoe => ww_devoe,
	o => ww_VGA_B(6));

-- Location: IOOBUF_X32_Y81_N19
\VGA_B[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rgb_reg(7),
	devoe => ww_devoe,
	o => ww_VGA_B(7));

-- Location: IOIBUF_X32_Y0_N1
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G5
\CLOCK_50~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~input_o\,
	outclk => \CLOCK_50~inputCLKENA0_outclk\);

-- Location: IOIBUF_X36_Y0_N1
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LABCELL_X30_Y77_N51
\vga_sync_unit|mod2_reg~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|mod2_reg~0_combout\ = !\vga_sync_unit|mod2_reg~q\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_mod2_reg~q\,
	combout => \vga_sync_unit|mod2_reg~0_combout\);

-- Location: FF_X30_Y77_N53
\vga_sync_unit|mod2_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|mod2_reg~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|mod2_reg~q\);

-- Location: FF_X28_Y77_N52
\vga_sync_unit|h_count_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(7));

-- Location: MLABCELL_X28_Y77_N30
\vga_sync_unit|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~25_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(0) ) + ( VCC ) + ( !VCC ))
-- \vga_sync_unit|Add0~26\ = CARRY(( \vga_sync_unit|h_count_reg\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(0),
	cin => GND,
	sumout => \vga_sync_unit|Add0~25_sumout\,
	cout => \vga_sync_unit|Add0~26\);

-- Location: FF_X28_Y77_N32
\vga_sync_unit|h_count_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~25_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(0));

-- Location: MLABCELL_X28_Y77_N33
\vga_sync_unit|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~29_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(1) ) + ( GND ) + ( \vga_sync_unit|Add0~26\ ))
-- \vga_sync_unit|Add0~30\ = CARRY(( \vga_sync_unit|h_count_reg\(1) ) + ( GND ) + ( \vga_sync_unit|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(1),
	cin => \vga_sync_unit|Add0~26\,
	sumout => \vga_sync_unit|Add0~29_sumout\,
	cout => \vga_sync_unit|Add0~30\);

-- Location: FF_X28_Y77_N34
\vga_sync_unit|h_count_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(1));

-- Location: MLABCELL_X28_Y77_N36
\vga_sync_unit|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~33_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(2) ) + ( GND ) + ( \vga_sync_unit|Add0~30\ ))
-- \vga_sync_unit|Add0~34\ = CARRY(( \vga_sync_unit|h_count_reg\(2) ) + ( GND ) + ( \vga_sync_unit|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(2),
	cin => \vga_sync_unit|Add0~30\,
	sumout => \vga_sync_unit|Add0~33_sumout\,
	cout => \vga_sync_unit|Add0~34\);

-- Location: FF_X28_Y77_N38
\vga_sync_unit|h_count_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(2));

-- Location: MLABCELL_X28_Y77_N39
\vga_sync_unit|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~37_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(3) ) + ( GND ) + ( \vga_sync_unit|Add0~34\ ))
-- \vga_sync_unit|Add0~38\ = CARRY(( \vga_sync_unit|h_count_reg\(3) ) + ( GND ) + ( \vga_sync_unit|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(3),
	cin => \vga_sync_unit|Add0~34\,
	sumout => \vga_sync_unit|Add0~37_sumout\,
	cout => \vga_sync_unit|Add0~38\);

-- Location: FF_X28_Y77_N41
\vga_sync_unit|h_count_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(3));

-- Location: MLABCELL_X28_Y77_N42
\vga_sync_unit|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~17_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(4) ) + ( GND ) + ( \vga_sync_unit|Add0~38\ ))
-- \vga_sync_unit|Add0~18\ = CARRY(( \vga_sync_unit|h_count_reg\(4) ) + ( GND ) + ( \vga_sync_unit|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(4),
	cin => \vga_sync_unit|Add0~38\,
	sumout => \vga_sync_unit|Add0~17_sumout\,
	cout => \vga_sync_unit|Add0~18\);

-- Location: FF_X29_Y77_N29
\vga_sync_unit|h_count_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \vga_sync_unit|Add0~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(4));

-- Location: MLABCELL_X28_Y77_N45
\vga_sync_unit|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~13_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(5) ) + ( GND ) + ( \vga_sync_unit|Add0~18\ ))
-- \vga_sync_unit|Add0~14\ = CARRY(( \vga_sync_unit|h_count_reg\(5) ) + ( GND ) + ( \vga_sync_unit|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(5),
	cin => \vga_sync_unit|Add0~18\,
	sumout => \vga_sync_unit|Add0~13_sumout\,
	cout => \vga_sync_unit|Add0~14\);

-- Location: FF_X28_Y77_N47
\vga_sync_unit|h_count_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(5));

-- Location: MLABCELL_X28_Y77_N48
\vga_sync_unit|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~21_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(6) ) + ( GND ) + ( \vga_sync_unit|Add0~14\ ))
-- \vga_sync_unit|Add0~22\ = CARRY(( \vga_sync_unit|h_count_reg\(6) ) + ( GND ) + ( \vga_sync_unit|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(6),
	cin => \vga_sync_unit|Add0~14\,
	sumout => \vga_sync_unit|Add0~21_sumout\,
	cout => \vga_sync_unit|Add0~22\);

-- Location: FF_X28_Y77_N50
\vga_sync_unit|h_count_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(6));

-- Location: MLABCELL_X28_Y77_N51
\vga_sync_unit|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~9_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(7) ) + ( GND ) + ( \vga_sync_unit|Add0~22\ ))
-- \vga_sync_unit|Add0~10\ = CARRY(( \vga_sync_unit|h_count_reg\(7) ) + ( GND ) + ( \vga_sync_unit|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(7),
	cin => \vga_sync_unit|Add0~22\,
	sumout => \vga_sync_unit|Add0~9_sumout\,
	cout => \vga_sync_unit|Add0~10\);

-- Location: FF_X28_Y77_N53
\vga_sync_unit|h_count_reg[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\);

-- Location: FF_X28_Y77_N46
\vga_sync_unit|h_count_reg[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[5]~DUPLICATE_q\);

-- Location: FF_X29_Y77_N28
\vga_sync_unit|h_count_reg[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \vga_sync_unit|Add0~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[4]~DUPLICATE_q\);

-- Location: FF_X28_Y77_N40
\vga_sync_unit|h_count_reg[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[3]~DUPLICATE_q\);

-- Location: FF_X28_Y77_N59
\vga_sync_unit|h_count_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(9));

-- Location: MLABCELL_X28_Y77_N54
\vga_sync_unit|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~5_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(8) ) + ( GND ) + ( \vga_sync_unit|Add0~10\ ))
-- \vga_sync_unit|Add0~6\ = CARRY(( \vga_sync_unit|h_count_reg\(8) ) + ( GND ) + ( \vga_sync_unit|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	cin => \vga_sync_unit|Add0~10\,
	sumout => \vga_sync_unit|Add0~5_sumout\,
	cout => \vga_sync_unit|Add0~6\);

-- Location: MLABCELL_X28_Y77_N57
\vga_sync_unit|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add0~1_sumout\ = SUM(( \vga_sync_unit|h_count_reg\(9) ) + ( GND ) + ( \vga_sync_unit|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	cin => \vga_sync_unit|Add0~6\,
	sumout => \vga_sync_unit|Add0~1_sumout\);

-- Location: FF_X28_Y77_N58
\vga_sync_unit|h_count_reg[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[9]~DUPLICATE_q\);

-- Location: LABCELL_X31_Y77_N54
\vga_sync_unit|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal0~1_combout\ = ( \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ & ( \vga_sync_unit|h_count_reg[9]~DUPLICATE_q\ & ( (\vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & \vga_sync_unit|h_count_reg[3]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \vga_sync_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg[3]~DUPLICATE_q\,
	datae => \vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	combout => \vga_sync_unit|Equal0~1_combout\);

-- Location: FF_X28_Y77_N35
\vga_sync_unit|h_count_reg[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[1]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y77_N0
\vga_sync_unit|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal0~0_combout\ = ( \vga_sync_unit|h_count_reg\(2) & ( \vga_sync_unit|h_count_reg\(0) & ( (\vga_sync_unit|h_count_reg[1]~DUPLICATE_q\ & !\vga_sync_unit|h_count_reg\(6)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg[1]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(6),
	datae => \vga_sync_unit|ALT_INV_h_count_reg\(2),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg\(0),
	combout => \vga_sync_unit|Equal0~0_combout\);

-- Location: LABCELL_X31_Y77_N39
\vga_sync_unit|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal0~2_combout\ = ( \vga_sync_unit|Equal0~1_combout\ & ( \vga_sync_unit|Equal0~0_combout\ & ( (!\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & !\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datae => \vga_sync_unit|ALT_INV_Equal0~1_combout\,
	dataf => \vga_sync_unit|ALT_INV_Equal0~0_combout\,
	combout => \vga_sync_unit|Equal0~2_combout\);

-- Location: FF_X28_Y77_N56
\vga_sync_unit|h_count_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg\(8));

-- Location: FF_X28_Y77_N55
\vga_sync_unit|h_count_reg[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\);

-- Location: FF_X28_Y77_N49
\vga_sync_unit|h_count_reg[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\);

-- Location: LABCELL_X31_Y77_N48
\vga_sync_unit|h_sync_next~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|h_sync_next~0_combout\ = ( \vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & ( \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & ( ((!\vga_sync_unit|h_count_reg[9]~DUPLICATE_q\) # ((\vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & 
-- \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\))) # (\vga_sync_unit|h_count_reg[8]~DUPLICATE_q\) ) ) ) # ( !\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & ( \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & ( ((!\vga_sync_unit|h_count_reg[9]~DUPLICATE_q\) # 
-- ((!\vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & !\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\))) # (\vga_sync_unit|h_count_reg[8]~DUPLICATE_q\) ) ) ) # ( \vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & ( !\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ ) ) # ( 
-- !\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & ( !\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111110101011111111101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	datae => \vga_sync_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	combout => \vga_sync_unit|h_sync_next~0_combout\);

-- Location: FF_X31_Y77_N49
\vga_sync_unit|h_sync_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|h_sync_next~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_sync_reg~q\);

-- Location: LABCELL_X30_Y77_N0
\vga_sync_unit|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~37_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(0) ) + ( VCC ) + ( !VCC ))
-- \vga_sync_unit|Add1~38\ = CARRY(( \vga_sync_unit|v_count_reg\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(0),
	cin => GND,
	sumout => \vga_sync_unit|Add1~37_sumout\,
	cout => \vga_sync_unit|Add1~38\);

-- Location: LABCELL_X30_Y77_N18
\vga_sync_unit|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~17_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(6) ) + ( GND ) + ( \vga_sync_unit|Add1~14\ ))
-- \vga_sync_unit|Add1~18\ = CARRY(( \vga_sync_unit|v_count_reg\(6) ) + ( GND ) + ( \vga_sync_unit|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(6),
	cin => \vga_sync_unit|Add1~14\,
	sumout => \vga_sync_unit|Add1~17_sumout\,
	cout => \vga_sync_unit|Add1~18\);

-- Location: LABCELL_X30_Y77_N21
\vga_sync_unit|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~5_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(7) ) + ( GND ) + ( \vga_sync_unit|Add1~18\ ))
-- \vga_sync_unit|Add1~6\ = CARRY(( \vga_sync_unit|v_count_reg\(7) ) + ( GND ) + ( \vga_sync_unit|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(7),
	cin => \vga_sync_unit|Add1~18\,
	sumout => \vga_sync_unit|Add1~5_sumout\,
	cout => \vga_sync_unit|Add1~6\);

-- Location: LABCELL_X30_Y77_N48
\vga_sync_unit|vsync_counter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|vsync_counter~0_combout\ = ( \vga_sync_unit|Equal0~0_combout\ & ( (\vga_sync_unit|mod2_reg~q\ & (!\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & (!\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & \vga_sync_unit|Equal0~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_mod2_reg~q\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_Equal0~1_combout\,
	dataf => \vga_sync_unit|ALT_INV_Equal0~0_combout\,
	combout => \vga_sync_unit|vsync_counter~0_combout\);

-- Location: FF_X30_Y77_N23
\vga_sync_unit|v_count_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(7));

-- Location: FF_X30_Y77_N16
\vga_sync_unit|v_count_reg[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[5]~DUPLICATE_q\);

-- Location: FF_X30_Y77_N26
\vga_sync_unit|v_count_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(8));

-- Location: LABCELL_X30_Y77_N24
\vga_sync_unit|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~9_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(8) ) + ( GND ) + ( \vga_sync_unit|Add1~6\ ))
-- \vga_sync_unit|Add1~10\ = CARRY(( \vga_sync_unit|v_count_reg\(8) ) + ( GND ) + ( \vga_sync_unit|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(8),
	cin => \vga_sync_unit|Add1~6\,
	sumout => \vga_sync_unit|Add1~9_sumout\,
	cout => \vga_sync_unit|Add1~10\);

-- Location: FF_X30_Y77_N25
\vga_sync_unit|v_count_reg[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[8]~DUPLICATE_q\);

-- Location: FF_X30_Y77_N5
\vga_sync_unit|v_count_reg[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~25_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[1]~DUPLICATE_q\);

-- Location: LABCELL_X30_Y77_N27
\vga_sync_unit|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~1_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(9) ) + ( GND ) + ( \vga_sync_unit|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(9),
	cin => \vga_sync_unit|Add1~10\,
	sumout => \vga_sync_unit|Add1~1_sumout\);

-- Location: FF_X30_Y77_N29
\vga_sync_unit|v_count_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(9));

-- Location: LABCELL_X30_Y77_N39
\vga_sync_unit|Equal1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal1~1_combout\ = ( \vga_sync_unit|v_count_reg\(2) & ( (\vga_sync_unit|v_count_reg\(9) & (\vga_sync_unit|v_count_reg\(3) & (!\vga_sync_unit|v_count_reg\(4) & !\vga_sync_unit|v_count_reg\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg\(9),
	datab => \vga_sync_unit|ALT_INV_v_count_reg\(3),
	datac => \vga_sync_unit|ALT_INV_v_count_reg\(4),
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(0),
	dataf => \vga_sync_unit|ALT_INV_v_count_reg\(2),
	combout => \vga_sync_unit|Equal1~1_combout\);

-- Location: LABCELL_X30_Y77_N42
\vga_sync_unit|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Equal1~0_combout\ = ( !\vga_sync_unit|v_count_reg[1]~DUPLICATE_q\ & ( \vga_sync_unit|Equal1~1_combout\ & ( (!\vga_sync_unit|v_count_reg\(7) & (!\vga_sync_unit|v_count_reg[5]~DUPLICATE_q\ & (!\vga_sync_unit|v_count_reg\(6) & 
-- !\vga_sync_unit|v_count_reg[8]~DUPLICATE_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg\(7),
	datab => \vga_sync_unit|ALT_INV_v_count_reg[5]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_v_count_reg\(6),
	datad => \vga_sync_unit|ALT_INV_v_count_reg[8]~DUPLICATE_q\,
	datae => \vga_sync_unit|ALT_INV_v_count_reg[1]~DUPLICATE_q\,
	dataf => \vga_sync_unit|ALT_INV_Equal1~1_combout\,
	combout => \vga_sync_unit|Equal1~0_combout\);

-- Location: FF_X30_Y77_N2
\vga_sync_unit|v_count_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(0));

-- Location: LABCELL_X30_Y77_N3
\vga_sync_unit|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~25_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(1) ) + ( GND ) + ( \vga_sync_unit|Add1~38\ ))
-- \vga_sync_unit|Add1~26\ = CARRY(( \vga_sync_unit|v_count_reg\(1) ) + ( GND ) + ( \vga_sync_unit|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(1),
	cin => \vga_sync_unit|Add1~38\,
	sumout => \vga_sync_unit|Add1~25_sumout\,
	cout => \vga_sync_unit|Add1~26\);

-- Location: FF_X30_Y77_N4
\vga_sync_unit|v_count_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~25_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(1));

-- Location: LABCELL_X30_Y77_N6
\vga_sync_unit|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~21_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(2) ) + ( GND ) + ( \vga_sync_unit|Add1~26\ ))
-- \vga_sync_unit|Add1~22\ = CARRY(( \vga_sync_unit|v_count_reg\(2) ) + ( GND ) + ( \vga_sync_unit|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(2),
	cin => \vga_sync_unit|Add1~26\,
	sumout => \vga_sync_unit|Add1~21_sumout\,
	cout => \vga_sync_unit|Add1~22\);

-- Location: FF_X30_Y77_N8
\vga_sync_unit|v_count_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(2));

-- Location: LABCELL_X30_Y77_N9
\vga_sync_unit|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~33_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(3) ) + ( GND ) + ( \vga_sync_unit|Add1~22\ ))
-- \vga_sync_unit|Add1~34\ = CARRY(( \vga_sync_unit|v_count_reg\(3) ) + ( GND ) + ( \vga_sync_unit|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(3),
	cin => \vga_sync_unit|Add1~22\,
	sumout => \vga_sync_unit|Add1~33_sumout\,
	cout => \vga_sync_unit|Add1~34\);

-- Location: FF_X30_Y77_N11
\vga_sync_unit|v_count_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(3));

-- Location: LABCELL_X30_Y77_N12
\vga_sync_unit|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~29_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(4) ) + ( GND ) + ( \vga_sync_unit|Add1~34\ ))
-- \vga_sync_unit|Add1~30\ = CARRY(( \vga_sync_unit|v_count_reg\(4) ) + ( GND ) + ( \vga_sync_unit|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(4),
	cin => \vga_sync_unit|Add1~34\,
	sumout => \vga_sync_unit|Add1~29_sumout\,
	cout => \vga_sync_unit|Add1~30\);

-- Location: FF_X30_Y77_N14
\vga_sync_unit|v_count_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(4));

-- Location: LABCELL_X30_Y77_N15
\vga_sync_unit|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|Add1~13_sumout\ = SUM(( \vga_sync_unit|v_count_reg\(5) ) + ( GND ) + ( \vga_sync_unit|Add1~30\ ))
-- \vga_sync_unit|Add1~14\ = CARRY(( \vga_sync_unit|v_count_reg\(5) ) + ( GND ) + ( \vga_sync_unit|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(5),
	cin => \vga_sync_unit|Add1~30\,
	sumout => \vga_sync_unit|Add1~13_sumout\,
	cout => \vga_sync_unit|Add1~14\);

-- Location: FF_X30_Y77_N17
\vga_sync_unit|v_count_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(5));

-- Location: FF_X30_Y77_N20
\vga_sync_unit|v_count_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg\(6));

-- Location: FF_X30_Y77_N28
\vga_sync_unit|v_count_reg[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[9]~DUPLICATE_q\);

-- Location: FF_X30_Y77_N10
\vga_sync_unit|v_count_reg[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[3]~DUPLICATE_q\);

-- Location: FF_X30_Y77_N13
\vga_sync_unit|v_count_reg[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[4]~DUPLICATE_q\);

-- Location: FF_X30_Y77_N7
\vga_sync_unit|v_count_reg[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add1~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal1~0_combout\,
	ena => \vga_sync_unit|vsync_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_count_reg[2]~DUPLICATE_q\);

-- Location: LABCELL_X31_Y77_N15
\vga_sync_unit|v_sync_next~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|v_sync_next~0_combout\ = ( !\vga_sync_unit|v_count_reg[2]~DUPLICATE_q\ & ( \vga_sync_unit|v_count_reg\(1) & ( (!\vga_sync_unit|v_count_reg[9]~DUPLICATE_q\ & (\vga_sync_unit|v_count_reg[3]~DUPLICATE_q\ & 
-- !\vga_sync_unit|v_count_reg[4]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_v_count_reg[3]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_v_count_reg[4]~DUPLICATE_q\,
	datae => \vga_sync_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\,
	dataf => \vga_sync_unit|ALT_INV_v_count_reg\(1),
	combout => \vga_sync_unit|v_sync_next~0_combout\);

-- Location: LABCELL_X30_Y77_N33
\vga_sync_unit|v_sync_next~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|v_sync_next~1_combout\ = ( \vga_sync_unit|v_count_reg[8]~DUPLICATE_q\ & ( (!\vga_sync_unit|v_count_reg\(6)) # ((!\vga_sync_unit|v_count_reg\(5)) # ((!\vga_sync_unit|v_sync_next~0_combout\) # (!\vga_sync_unit|v_count_reg\(7)))) ) ) # ( 
-- !\vga_sync_unit|v_count_reg[8]~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111101111111111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg\(6),
	datab => \vga_sync_unit|ALT_INV_v_count_reg\(5),
	datac => \vga_sync_unit|ALT_INV_v_sync_next~0_combout\,
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(7),
	dataf => \vga_sync_unit|ALT_INV_v_count_reg[8]~DUPLICATE_q\,
	combout => \vga_sync_unit|v_sync_next~1_combout\);

-- Location: FF_X30_Y77_N34
\vga_sync_unit|v_sync_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|v_sync_next~1_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|v_sync_reg~q\);

-- Location: MLABCELL_X28_Y77_N12
\pixel_generate|rgb_out[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[0]~0_combout\ = ( !\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & ( !\vga_sync_unit|h_count_reg\(8) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	combout => \pixel_generate|rgb_out[0]~0_combout\);

-- Location: LABCELL_X30_Y77_N30
\vga_sync_unit|LessThan5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|LessThan5~0_combout\ = ( \vga_sync_unit|v_count_reg\(8) & ( (!\vga_sync_unit|v_count_reg\(9) & ((!\vga_sync_unit|v_count_reg\(6)) # ((!\vga_sync_unit|v_count_reg\(5)) # (!\vga_sync_unit|v_count_reg\(7))))) ) ) # ( 
-- !\vga_sync_unit|v_count_reg\(8) & ( !\vga_sync_unit|v_count_reg\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011111110000000001111111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg\(6),
	datab => \vga_sync_unit|ALT_INV_v_count_reg\(5),
	datac => \vga_sync_unit|ALT_INV_v_count_reg\(7),
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(9),
	dataf => \vga_sync_unit|ALT_INV_v_count_reg\(8),
	combout => \vga_sync_unit|LessThan5~0_combout\);

-- Location: LABCELL_X31_Y77_N33
\vga_sync_unit|video_on~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vga_sync_unit|video_on~0_combout\ = ( \pixel_generate|rgb_out[0]~0_combout\ & ( \vga_sync_unit|LessThan5~0_combout\ ) ) # ( !\pixel_generate|rgb_out[0]~0_combout\ & ( \vga_sync_unit|LessThan5~0_combout\ & ( !\vga_sync_unit|h_count_reg[9]~DUPLICATE_q\ ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000111100001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \vga_sync_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	datae => \pixel_generate|ALT_INV_rgb_out[0]~0_combout\,
	dataf => \vga_sync_unit|ALT_INV_LessThan5~0_combout\,
	combout => \vga_sync_unit|video_on~0_combout\);

-- Location: LABCELL_X29_Y77_N24
\pixel_generate|rgb_out[16]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[16]~1_combout\ = ( \vga_sync_unit|h_count_reg\(4) & ( \vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & ( (\vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ & (((\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & 
-- \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\)) # (\vga_sync_unit|h_count_reg\(7)))) ) ) ) # ( !\vga_sync_unit|h_count_reg\(4) & ( \vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & ( (\vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ & 
-- (((\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\)) # (\vga_sync_unit|h_count_reg\(7)))) ) ) ) # ( \vga_sync_unit|h_count_reg\(4) & ( !\vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & ( 
-- (\vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ & (((\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\)) # (\vga_sync_unit|h_count_reg\(7)))) ) ) ) # ( !\vga_sync_unit|h_count_reg\(4) & ( 
-- !\vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & ( (\vga_sync_unit|h_count_reg\(7) & \vga_sync_unit|h_count_reg[8]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000011100000101000001110000010100000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg\(7),
	datab => \vga_sync_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	datae => \vga_sync_unit|ALT_INV_h_count_reg\(4),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[3]~DUPLICATE_q\,
	combout => \pixel_generate|rgb_out[16]~1_combout\);

-- Location: FF_X28_Y77_N37
\vga_sync_unit|h_count_reg[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vga_sync_unit|Add0~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \vga_sync_unit|Equal0~2_combout\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vga_sync_unit|h_count_reg[2]~DUPLICATE_q\);

-- Location: MLABCELL_X28_Y77_N27
\pixel_generate|rgb_out[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[0]~2_combout\ = ( \vga_sync_unit|h_count_reg\(9) & ( \vga_sync_unit|h_count_reg\(3) & ( (((\vga_sync_unit|h_count_reg\(4) & \vga_sync_unit|h_count_reg[2]~DUPLICATE_q\)) # (\vga_sync_unit|h_count_reg\(6))) # 
-- (\vga_sync_unit|h_count_reg\(5)) ) ) ) # ( \vga_sync_unit|h_count_reg\(9) & ( !\vga_sync_unit|h_count_reg\(3) & ( (\vga_sync_unit|h_count_reg\(6)) # (\vga_sync_unit|h_count_reg\(5)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011111111111100000000000000000001111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg\(4),
	datab => \vga_sync_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(5),
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(6),
	datae => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg\(3),
	combout => \pixel_generate|rgb_out[0]~2_combout\);

-- Location: MLABCELL_X28_Y77_N6
\pixel_generate|LessThan2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|LessThan2~0_combout\ = ( \vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & ( (!\vga_sync_unit|h_count_reg\(6) & ((!\vga_sync_unit|h_count_reg\(5)) # (!\vga_sync_unit|h_count_reg\(4)))) ) ) # ( !\vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & ( 
-- (!\vga_sync_unit|h_count_reg\(6) & ((!\vga_sync_unit|h_count_reg\(2)) # ((!\vga_sync_unit|h_count_reg\(5)) # (!\vga_sync_unit|h_count_reg\(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011100000111100001110000011110000110000001111000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg\(2),
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(5),
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(6),
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(4),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[3]~DUPLICATE_q\,
	combout => \pixel_generate|LessThan2~0_combout\);

-- Location: MLABCELL_X28_Y77_N15
\pixel_generate|rgb_out[16]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[16]~3_combout\ = ( \pixel_generate|LessThan2~0_combout\ & ( (!\vga_sync_unit|h_count_reg\(9)) # ((!\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & !\pixel_generate|rgb_out[0]~2_combout\)) ) ) # ( !\pixel_generate|LessThan2~0_combout\ 
-- & ( (!\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & !\pixel_generate|rgb_out[0]~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000011111010111100001111101011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	datad => \pixel_generate|ALT_INV_rgb_out[0]~2_combout\,
	dataf => \pixel_generate|ALT_INV_LessThan2~0_combout\,
	combout => \pixel_generate|rgb_out[16]~3_combout\);

-- Location: LABCELL_X29_Y77_N36
\pixel_generate|rgb_out[16]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[16]~4_combout\ = ( \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\ & ( \vga_sync_unit|h_count_reg[2]~DUPLICATE_q\ & ( \vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ ) ) ) # ( !\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\ & ( 
-- \vga_sync_unit|h_count_reg[2]~DUPLICATE_q\ & ( (!\vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & (!\vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & !\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\)) ) ) ) # ( \vga_sync_unit|h_count_reg[6]~DUPLICATE_q\ & ( 
-- !\vga_sync_unit|h_count_reg[2]~DUPLICATE_q\ & ( (\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\ & (((\vga_sync_unit|h_count_reg\(1)) # (\vga_sync_unit|h_count_reg[4]~DUPLICATE_q\)) # (\vga_sync_unit|h_count_reg[3]~DUPLICATE_q\))) ) ) ) # ( 
-- !\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\ & ( !\vga_sync_unit|h_count_reg[2]~DUPLICATE_q\ & ( (!\vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & (!\vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & !\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000000001110000111110000000100000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg[3]~DUPLICATE_q\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\,
	datac => \vga_sync_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(1),
	datae => \vga_sync_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\,
	combout => \pixel_generate|rgb_out[16]~4_combout\);

-- Location: MLABCELL_X28_Y77_N9
\pixel_generate|rgb_out[16]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[16]~5_combout\ = ( \vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & ( (!\vga_sync_unit|h_count_reg\(9) & !\vga_sync_unit|h_count_reg\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	combout => \pixel_generate|rgb_out[16]~5_combout\);

-- Location: LABCELL_X30_Y77_N54
\pixel_generate|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|LessThan0~1_combout\ = ( !\vga_sync_unit|v_count_reg\(9) & ( \vga_sync_unit|v_count_reg[5]~DUPLICATE_q\ & ( (!\vga_sync_unit|v_count_reg\(7) & ((!\vga_sync_unit|v_count_reg\(6)) # ((!\vga_sync_unit|v_count_reg\(3) & 
-- !\vga_sync_unit|v_count_reg\(4))))) ) ) ) # ( !\vga_sync_unit|v_count_reg\(9) & ( !\vga_sync_unit|v_count_reg[5]~DUPLICATE_q\ & ( !\vga_sync_unit|v_count_reg\(7) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010000000000000000010101000101000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_v_count_reg\(7),
	datab => \vga_sync_unit|ALT_INV_v_count_reg\(3),
	datac => \vga_sync_unit|ALT_INV_v_count_reg\(6),
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(4),
	datae => \vga_sync_unit|ALT_INV_v_count_reg\(9),
	dataf => \vga_sync_unit|ALT_INV_v_count_reg[5]~DUPLICATE_q\,
	combout => \pixel_generate|LessThan0~1_combout\);

-- Location: LABCELL_X30_Y77_N36
\pixel_generate|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|LessThan0~0_combout\ = ( !\vga_sync_unit|v_count_reg\(8) & ( !\vga_sync_unit|v_count_reg\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \vga_sync_unit|ALT_INV_v_count_reg\(9),
	dataf => \vga_sync_unit|ALT_INV_v_count_reg\(8),
	combout => \pixel_generate|LessThan0~0_combout\);

-- Location: LABCELL_X29_Y77_N0
\pixel_generate|rgb_out[16]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[16]~6_combout\ = ( \vga_sync_unit|Equal0~0_combout\ & ( \vga_sync_unit|LessThan5~0_combout\ & ( (\pixel_generate|rgb_out[16]~5_combout\ & (!\pixel_generate|LessThan0~1_combout\ & !\pixel_generate|LessThan0~0_combout\)) ) ) ) # ( 
-- !\vga_sync_unit|Equal0~0_combout\ & ( \vga_sync_unit|LessThan5~0_combout\ & ( (!\pixel_generate|rgb_out[16]~4_combout\ & (\pixel_generate|rgb_out[16]~5_combout\ & (!\pixel_generate|LessThan0~1_combout\ & !\pixel_generate|LessThan0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000100000000000000011000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \pixel_generate|ALT_INV_rgb_out[16]~4_combout\,
	datab => \pixel_generate|ALT_INV_rgb_out[16]~5_combout\,
	datac => \pixel_generate|ALT_INV_LessThan0~1_combout\,
	datad => \pixel_generate|ALT_INV_LessThan0~0_combout\,
	datae => \vga_sync_unit|ALT_INV_Equal0~0_combout\,
	dataf => \vga_sync_unit|ALT_INV_LessThan5~0_combout\,
	combout => \pixel_generate|rgb_out[16]~6_combout\);

-- Location: LABCELL_X29_Y77_N12
\pixel_generate|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|LessThan0~2_combout\ = ( !\pixel_generate|LessThan0~1_combout\ & ( !\pixel_generate|LessThan0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \pixel_generate|ALT_INV_LessThan0~0_combout\,
	dataf => \pixel_generate|ALT_INV_LessThan0~1_combout\,
	combout => \pixel_generate|LessThan0~2_combout\);

-- Location: LABCELL_X29_Y77_N18
\pixel_generate|rgb_out[16]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[16]~7_combout\ = ( \pixel_generate|rgb_out[16]~6_combout\ & ( \pixel_generate|LessThan0~2_combout\ ) ) # ( \pixel_generate|rgb_out[16]~6_combout\ & ( !\pixel_generate|LessThan0~2_combout\ ) ) # ( 
-- !\pixel_generate|rgb_out[16]~6_combout\ & ( !\pixel_generate|LessThan0~2_combout\ & ( (!\pixel_generate|rgb_out[16]~1_combout\ & (((!\vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ & \pixel_generate|rgb_out[16]~3_combout\)))) # 
-- (\pixel_generate|rgb_out[16]~1_combout\ & ((!\vga_sync_unit|h_count_reg\(9)) # ((!\vga_sync_unit|h_count_reg[8]~DUPLICATE_q\ & \pixel_generate|rgb_out[16]~3_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010011110100111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \pixel_generate|ALT_INV_rgb_out[16]~1_combout\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(9),
	datac => \vga_sync_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datad => \pixel_generate|ALT_INV_rgb_out[16]~3_combout\,
	datae => \pixel_generate|ALT_INV_rgb_out[16]~6_combout\,
	dataf => \pixel_generate|ALT_INV_LessThan0~2_combout\,
	combout => \pixel_generate|rgb_out[16]~7_combout\);

-- Location: LABCELL_X29_Y77_N57
\rgb_reg[16]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rgb_reg[16]~feeder_combout\ = ( \pixel_generate|rgb_out[16]~7_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \pixel_generate|ALT_INV_rgb_out[16]~7_combout\,
	combout => \rgb_reg[16]~feeder_combout\);

-- Location: FF_X29_Y77_N58
\rgb_reg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \rgb_reg[16]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(16));

-- Location: FF_X29_Y77_N4
\rgb_reg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[16]~7_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(17));

-- Location: FF_X29_Y77_N25
\rgb_reg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[16]~7_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(18));

-- Location: FF_X29_Y77_N22
\rgb_reg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[16]~7_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(19));

-- Location: FF_X29_Y77_N59
\rgb_reg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \rgb_reg[16]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(20));

-- Location: FF_X29_Y77_N23
\rgb_reg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[16]~7_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(21));

-- Location: FF_X29_Y77_N5
\rgb_reg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[16]~7_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(22));

-- Location: FF_X29_Y77_N52
\rgb_reg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[16]~7_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(23));

-- Location: LABCELL_X29_Y77_N48
\pixel_generate|rgb_out[8]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[8]~8_combout\ = ( \pixel_generate|rgb_out[16]~6_combout\ & ( \pixel_generate|LessThan0~2_combout\ ) ) # ( \pixel_generate|rgb_out[16]~6_combout\ & ( !\pixel_generate|LessThan0~2_combout\ ) ) # ( 
-- !\pixel_generate|rgb_out[16]~6_combout\ & ( !\pixel_generate|LessThan0~2_combout\ & ( (!\vga_sync_unit|h_count_reg[9]~DUPLICATE_q\ & !\pixel_generate|rgb_out[16]~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \vga_sync_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	datac => \pixel_generate|ALT_INV_rgb_out[16]~1_combout\,
	datae => \pixel_generate|ALT_INV_rgb_out[16]~6_combout\,
	dataf => \pixel_generate|ALT_INV_LessThan0~2_combout\,
	combout => \pixel_generate|rgb_out[8]~8_combout\);

-- Location: FF_X28_Y77_N23
\rgb_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[8]~8_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(8));

-- Location: FF_X29_Y77_N32
\rgb_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[8]~8_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(9));

-- Location: FF_X29_Y77_N37
\rgb_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[8]~8_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(10));

-- Location: FF_X28_Y77_N5
\rgb_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[8]~8_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(11));

-- Location: FF_X29_Y77_N43
\rgb_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[8]~8_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(12));

-- Location: FF_X29_Y77_N50
\rgb_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \pixel_generate|rgb_out[8]~8_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(13));

-- Location: FF_X29_Y77_N34
\rgb_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[8]~8_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(14));

-- Location: FF_X29_Y77_N19
\rgb_reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[8]~8_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(15));

-- Location: LABCELL_X27_Y77_N12
\pixel_generate|b~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|b~2_combout\ = ( \vga_sync_unit|h_count_reg\(6) & ( \vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & ( ((\vga_sync_unit|h_count_reg\(3) & ((\vga_sync_unit|h_count_reg\(2)) # (\vga_sync_unit|h_count_reg[1]~DUPLICATE_q\)))) # 
-- (\vga_sync_unit|h_count_reg\(8)) ) ) ) # ( !\vga_sync_unit|h_count_reg\(6) & ( \vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & ( ((\vga_sync_unit|h_count_reg\(3) & ((\vga_sync_unit|h_count_reg\(2)) # (\vga_sync_unit|h_count_reg[1]~DUPLICATE_q\)))) # 
-- (\vga_sync_unit|h_count_reg\(8)) ) ) ) # ( \vga_sync_unit|h_count_reg\(6) & ( !\vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & ( \vga_sync_unit|h_count_reg\(8) ) ) ) # ( !\vga_sync_unit|h_count_reg\(6) & ( !\vga_sync_unit|h_count_reg[4]~DUPLICATE_q\ & ( 
-- (\vga_sync_unit|h_count_reg[1]~DUPLICATE_q\ & (\vga_sync_unit|h_count_reg\(2) & (\vga_sync_unit|h_count_reg\(3) & \vga_sync_unit|h_count_reg\(8)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000001111111100000111111111110000011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg[1]~DUPLICATE_q\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(2),
	datac => \vga_sync_unit|ALT_INV_h_count_reg\(3),
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	datae => \vga_sync_unit|ALT_INV_h_count_reg\(6),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\,
	combout => \pixel_generate|b~2_combout\);

-- Location: MLABCELL_X28_Y77_N18
\pixel_generate|b~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|b~3_combout\ = ( \pixel_generate|b~2_combout\ & ( \pixel_generate|LessThan2~0_combout\ & ( (!\vga_sync_unit|h_count_reg\(8) & (!\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & !\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\)) ) ) ) # ( 
-- !\pixel_generate|b~2_combout\ & ( \pixel_generate|LessThan2~0_combout\ & ( (!\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & ((!\vga_sync_unit|h_count_reg\(5)) # ((!\vga_sync_unit|h_count_reg\(8) & !\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\)))) ) ) ) # ( 
-- \pixel_generate|b~2_combout\ & ( !\pixel_generate|LessThan2~0_combout\ & ( (!\vga_sync_unit|h_count_reg\(8) & ((!\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\) # (\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\))) ) ) ) # ( !\pixel_generate|b~2_combout\ & ( 
-- !\pixel_generate|LessThan2~0_combout\ & ( (!\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ & ((!\vga_sync_unit|h_count_reg\(5)) # ((!\vga_sync_unit|h_count_reg\(8) & !\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\)))) # (\vga_sync_unit|h_count_reg[7]~DUPLICATE_q\ 
-- & (!\vga_sync_unit|h_count_reg\(8))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110101011001010101010100000101011100000110000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg\(8),
	datab => \vga_sync_unit|ALT_INV_h_count_reg\(5),
	datac => \vga_sync_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	datae => \pixel_generate|ALT_INV_b~2_combout\,
	dataf => \pixel_generate|ALT_INV_LessThan2~0_combout\,
	combout => \pixel_generate|b~3_combout\);

-- Location: LABCELL_X29_Y77_N42
\pixel_generate|rgb_out[0]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[0]~9_combout\ = ( \pixel_generate|rgb_out[0]~2_combout\ & ( \pixel_generate|LessThan0~1_combout\ & ( \pixel_generate|rgb_out[0]~0_combout\ ) ) ) # ( \pixel_generate|rgb_out[0]~2_combout\ & ( !\pixel_generate|LessThan0~1_combout\ & 
-- ( (\pixel_generate|rgb_out[0]~0_combout\ & \pixel_generate|LessThan0~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \pixel_generate|ALT_INV_rgb_out[0]~0_combout\,
	datad => \pixel_generate|ALT_INV_LessThan0~0_combout\,
	datae => \pixel_generate|ALT_INV_rgb_out[0]~2_combout\,
	dataf => \pixel_generate|ALT_INV_LessThan0~1_combout\,
	combout => \pixel_generate|rgb_out[0]~9_combout\);

-- Location: LABCELL_X29_Y77_N54
\pixel_generate|b~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|b~0_combout\ = ( !\vga_sync_unit|h_count_reg[3]~DUPLICATE_q\ & ( (!\vga_sync_unit|h_count_reg\(4) & (!\vga_sync_unit|h_count_reg[2]~DUPLICATE_q\ & !\vga_sync_unit|h_count_reg\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg\(4),
	datac => \vga_sync_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\,
	datad => \vga_sync_unit|ALT_INV_h_count_reg\(1),
	dataf => \vga_sync_unit|ALT_INV_h_count_reg[3]~DUPLICATE_q\,
	combout => \pixel_generate|b~0_combout\);

-- Location: LABCELL_X29_Y77_N30
\pixel_generate|b~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|b~1_combout\ = ( \pixel_generate|b~0_combout\ & ( \vga_sync_unit|h_count_reg\(7) & ( (\pixel_generate|rgb_out[16]~1_combout\ & ((!\vga_sync_unit|h_count_reg[5]~DUPLICATE_q\) # (!\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\))) ) ) ) # ( 
-- !\pixel_generate|b~0_combout\ & ( \vga_sync_unit|h_count_reg\(7) & ( (!\vga_sync_unit|h_count_reg[6]~DUPLICATE_q\ & \pixel_generate|rgb_out[16]~1_combout\) ) ) ) # ( \pixel_generate|b~0_combout\ & ( !\vga_sync_unit|h_count_reg\(7) & ( 
-- \pixel_generate|rgb_out[16]~1_combout\ ) ) ) # ( !\pixel_generate|b~0_combout\ & ( !\vga_sync_unit|h_count_reg\(7) & ( \pixel_generate|rgb_out[16]~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001100000011000000111000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datab => \vga_sync_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	datac => \pixel_generate|ALT_INV_rgb_out[16]~1_combout\,
	datae => \pixel_generate|ALT_INV_b~0_combout\,
	dataf => \vga_sync_unit|ALT_INV_h_count_reg\(7),
	combout => \pixel_generate|b~1_combout\);

-- Location: LABCELL_X29_Y77_N6
\pixel_generate|rgb_out[0]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb_out[0]~10_combout\ = ( \pixel_generate|rgb_out[16]~6_combout\ & ( \pixel_generate|b~1_combout\ ) ) # ( !\pixel_generate|rgb_out[16]~6_combout\ & ( \pixel_generate|b~1_combout\ & ( ((!\vga_sync_unit|h_count_reg[9]~DUPLICATE_q\ & 
-- !\pixel_generate|LessThan0~2_combout\)) # (\pixel_generate|rgb_out[0]~9_combout\) ) ) ) # ( \pixel_generate|rgb_out[16]~6_combout\ & ( !\pixel_generate|b~1_combout\ ) ) # ( !\pixel_generate|rgb_out[16]~6_combout\ & ( !\pixel_generate|b~1_combout\ & ( 
-- ((!\vga_sync_unit|h_count_reg[9]~DUPLICATE_q\ & (\pixel_generate|b~3_combout\ & !\pixel_generate|LessThan0~2_combout\))) # (\pixel_generate|rgb_out[0]~9_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010111100001111111111111111111110101111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \vga_sync_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	datab => \pixel_generate|ALT_INV_b~3_combout\,
	datac => \pixel_generate|ALT_INV_rgb_out[0]~9_combout\,
	datad => \pixel_generate|ALT_INV_LessThan0~2_combout\,
	datae => \pixel_generate|ALT_INV_rgb_out[16]~6_combout\,
	dataf => \pixel_generate|ALT_INV_b~1_combout\,
	combout => \pixel_generate|rgb_out[0]~10_combout\);

-- Location: LABCELL_X29_Y77_N15
\rgb_reg[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rgb_reg[0]~feeder_combout\ = ( \pixel_generate|rgb_out[0]~10_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \pixel_generate|ALT_INV_rgb_out[0]~10_combout\,
	combout => \rgb_reg[0]~feeder_combout\);

-- Location: FF_X29_Y77_N16
\rgb_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \rgb_reg[0]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(0));

-- Location: FF_X29_Y77_N14
\rgb_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[0]~10_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(1));

-- Location: FF_X29_Y77_N40
\rgb_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[0]~10_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(2));

-- Location: FF_X29_Y77_N17
\rgb_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \rgb_reg[0]~feeder_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(3));

-- Location: FF_X29_Y77_N47
\rgb_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[0]~10_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(4));

-- Location: FF_X29_Y77_N41
\rgb_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[0]~10_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(5));

-- Location: FF_X29_Y77_N10
\rgb_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \pixel_generate|rgb_out[0]~10_combout\,
	clrn => \KEY[0]~input_o\,
	sload => VCC,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(6));

-- Location: FF_X29_Y77_N8
\rgb_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \pixel_generate|rgb_out[0]~10_combout\,
	clrn => \KEY[0]~input_o\,
	ena => \vga_sync_unit|mod2_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rgb_reg(7));

-- Location: IOIBUF_X36_Y0_N18
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X40_Y0_N18
\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: LABCELL_X51_Y19_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


