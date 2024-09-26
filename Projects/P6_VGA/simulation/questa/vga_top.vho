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

-- DATE "09/25/2024 14:26:00"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
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
	VGA_HS : BUFFER std_logic;
	VGA_VS : BUFFER std_logic;
	frame_start : BUFFER std_logic;
	frame_end : BUFFER std_logic;
	VGA_R : BUFFER std_logic_vector(7 DOWNTO 0);
	VGA_G : BUFFER std_logic_vector(7 DOWNTO 0);
	VGA_B : BUFFER std_logic_vector(7 DOWNTO 0);
	hcount : BUFFER std_logic_vector(10 DOWNTO 0);
	vcount : BUFFER std_logic_vector(10 DOWNTO 0)
	);
END vga_top;

-- Design Ports Information
-- KEY[1]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_H20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_HS	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_VS	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- frame_start	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- frame_end	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[0]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[1]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[3]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[4]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[5]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[6]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_R[7]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[1]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[2]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[3]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[4]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[5]	=>  Location: PIN_E20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[6]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_G[7]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[0]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[1]	=>  Location: PIN_V20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[2]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[3]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[4]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[5]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[6]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VGA_B[7]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[0]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[1]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[2]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[3]	=>  Location: PIN_U20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[4]	=>  Location: PIN_U17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[5]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[6]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[7]	=>  Location: PIN_T20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[8]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[9]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hcount[10]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[1]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[2]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[3]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[4]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[5]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[6]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[7]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[8]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[9]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- vcount[10]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_V19,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_frame_start : std_logic;
SIGNAL ww_frame_end : std_logic;
SIGNAL ww_VGA_R : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_VGA_G : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_VGA_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_hcount : std_logic_vector(10 DOWNTO 0);
SIGNAL ww_vcount : std_logic_vector(10 DOWNTO 0);
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \counter_unit|Add0~1_sumout\ : std_logic;
SIGNAL \q_reg[0]~0_combout\ : std_logic;
SIGNAL \counter_unit|Add0~2\ : std_logic;
SIGNAL \counter_unit|Add0~5_sumout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[1]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add0~6\ : std_logic;
SIGNAL \counter_unit|Add0~9_sumout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add0~10\ : std_logic;
SIGNAL \counter_unit|Add0~13_sumout\ : std_logic;
SIGNAL \counter_unit|Add0~14\ : std_logic;
SIGNAL \counter_unit|Add0~17_sumout\ : std_logic;
SIGNAL \counter_unit|Add0~18\ : std_logic;
SIGNAL \counter_unit|Add0~21_sumout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[5]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add0~22\ : std_logic;
SIGNAL \counter_unit|Add0~29_sumout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[6]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add0~30\ : std_logic;
SIGNAL \counter_unit|Add0~34\ : std_logic;
SIGNAL \counter_unit|Add0~41_sumout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[8]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add0~42\ : std_logic;
SIGNAL \counter_unit|Add0~37_sumout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add0~38\ : std_logic;
SIGNAL \counter_unit|Add0~25_sumout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[10]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Equal0~1_combout\ : std_logic;
SIGNAL \counter_unit|Equal0~0_combout\ : std_logic;
SIGNAL \counter_unit|Equal0~2_combout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[7]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add0~33_sumout\ : std_logic;
SIGNAL \counter_unit|h_count_reg[4]~DUPLICATE_q\ : std_logic;
SIGNAL \hsync_i~0_combout\ : std_logic;
SIGNAL \hsync_i~1_combout\ : std_logic;
SIGNAL \VGA_HS~reg0_q\ : std_logic;
SIGNAL \counter_unit|Add1~9_sumout\ : std_logic;
SIGNAL \counter_unit|Add1~2\ : std_logic;
SIGNAL \counter_unit|Add1~33_sumout\ : std_logic;
SIGNAL \counter_unit|process_2~0_combout\ : std_logic;
SIGNAL \counter_unit|Add1~34\ : std_logic;
SIGNAL \counter_unit|Add1~5_sumout\ : std_logic;
SIGNAL \counter_unit|Equal1~1_combout\ : std_logic;
SIGNAL \counter_unit|Equal1~0_combout\ : std_logic;
SIGNAL \counter_unit|Equal1~2_combout\ : std_logic;
SIGNAL \counter_unit|v_count_reg[0]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add1~10\ : std_logic;
SIGNAL \counter_unit|Add1~13_sumout\ : std_logic;
SIGNAL \counter_unit|Add1~14\ : std_logic;
SIGNAL \counter_unit|Add1~37_sumout\ : std_logic;
SIGNAL \counter_unit|Add1~38\ : std_logic;
SIGNAL \counter_unit|Add1~41_sumout\ : std_logic;
SIGNAL \counter_unit|v_count_reg[3]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add1~42\ : std_logic;
SIGNAL \counter_unit|Add1~17_sumout\ : std_logic;
SIGNAL \counter_unit|v_count_reg[4]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add1~18\ : std_logic;
SIGNAL \counter_unit|Add1~21_sumout\ : std_logic;
SIGNAL \counter_unit|Add1~22\ : std_logic;
SIGNAL \counter_unit|Add1~25_sumout\ : std_logic;
SIGNAL \counter_unit|v_count_reg[6]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add1~26\ : std_logic;
SIGNAL \counter_unit|Add1~29_sumout\ : std_logic;
SIGNAL \counter_unit|v_count_reg[7]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|Add1~30\ : std_logic;
SIGNAL \counter_unit|Add1~1_sumout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \counter_unit|v_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|v_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \vsync_i~0_combout\ : std_logic;
SIGNAL \vsync_i~1_combout\ : std_logic;
SIGNAL \VGA_VS~reg0_q\ : std_logic;
SIGNAL \counter_unit|frame_start~1_combout\ : std_logic;
SIGNAL \counter_unit|frame_start~2_combout\ : std_logic;
SIGNAL \counter_unit|frame_start~0_combout\ : std_logic;
SIGNAL \counter_unit|frame_start~combout\ : std_logic;
SIGNAL \counter_unit|frame_end~combout\ : std_logic;
SIGNAL \pixel_generate|rgb[8]~1_combout\ : std_logic;
SIGNAL \pixel_generate|rgb[8]~0_combout\ : std_logic;
SIGNAL \pixel_generate|LessThan0~0_combout\ : std_logic;
SIGNAL \pixel_generate|LessThan0~1_combout\ : std_logic;
SIGNAL \video_on_i~0_combout\ : std_logic;
SIGNAL \video_on_i~1_combout\ : std_logic;
SIGNAL \VGA_R~0_combout\ : std_logic;
SIGNAL \VGA_R~1_combout\ : std_logic;
SIGNAL \VGA_R[0]~reg0_q\ : std_logic;
SIGNAL \VGA_R[1]~reg0_q\ : std_logic;
SIGNAL \VGA_R[2]~reg0_q\ : std_logic;
SIGNAL \VGA_R[3]~reg0_q\ : std_logic;
SIGNAL \pixel_generate|LessThan4~0_combout\ : std_logic;
SIGNAL \VGA_G~0_combout\ : std_logic;
SIGNAL \VGA_G[0]~reg0_q\ : std_logic;
SIGNAL \VGA_G[1]~reg0_q\ : std_logic;
SIGNAL \VGA_G[2]~reg0_q\ : std_logic;
SIGNAL \VGA_G[3]~reg0_q\ : std_logic;
SIGNAL \counter_unit|Equal0~3_combout\ : std_logic;
SIGNAL \VGA_B~0_combout\ : std_logic;
SIGNAL \VGA_B~2_combout\ : std_logic;
SIGNAL \VGA_B~3_combout\ : std_logic;
SIGNAL \VGA_B~1_combout\ : std_logic;
SIGNAL \VGA_B[0]~reg0_q\ : std_logic;
SIGNAL \VGA_B[1]~reg0_q\ : std_logic;
SIGNAL \VGA_B[2]~reg0_q\ : std_logic;
SIGNAL \VGA_B[3]~reg0_q\ : std_logic;
SIGNAL q_reg : std_logic_vector(1 DOWNTO 0);
SIGNAL \counter_unit|v_count_reg\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \counter_unit|h_count_reg\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \counter_unit|ALT_INV_h_count_reg\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \counter_unit|ALT_INV_v_count_reg\ : std_logic_vector(10 DOWNTO 1);
SIGNAL \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_h_count_reg[10]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_v_count_reg[3]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_h_count_reg[1]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_v_count_reg[7]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_v_count_reg[6]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_v_count_reg[4]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_unit|ALT_INV_v_count_reg[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_VGA_B~3_combout\ : std_logic;
SIGNAL \ALT_INV_VGA_B~2_combout\ : std_logic;
SIGNAL \ALT_INV_VGA_B~0_combout\ : std_logic;
SIGNAL \counter_unit|ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_LessThan4~0_combout\ : std_logic;
SIGNAL \ALT_INV_video_on_i~1_combout\ : std_logic;
SIGNAL \ALT_INV_video_on_i~0_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb[8]~1_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_rgb[8]~0_combout\ : std_logic;
SIGNAL \ALT_INV_VGA_R~0_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \pixel_generate|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL ALT_INV_q_reg : std_logic_vector(0 DOWNTO 0);
SIGNAL \ALT_INV_vsync_i~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan5~0_combout\ : std_logic;
SIGNAL \ALT_INV_hsync_i~0_combout\ : std_logic;
SIGNAL \counter_unit|ALT_INV_Equal1~1_combout\ : std_logic;
SIGNAL \counter_unit|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \counter_unit|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \counter_unit|ALT_INV_frame_start~2_combout\ : std_logic;
SIGNAL \counter_unit|ALT_INV_frame_start~1_combout\ : std_logic;
SIGNAL \counter_unit|ALT_INV_frame_start~0_combout\ : std_logic;
SIGNAL \counter_unit|ALT_INV_Equal1~0_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
VGA_HS <= ww_VGA_HS;
VGA_VS <= ww_VGA_VS;
frame_start <= ww_frame_start;
frame_end <= ww_frame_end;
VGA_R <= ww_VGA_R;
VGA_G <= ww_VGA_G;
VGA_B <= ww_VGA_B;
hcount <= ww_hcount;
vcount <= ww_vcount;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\counter_unit|ALT_INV_h_count_reg\(8) <= NOT \counter_unit|h_count_reg\(8);
\counter_unit|ALT_INV_h_count_reg\(9) <= NOT \counter_unit|h_count_reg\(9);
\counter_unit|ALT_INV_h_count_reg\(7) <= NOT \counter_unit|h_count_reg\(7);
\counter_unit|ALT_INV_h_count_reg\(6) <= NOT \counter_unit|h_count_reg\(6);
\counter_unit|ALT_INV_h_count_reg\(10) <= NOT \counter_unit|h_count_reg\(10);
\counter_unit|ALT_INV_h_count_reg\(5) <= NOT \counter_unit|h_count_reg\(5);
\counter_unit|ALT_INV_h_count_reg\(4) <= NOT \counter_unit|h_count_reg\(4);
\counter_unit|ALT_INV_v_count_reg\(3) <= NOT \counter_unit|v_count_reg\(3);
\counter_unit|ALT_INV_v_count_reg\(2) <= NOT \counter_unit|v_count_reg\(2);
\counter_unit|ALT_INV_v_count_reg\(9) <= NOT \counter_unit|v_count_reg\(9);
\counter_unit|ALT_INV_h_count_reg\(3) <= NOT \counter_unit|h_count_reg\(3);
\counter_unit|ALT_INV_h_count_reg\(2) <= NOT \counter_unit|h_count_reg\(2);
\counter_unit|ALT_INV_h_count_reg\(1) <= NOT \counter_unit|h_count_reg\(1);
\counter_unit|ALT_INV_h_count_reg\(0) <= NOT \counter_unit|h_count_reg\(0);
\counter_unit|ALT_INV_v_count_reg\(7) <= NOT \counter_unit|v_count_reg\(7);
\counter_unit|ALT_INV_v_count_reg\(5) <= NOT \counter_unit|v_count_reg\(5);
\counter_unit|ALT_INV_v_count_reg\(4) <= NOT \counter_unit|v_count_reg\(4);
\counter_unit|ALT_INV_v_count_reg\(1) <= NOT \counter_unit|v_count_reg\(1);
\counter_unit|ALT_INV_v_count_reg\(10) <= NOT \counter_unit|v_count_reg\(10);
\counter_unit|ALT_INV_v_count_reg\(8) <= NOT \counter_unit|v_count_reg\(8);
\counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[8]~DUPLICATE_q\;
\counter_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[9]~DUPLICATE_q\;
\counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[7]~DUPLICATE_q\;
\counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[6]~DUPLICATE_q\;
\counter_unit|ALT_INV_h_count_reg[10]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[10]~DUPLICATE_q\;
\counter_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[5]~DUPLICATE_q\;
\counter_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[4]~DUPLICATE_q\;
\counter_unit|ALT_INV_v_count_reg[3]~DUPLICATE_q\ <= NOT \counter_unit|v_count_reg[3]~DUPLICATE_q\;
\counter_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\ <= NOT \counter_unit|v_count_reg[2]~DUPLICATE_q\;
\counter_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\ <= NOT \counter_unit|v_count_reg[9]~DUPLICATE_q\;
\counter_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[2]~DUPLICATE_q\;
\counter_unit|ALT_INV_h_count_reg[1]~DUPLICATE_q\ <= NOT \counter_unit|h_count_reg[1]~DUPLICATE_q\;
\counter_unit|ALT_INV_v_count_reg[7]~DUPLICATE_q\ <= NOT \counter_unit|v_count_reg[7]~DUPLICATE_q\;
\counter_unit|ALT_INV_v_count_reg[6]~DUPLICATE_q\ <= NOT \counter_unit|v_count_reg[6]~DUPLICATE_q\;
\counter_unit|ALT_INV_v_count_reg[4]~DUPLICATE_q\ <= NOT \counter_unit|v_count_reg[4]~DUPLICATE_q\;
\counter_unit|ALT_INV_v_count_reg[0]~DUPLICATE_q\ <= NOT \counter_unit|v_count_reg[0]~DUPLICATE_q\;
\ALT_INV_VGA_B~3_combout\ <= NOT \VGA_B~3_combout\;
\ALT_INV_VGA_B~2_combout\ <= NOT \VGA_B~2_combout\;
\ALT_INV_VGA_B~0_combout\ <= NOT \VGA_B~0_combout\;
\counter_unit|ALT_INV_Equal0~3_combout\ <= NOT \counter_unit|Equal0~3_combout\;
\pixel_generate|ALT_INV_LessThan4~0_combout\ <= NOT \pixel_generate|LessThan4~0_combout\;
\ALT_INV_video_on_i~1_combout\ <= NOT \video_on_i~1_combout\;
\ALT_INV_video_on_i~0_combout\ <= NOT \video_on_i~0_combout\;
\pixel_generate|ALT_INV_rgb[8]~1_combout\ <= NOT \pixel_generate|rgb[8]~1_combout\;
\pixel_generate|ALT_INV_rgb[8]~0_combout\ <= NOT \pixel_generate|rgb[8]~0_combout\;
\ALT_INV_VGA_R~0_combout\ <= NOT \VGA_R~0_combout\;
\pixel_generate|ALT_INV_LessThan0~1_combout\ <= NOT \pixel_generate|LessThan0~1_combout\;
\pixel_generate|ALT_INV_LessThan0~0_combout\ <= NOT \pixel_generate|LessThan0~0_combout\;
ALT_INV_q_reg(0) <= NOT q_reg(0);
\ALT_INV_vsync_i~0_combout\ <= NOT \vsync_i~0_combout\;
\ALT_INV_LessThan5~0_combout\ <= NOT \LessThan5~0_combout\;
\ALT_INV_hsync_i~0_combout\ <= NOT \hsync_i~0_combout\;
\counter_unit|ALT_INV_Equal1~1_combout\ <= NOT \counter_unit|Equal1~1_combout\;
\counter_unit|ALT_INV_Equal0~1_combout\ <= NOT \counter_unit|Equal0~1_combout\;
\counter_unit|ALT_INV_Equal0~0_combout\ <= NOT \counter_unit|Equal0~0_combout\;
\counter_unit|ALT_INV_frame_start~2_combout\ <= NOT \counter_unit|frame_start~2_combout\;
\counter_unit|ALT_INV_frame_start~1_combout\ <= NOT \counter_unit|frame_start~1_combout\;
\counter_unit|ALT_INV_frame_start~0_combout\ <= NOT \counter_unit|frame_start~0_combout\;
\counter_unit|ALT_INV_Equal1~0_combout\ <= NOT \counter_unit|Equal1~0_combout\;

-- Location: IOOBUF_X89_Y6_N39
\VGA_HS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_HS~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_HS);

-- Location: IOOBUF_X62_Y0_N2
\VGA_VS~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_VS~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_VS);

-- Location: IOOBUF_X60_Y0_N2
\frame_start~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|frame_start~combout\,
	devoe => ww_devoe,
	o => ww_frame_start);

-- Location: IOOBUF_X89_Y6_N22
\frame_end~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|frame_end~combout\,
	devoe => ww_devoe,
	o => ww_frame_end);

-- Location: IOOBUF_X66_Y0_N76
\VGA_R[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_R[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_R(0));

-- Location: IOOBUF_X60_Y0_N19
\VGA_R[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_R[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_R(1));

-- Location: IOOBUF_X68_Y0_N36
\VGA_R[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_R[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_R(2));

-- Location: IOOBUF_X62_Y0_N36
\VGA_R[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_R[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_R(3));

-- Location: IOOBUF_X66_Y81_N59
\VGA_R[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_R(4));

-- Location: IOOBUF_X88_Y81_N20
\VGA_R[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_R(5));

-- Location: IOOBUF_X4_Y0_N53
\VGA_R[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_R(6));

-- Location: IOOBUF_X70_Y81_N53
\VGA_R[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_R(7));

-- Location: IOOBUF_X60_Y0_N53
\VGA_G[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_G[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_G(0));

-- Location: IOOBUF_X66_Y0_N42
\VGA_G[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_G[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_G(1));

-- Location: IOOBUF_X89_Y8_N39
\VGA_G[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_G[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_G(2));

-- Location: IOOBUF_X66_Y0_N59
\VGA_G[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_G[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_G(3));

-- Location: IOOBUF_X62_Y81_N36
\VGA_G[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_G(4));

-- Location: IOOBUF_X76_Y81_N36
\VGA_G[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_G(5));

-- Location: IOOBUF_X74_Y81_N76
\VGA_G[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_G(6));

-- Location: IOOBUF_X6_Y0_N53
\VGA_G[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_G(7));

-- Location: IOOBUF_X66_Y0_N93
\VGA_B[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_B[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_B(0));

-- Location: IOOBUF_X62_Y0_N19
\VGA_B[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_B[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_B(1));

-- Location: IOOBUF_X68_Y0_N53
\VGA_B[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_B[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_B(2));

-- Location: IOOBUF_X60_Y0_N36
\VGA_B[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \VGA_B[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_VGA_B(3));

-- Location: IOOBUF_X50_Y0_N42
\VGA_B[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_B(4));

-- Location: IOOBUF_X52_Y0_N19
\VGA_B[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_B(5));

-- Location: IOOBUF_X86_Y81_N2
\VGA_B[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_B(6));

-- Location: IOOBUF_X28_Y81_N2
\VGA_B[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_VGA_B(7));

-- Location: IOOBUF_X89_Y6_N5
\hcount[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg\(0),
	devoe => ww_devoe,
	o => ww_hcount(0));

-- Location: IOOBUF_X89_Y6_N56
\hcount[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg[1]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_hcount(1));

-- Location: IOOBUF_X62_Y0_N53
\hcount[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg[2]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_hcount(2));

-- Location: IOOBUF_X72_Y0_N36
\hcount[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg\(3),
	devoe => ww_devoe,
	o => ww_hcount(3));

-- Location: IOOBUF_X72_Y0_N2
\hcount[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg\(4),
	devoe => ww_devoe,
	o => ww_hcount(4));

-- Location: IOOBUF_X89_Y8_N5
\hcount[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg\(5),
	devoe => ww_devoe,
	o => ww_hcount(5));

-- Location: IOOBUF_X89_Y4_N79
\hcount[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg\(6),
	devoe => ww_devoe,
	o => ww_hcount(6));

-- Location: IOOBUF_X89_Y4_N96
\hcount[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg\(7),
	devoe => ww_devoe,
	o => ww_hcount(7));

-- Location: IOOBUF_X89_Y4_N45
\hcount[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg[8]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_hcount(8));

-- Location: IOOBUF_X70_Y0_N2
\hcount[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg\(9),
	devoe => ww_devoe,
	o => ww_hcount(9));

-- Location: IOOBUF_X89_Y4_N62
\hcount[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|h_count_reg\(10),
	devoe => ww_devoe,
	o => ww_hcount(10));

-- Location: IOOBUF_X64_Y0_N19
\vcount[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg\(0),
	devoe => ww_devoe,
	o => ww_vcount(0));

-- Location: IOOBUF_X58_Y0_N93
\vcount[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg\(1),
	devoe => ww_devoe,
	o => ww_vcount(1));

-- Location: IOOBUF_X70_Y0_N36
\vcount[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg[2]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_vcount(2));

-- Location: IOOBUF_X68_Y0_N2
\vcount[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg\(3),
	devoe => ww_devoe,
	o => ww_vcount(3));

-- Location: IOOBUF_X64_Y0_N36
\vcount[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg\(4),
	devoe => ww_devoe,
	o => ww_vcount(4));

-- Location: IOOBUF_X64_Y0_N53
\vcount[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg\(5),
	devoe => ww_devoe,
	o => ww_vcount(5));

-- Location: IOOBUF_X64_Y0_N2
\vcount[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg\(6),
	devoe => ww_devoe,
	o => ww_vcount(6));

-- Location: IOOBUF_X70_Y0_N53
\vcount[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg[7]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_vcount(7));

-- Location: IOOBUF_X72_Y0_N53
\vcount[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg\(8),
	devoe => ww_devoe,
	o => ww_vcount(8));

-- Location: IOOBUF_X68_Y0_N19
\vcount[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg[9]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_vcount(9));

-- Location: IOOBUF_X72_Y0_N19
\vcount[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \counter_unit|v_count_reg\(10),
	devoe => ww_devoe,
	o => ww_vcount(10));

-- Location: IOIBUF_X89_Y35_N61
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G10
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

-- Location: IOIBUF_X70_Y0_N18
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: MLABCELL_X78_Y3_N0
\counter_unit|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~1_sumout\ = SUM(( \counter_unit|h_count_reg\(0) ) + ( VCC ) + ( !VCC ))
-- \counter_unit|Add0~2\ = CARRY(( \counter_unit|h_count_reg\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_h_count_reg\(0),
	cin => GND,
	sumout => \counter_unit|Add0~1_sumout\,
	cout => \counter_unit|Add0~2\);

-- Location: LABCELL_X74_Y3_N3
\q_reg[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \q_reg[0]~0_combout\ = ( !q_reg(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_q_reg(0),
	combout => \q_reg[0]~0_combout\);

-- Location: FF_X74_Y3_N5
\q_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \q_reg[0]~0_combout\,
	clrn => \KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => q_reg(0));

-- Location: FF_X78_Y3_N2
\counter_unit|h_count_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(0));

-- Location: MLABCELL_X78_Y3_N3
\counter_unit|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~5_sumout\ = SUM(( \counter_unit|h_count_reg[1]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~2\ ))
-- \counter_unit|Add0~6\ = CARRY(( \counter_unit|h_count_reg[1]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_h_count_reg[1]~DUPLICATE_q\,
	cin => \counter_unit|Add0~2\,
	sumout => \counter_unit|Add0~5_sumout\,
	cout => \counter_unit|Add0~6\);

-- Location: FF_X78_Y3_N5
\counter_unit|h_count_reg[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[1]~DUPLICATE_q\);

-- Location: MLABCELL_X78_Y3_N6
\counter_unit|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~9_sumout\ = SUM(( \counter_unit|h_count_reg[2]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~6\ ))
-- \counter_unit|Add0~10\ = CARRY(( \counter_unit|h_count_reg[2]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\,
	cin => \counter_unit|Add0~6\,
	sumout => \counter_unit|Add0~9_sumout\,
	cout => \counter_unit|Add0~10\);

-- Location: FF_X78_Y3_N7
\counter_unit|h_count_reg[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[2]~DUPLICATE_q\);

-- Location: MLABCELL_X78_Y3_N9
\counter_unit|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~13_sumout\ = SUM(( \counter_unit|h_count_reg\(3) ) + ( GND ) + ( \counter_unit|Add0~10\ ))
-- \counter_unit|Add0~14\ = CARRY(( \counter_unit|h_count_reg\(3) ) + ( GND ) + ( \counter_unit|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_h_count_reg\(3),
	cin => \counter_unit|Add0~10\,
	sumout => \counter_unit|Add0~13_sumout\,
	cout => \counter_unit|Add0~14\);

-- Location: FF_X78_Y3_N11
\counter_unit|h_count_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(3));

-- Location: MLABCELL_X78_Y3_N12
\counter_unit|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~17_sumout\ = SUM(( \counter_unit|h_count_reg\(4) ) + ( GND ) + ( \counter_unit|Add0~14\ ))
-- \counter_unit|Add0~18\ = CARRY(( \counter_unit|h_count_reg\(4) ) + ( GND ) + ( \counter_unit|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_h_count_reg\(4),
	cin => \counter_unit|Add0~14\,
	sumout => \counter_unit|Add0~17_sumout\,
	cout => \counter_unit|Add0~18\);

-- Location: FF_X78_Y3_N14
\counter_unit|h_count_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(4));

-- Location: MLABCELL_X78_Y3_N15
\counter_unit|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~21_sumout\ = SUM(( \counter_unit|h_count_reg[5]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~18\ ))
-- \counter_unit|Add0~22\ = CARRY(( \counter_unit|h_count_reg[5]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	cin => \counter_unit|Add0~18\,
	sumout => \counter_unit|Add0~21_sumout\,
	cout => \counter_unit|Add0~22\);

-- Location: FF_X78_Y3_N17
\counter_unit|h_count_reg[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[5]~DUPLICATE_q\);

-- Location: MLABCELL_X78_Y3_N18
\counter_unit|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~29_sumout\ = SUM(( \counter_unit|h_count_reg[6]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~22\ ))
-- \counter_unit|Add0~30\ = CARRY(( \counter_unit|h_count_reg[6]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	cin => \counter_unit|Add0~22\,
	sumout => \counter_unit|Add0~29_sumout\,
	cout => \counter_unit|Add0~30\);

-- Location: FF_X78_Y3_N20
\counter_unit|h_count_reg[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[6]~DUPLICATE_q\);

-- Location: MLABCELL_X78_Y3_N21
\counter_unit|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~33_sumout\ = SUM(( \counter_unit|h_count_reg[7]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~30\ ))
-- \counter_unit|Add0~34\ = CARRY(( \counter_unit|h_count_reg[7]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	cin => \counter_unit|Add0~30\,
	sumout => \counter_unit|Add0~33_sumout\,
	cout => \counter_unit|Add0~34\);

-- Location: MLABCELL_X78_Y3_N24
\counter_unit|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~41_sumout\ = SUM(( \counter_unit|h_count_reg[8]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~34\ ))
-- \counter_unit|Add0~42\ = CARRY(( \counter_unit|h_count_reg[8]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	cin => \counter_unit|Add0~34\,
	sumout => \counter_unit|Add0~41_sumout\,
	cout => \counter_unit|Add0~42\);

-- Location: FF_X78_Y3_N26
\counter_unit|h_count_reg[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~41_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[8]~DUPLICATE_q\);

-- Location: MLABCELL_X78_Y3_N27
\counter_unit|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~37_sumout\ = SUM(( \counter_unit|h_count_reg[9]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~42\ ))
-- \counter_unit|Add0~38\ = CARRY(( \counter_unit|h_count_reg[9]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	cin => \counter_unit|Add0~42\,
	sumout => \counter_unit|Add0~37_sumout\,
	cout => \counter_unit|Add0~38\);

-- Location: FF_X78_Y3_N28
\counter_unit|h_count_reg[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[9]~DUPLICATE_q\);

-- Location: MLABCELL_X78_Y3_N30
\counter_unit|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add0~25_sumout\ = SUM(( \counter_unit|h_count_reg[10]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_h_count_reg[10]~DUPLICATE_q\,
	cin => \counter_unit|Add0~38\,
	sumout => \counter_unit|Add0~25_sumout\);

-- Location: FF_X78_Y3_N32
\counter_unit|h_count_reg[10]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~25_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[10]~DUPLICATE_q\);

-- Location: MLABCELL_X78_Y3_N36
\counter_unit|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Equal0~1_combout\ = ( !\counter_unit|h_count_reg[10]~DUPLICATE_q\ & ( (!\counter_unit|h_count_reg[6]~DUPLICATE_q\ & (\counter_unit|h_count_reg[9]~DUPLICATE_q\ & (\counter_unit|h_count_reg[8]~DUPLICATE_q\ & 
-- !\counter_unit|h_count_reg[7]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_h_count_reg[10]~DUPLICATE_q\,
	combout => \counter_unit|Equal0~1_combout\);

-- Location: MLABCELL_X78_Y3_N48
\counter_unit|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Equal0~0_combout\ = ( \counter_unit|h_count_reg[2]~DUPLICATE_q\ & ( \counter_unit|h_count_reg\(3) & ( (\counter_unit|h_count_reg[1]~DUPLICATE_q\ & (!\counter_unit|h_count_reg[5]~DUPLICATE_q\ & (\counter_unit|h_count_reg\(0) & 
-- \counter_unit|h_count_reg\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg[1]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_h_count_reg\(0),
	datad => \counter_unit|ALT_INV_h_count_reg\(4),
	datae => \counter_unit|ALT_INV_h_count_reg[2]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_h_count_reg\(3),
	combout => \counter_unit|Equal0~0_combout\);

-- Location: MLABCELL_X78_Y3_N39
\counter_unit|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Equal0~2_combout\ = ( \counter_unit|Equal0~0_combout\ & ( \counter_unit|Equal0~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_Equal0~1_combout\,
	dataf => \counter_unit|ALT_INV_Equal0~0_combout\,
	combout => \counter_unit|Equal0~2_combout\);

-- Location: FF_X78_Y3_N23
\counter_unit|h_count_reg[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[7]~DUPLICATE_q\);

-- Location: FF_X78_Y3_N22
\counter_unit|h_count_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(7));

-- Location: FF_X78_Y3_N19
\counter_unit|h_count_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(6));

-- Location: FF_X78_Y3_N13
\counter_unit|h_count_reg[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg[4]~DUPLICATE_q\);

-- Location: FF_X78_Y3_N29
\counter_unit|h_count_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(9));

-- Location: MLABCELL_X78_Y3_N57
\hsync_i~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \hsync_i~0_combout\ = ( !\counter_unit|h_count_reg[8]~DUPLICATE_q\ & ( (\counter_unit|h_count_reg\(9) & !\counter_unit|h_count_reg[10]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg\(9),
	datac => \counter_unit|ALT_INV_h_count_reg[10]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	combout => \hsync_i~0_combout\);

-- Location: FF_X78_Y3_N16
\counter_unit|h_count_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(5));

-- Location: LABCELL_X79_Y3_N15
\hsync_i~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \hsync_i~1_combout\ = ( \hsync_i~0_combout\ & ( \counter_unit|h_count_reg\(5) & ( (!\counter_unit|h_count_reg\(7)) # ((\counter_unit|h_count_reg\(6) & \counter_unit|h_count_reg[4]~DUPLICATE_q\)) ) ) ) # ( !\hsync_i~0_combout\ & ( 
-- \counter_unit|h_count_reg\(5) ) ) # ( \hsync_i~0_combout\ & ( !\counter_unit|h_count_reg\(5) & ( (!\counter_unit|h_count_reg\(7)) # ((!\counter_unit|h_count_reg\(6) & !\counter_unit|h_count_reg[4]~DUPLICATE_q\)) ) ) ) # ( !\hsync_i~0_combout\ & ( 
-- !\counter_unit|h_count_reg\(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110101010101011111111111111111010101010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg\(7),
	datac => \counter_unit|ALT_INV_h_count_reg\(6),
	datad => \counter_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\,
	datae => \ALT_INV_hsync_i~0_combout\,
	dataf => \counter_unit|ALT_INV_h_count_reg\(5),
	combout => \hsync_i~1_combout\);

-- Location: FF_X79_Y3_N16
\VGA_HS~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \hsync_i~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_HS~reg0_q\);

-- Location: LABCELL_X75_Y3_N0
\counter_unit|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~9_sumout\ = SUM(( \counter_unit|v_count_reg[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))
-- \counter_unit|Add1~10\ = CARRY(( \counter_unit|v_count_reg[0]~DUPLICATE_q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_v_count_reg[0]~DUPLICATE_q\,
	cin => GND,
	sumout => \counter_unit|Add1~9_sumout\,
	cout => \counter_unit|Add1~10\);

-- Location: LABCELL_X75_Y3_N24
\counter_unit|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~1_sumout\ = SUM(( \counter_unit|v_count_reg\(8) ) + ( GND ) + ( \counter_unit|Add1~30\ ))
-- \counter_unit|Add1~2\ = CARRY(( \counter_unit|v_count_reg\(8) ) + ( GND ) + ( \counter_unit|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_v_count_reg\(8),
	cin => \counter_unit|Add1~30\,
	sumout => \counter_unit|Add1~1_sumout\,
	cout => \counter_unit|Add1~2\);

-- Location: LABCELL_X75_Y3_N27
\counter_unit|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~33_sumout\ = SUM(( \counter_unit|v_count_reg\(9) ) + ( GND ) + ( \counter_unit|Add1~2\ ))
-- \counter_unit|Add1~34\ = CARRY(( \counter_unit|v_count_reg\(9) ) + ( GND ) + ( \counter_unit|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_v_count_reg\(9),
	cin => \counter_unit|Add1~2\,
	sumout => \counter_unit|Add1~33_sumout\,
	cout => \counter_unit|Add1~34\);

-- Location: LABCELL_X75_Y3_N45
\counter_unit|process_2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|process_2~0_combout\ = ( \counter_unit|Equal0~0_combout\ & ( (q_reg(0) & \counter_unit|Equal0~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_q_reg(0),
	datad => \counter_unit|ALT_INV_Equal0~1_combout\,
	dataf => \counter_unit|ALT_INV_Equal0~0_combout\,
	combout => \counter_unit|process_2~0_combout\);

-- Location: FF_X75_Y3_N29
\counter_unit|v_count_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(9));

-- Location: LABCELL_X75_Y3_N30
\counter_unit|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~5_sumout\ = SUM(( \counter_unit|v_count_reg\(10) ) + ( GND ) + ( \counter_unit|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_v_count_reg\(10),
	cin => \counter_unit|Add1~34\,
	sumout => \counter_unit|Add1~5_sumout\);

-- Location: FF_X75_Y3_N31
\counter_unit|v_count_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(10));

-- Location: LABCELL_X75_Y3_N42
\counter_unit|Equal1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Equal1~1_combout\ = ( \counter_unit|v_count_reg\(2) & ( (\counter_unit|v_count_reg[3]~DUPLICATE_q\ & \counter_unit|v_count_reg\(9)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_v_count_reg[3]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_v_count_reg\(9),
	dataf => \counter_unit|ALT_INV_v_count_reg\(2),
	combout => \counter_unit|Equal1~1_combout\);

-- Location: FF_X75_Y3_N13
\counter_unit|v_count_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(4));

-- Location: LABCELL_X75_Y3_N48
\counter_unit|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Equal1~0_combout\ = ( !\counter_unit|v_count_reg\(1) & ( !\counter_unit|v_count_reg[6]~DUPLICATE_q\ & ( (!\counter_unit|v_count_reg[7]~DUPLICATE_q\ & (!\counter_unit|v_count_reg\(5) & (!\counter_unit|v_count_reg[0]~DUPLICATE_q\ & 
-- !\counter_unit|v_count_reg\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_v_count_reg[7]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_v_count_reg\(5),
	datac => \counter_unit|ALT_INV_v_count_reg[0]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_v_count_reg\(4),
	datae => \counter_unit|ALT_INV_v_count_reg\(1),
	dataf => \counter_unit|ALT_INV_v_count_reg[6]~DUPLICATE_q\,
	combout => \counter_unit|Equal1~0_combout\);

-- Location: LABCELL_X75_Y3_N54
\counter_unit|Equal1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Equal1~2_combout\ = ( \counter_unit|Equal1~0_combout\ & ( (!\counter_unit|v_count_reg\(8) & (!\counter_unit|v_count_reg\(10) & \counter_unit|Equal1~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101000000000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_v_count_reg\(8),
	datac => \counter_unit|ALT_INV_v_count_reg\(10),
	datad => \counter_unit|ALT_INV_Equal1~1_combout\,
	dataf => \counter_unit|ALT_INV_Equal1~0_combout\,
	combout => \counter_unit|Equal1~2_combout\);

-- Location: FF_X75_Y3_N2
\counter_unit|v_count_reg[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg[0]~DUPLICATE_q\);

-- Location: LABCELL_X75_Y3_N3
\counter_unit|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~13_sumout\ = SUM(( \counter_unit|v_count_reg\(1) ) + ( GND ) + ( \counter_unit|Add1~10\ ))
-- \counter_unit|Add1~14\ = CARRY(( \counter_unit|v_count_reg\(1) ) + ( GND ) + ( \counter_unit|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_v_count_reg\(1),
	cin => \counter_unit|Add1~10\,
	sumout => \counter_unit|Add1~13_sumout\,
	cout => \counter_unit|Add1~14\);

-- Location: FF_X75_Y3_N5
\counter_unit|v_count_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~13_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(1));

-- Location: LABCELL_X75_Y3_N6
\counter_unit|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~37_sumout\ = SUM(( \counter_unit|v_count_reg\(2) ) + ( GND ) + ( \counter_unit|Add1~14\ ))
-- \counter_unit|Add1~38\ = CARRY(( \counter_unit|v_count_reg\(2) ) + ( GND ) + ( \counter_unit|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_v_count_reg\(2),
	cin => \counter_unit|Add1~14\,
	sumout => \counter_unit|Add1~37_sumout\,
	cout => \counter_unit|Add1~38\);

-- Location: FF_X75_Y3_N8
\counter_unit|v_count_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(2));

-- Location: LABCELL_X75_Y3_N9
\counter_unit|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~41_sumout\ = SUM(( \counter_unit|v_count_reg[3]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add1~38\ ))
-- \counter_unit|Add1~42\ = CARRY(( \counter_unit|v_count_reg[3]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_v_count_reg[3]~DUPLICATE_q\,
	cin => \counter_unit|Add1~38\,
	sumout => \counter_unit|Add1~41_sumout\,
	cout => \counter_unit|Add1~42\);

-- Location: FF_X75_Y3_N11
\counter_unit|v_count_reg[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~41_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg[3]~DUPLICATE_q\);

-- Location: LABCELL_X75_Y3_N12
\counter_unit|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~17_sumout\ = SUM(( \counter_unit|v_count_reg[4]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add1~42\ ))
-- \counter_unit|Add1~18\ = CARRY(( \counter_unit|v_count_reg[4]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_v_count_reg[4]~DUPLICATE_q\,
	cin => \counter_unit|Add1~42\,
	sumout => \counter_unit|Add1~17_sumout\,
	cout => \counter_unit|Add1~18\);

-- Location: FF_X75_Y3_N14
\counter_unit|v_count_reg[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~17_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg[4]~DUPLICATE_q\);

-- Location: LABCELL_X75_Y3_N15
\counter_unit|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~21_sumout\ = SUM(( \counter_unit|v_count_reg\(5) ) + ( GND ) + ( \counter_unit|Add1~18\ ))
-- \counter_unit|Add1~22\ = CARRY(( \counter_unit|v_count_reg\(5) ) + ( GND ) + ( \counter_unit|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_v_count_reg\(5),
	cin => \counter_unit|Add1~18\,
	sumout => \counter_unit|Add1~21_sumout\,
	cout => \counter_unit|Add1~22\);

-- Location: FF_X75_Y3_N17
\counter_unit|v_count_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~21_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(5));

-- Location: LABCELL_X75_Y3_N18
\counter_unit|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~25_sumout\ = SUM(( \counter_unit|v_count_reg[6]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add1~22\ ))
-- \counter_unit|Add1~26\ = CARRY(( \counter_unit|v_count_reg[6]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_v_count_reg[6]~DUPLICATE_q\,
	cin => \counter_unit|Add1~22\,
	sumout => \counter_unit|Add1~25_sumout\,
	cout => \counter_unit|Add1~26\);

-- Location: FF_X75_Y3_N20
\counter_unit|v_count_reg[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~25_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg[6]~DUPLICATE_q\);

-- Location: LABCELL_X75_Y3_N21
\counter_unit|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Add1~29_sumout\ = SUM(( \counter_unit|v_count_reg[7]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add1~26\ ))
-- \counter_unit|Add1~30\ = CARRY(( \counter_unit|v_count_reg[7]~DUPLICATE_q\ ) + ( GND ) + ( \counter_unit|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \counter_unit|ALT_INV_v_count_reg[7]~DUPLICATE_q\,
	cin => \counter_unit|Add1~26\,
	sumout => \counter_unit|Add1~29_sumout\,
	cout => \counter_unit|Add1~30\);

-- Location: FF_X75_Y3_N23
\counter_unit|v_count_reg[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg[7]~DUPLICATE_q\);

-- Location: FF_X75_Y3_N25
\counter_unit|v_count_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~1_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(8));

-- Location: LABCELL_X75_Y3_N57
\LessThan5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = ( \counter_unit|v_count_reg[6]~DUPLICATE_q\ & ( (\counter_unit|v_count_reg\(8) & (\counter_unit|v_count_reg\(5) & \counter_unit|v_count_reg[7]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_v_count_reg\(8),
	datac => \counter_unit|ALT_INV_v_count_reg\(5),
	datad => \counter_unit|ALT_INV_v_count_reg[7]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_v_count_reg[6]~DUPLICATE_q\,
	combout => \LessThan5~0_combout\);

-- Location: FF_X75_Y3_N28
\counter_unit|v_count_reg[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~33_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg[9]~DUPLICATE_q\);

-- Location: FF_X75_Y3_N7
\counter_unit|v_count_reg[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~37_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg[2]~DUPLICATE_q\);

-- Location: FF_X75_Y3_N10
\counter_unit|v_count_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~41_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(3));

-- Location: LABCELL_X75_Y3_N36
\vsync_i~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \vsync_i~0_combout\ = ( \counter_unit|v_count_reg\(3) & ( (!\counter_unit|v_count_reg[4]~DUPLICATE_q\ & (\counter_unit|v_count_reg\(1) & !\counter_unit|v_count_reg[2]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_v_count_reg[4]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_v_count_reg\(1),
	datad => \counter_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_v_count_reg\(3),
	combout => \vsync_i~0_combout\);

-- Location: LABCELL_X77_Y3_N51
\vsync_i~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \vsync_i~1_combout\ = ( \vsync_i~0_combout\ & ( (!\LessThan5~0_combout\) # ((\counter_unit|v_count_reg[9]~DUPLICATE_q\) # (\counter_unit|v_count_reg\(10))) ) ) # ( !\vsync_i~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111110101111111111111010111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan5~0_combout\,
	datac => \counter_unit|ALT_INV_v_count_reg\(10),
	datad => \counter_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\,
	dataf => \ALT_INV_vsync_i~0_combout\,
	combout => \vsync_i~1_combout\);

-- Location: FF_X77_Y3_N52
\VGA_VS~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \vsync_i~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_VS~reg0_q\);

-- Location: LABCELL_X77_Y3_N42
\counter_unit|frame_start~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|frame_start~1_combout\ = ( !\counter_unit|h_count_reg\(3) & ( !\counter_unit|v_count_reg\(3) & ( (!\counter_unit|v_count_reg[2]~DUPLICATE_q\ & (!\counter_unit|v_count_reg[9]~DUPLICATE_q\ & (!\counter_unit|h_count_reg[5]~DUPLICATE_q\ & 
-- !\counter_unit|h_count_reg\(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_v_count_reg[2]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_h_count_reg\(4),
	datae => \counter_unit|ALT_INV_h_count_reg\(3),
	dataf => \counter_unit|ALT_INV_v_count_reg\(3),
	combout => \counter_unit|frame_start~1_combout\);

-- Location: MLABCELL_X78_Y3_N42
\counter_unit|frame_start~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|frame_start~2_combout\ = ( !\counter_unit|h_count_reg[6]~DUPLICATE_q\ & ( (!\counter_unit|h_count_reg[8]~DUPLICATE_q\ & (!\counter_unit|h_count_reg[10]~DUPLICATE_q\ & (!\counter_unit|h_count_reg[7]~DUPLICATE_q\ & 
-- !\counter_unit|h_count_reg\(9)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_h_count_reg[10]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_h_count_reg\(9),
	dataf => \counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	combout => \counter_unit|frame_start~2_combout\);

-- Location: FF_X78_Y3_N8
\counter_unit|h_count_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(2));

-- Location: FF_X78_Y3_N4
\counter_unit|h_count_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~5_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(1));

-- Location: MLABCELL_X78_Y3_N45
\counter_unit|frame_start~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|frame_start~0_combout\ = ( !\counter_unit|h_count_reg\(1) & ( (!\counter_unit|h_count_reg\(2) & !\counter_unit|h_count_reg\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_h_count_reg\(2),
	datad => \counter_unit|ALT_INV_h_count_reg\(0),
	dataf => \counter_unit|ALT_INV_h_count_reg\(1),
	combout => \counter_unit|frame_start~0_combout\);

-- Location: LABCELL_X77_Y3_N24
\counter_unit|frame_start\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|frame_start~combout\ = ( !\counter_unit|v_count_reg\(10) & ( !\counter_unit|v_count_reg\(8) & ( (\counter_unit|frame_start~1_combout\ & (\counter_unit|frame_start~2_combout\ & (\counter_unit|frame_start~0_combout\ & 
-- \counter_unit|Equal1~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_frame_start~1_combout\,
	datab => \counter_unit|ALT_INV_frame_start~2_combout\,
	datac => \counter_unit|ALT_INV_frame_start~0_combout\,
	datad => \counter_unit|ALT_INV_Equal1~0_combout\,
	datae => \counter_unit|ALT_INV_v_count_reg\(10),
	dataf => \counter_unit|ALT_INV_v_count_reg\(8),
	combout => \counter_unit|frame_start~combout\);

-- Location: LABCELL_X79_Y3_N33
\counter_unit|frame_end\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|frame_end~combout\ = ( \counter_unit|Equal1~1_combout\ & ( !\counter_unit|v_count_reg\(8) & ( (\counter_unit|Equal1~0_combout\ & (!\counter_unit|v_count_reg\(10) & (\counter_unit|Equal0~0_combout\ & \counter_unit|Equal0~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_Equal1~0_combout\,
	datab => \counter_unit|ALT_INV_v_count_reg\(10),
	datac => \counter_unit|ALT_INV_Equal0~0_combout\,
	datad => \counter_unit|ALT_INV_Equal0~1_combout\,
	datae => \counter_unit|ALT_INV_Equal1~1_combout\,
	dataf => \counter_unit|ALT_INV_v_count_reg\(8),
	combout => \counter_unit|frame_end~combout\);

-- Location: FF_X78_Y3_N31
\counter_unit|h_count_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~25_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(10));

-- Location: FF_X78_Y3_N25
\counter_unit|h_count_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add0~41_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal0~2_combout\,
	ena => q_reg(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|h_count_reg\(8));

-- Location: LABCELL_X77_Y3_N36
\pixel_generate|rgb[8]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb[8]~1_combout\ = ( !\counter_unit|h_count_reg[9]~DUPLICATE_q\ & ( (!\counter_unit|h_count_reg\(10) & !\counter_unit|h_count_reg\(8)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_h_count_reg\(10),
	datad => \counter_unit|ALT_INV_h_count_reg\(8),
	dataf => \counter_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	combout => \pixel_generate|rgb[8]~1_combout\);

-- Location: LABCELL_X77_Y3_N12
\pixel_generate|rgb[8]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|rgb[8]~0_combout\ = ( \counter_unit|h_count_reg\(3) & ( \counter_unit|frame_start~0_combout\ & ( (!\counter_unit|h_count_reg[7]~DUPLICATE_q\ & (\counter_unit|h_count_reg\(4) & (\counter_unit|h_count_reg[5]~DUPLICATE_q\ & 
-- \counter_unit|h_count_reg[6]~DUPLICATE_q\))) # (\counter_unit|h_count_reg[7]~DUPLICATE_q\ & ((!\counter_unit|h_count_reg[6]~DUPLICATE_q\) # ((!\counter_unit|h_count_reg\(4) & !\counter_unit|h_count_reg[5]~DUPLICATE_q\)))) ) ) ) # ( 
-- !\counter_unit|h_count_reg\(3) & ( \counter_unit|frame_start~0_combout\ & ( (\counter_unit|h_count_reg[7]~DUPLICATE_q\ & ((!\counter_unit|h_count_reg[6]~DUPLICATE_q\) # ((!\counter_unit|h_count_reg\(4) & !\counter_unit|h_count_reg[5]~DUPLICATE_q\)))) ) ) 
-- ) # ( \counter_unit|h_count_reg\(3) & ( !\counter_unit|frame_start~0_combout\ & ( (!\counter_unit|h_count_reg[7]~DUPLICATE_q\ & (\counter_unit|h_count_reg\(4) & (\counter_unit|h_count_reg[5]~DUPLICATE_q\ & \counter_unit|h_count_reg[6]~DUPLICATE_q\))) # 
-- (\counter_unit|h_count_reg[7]~DUPLICATE_q\ & (((!\counter_unit|h_count_reg[6]~DUPLICATE_q\)))) ) ) ) # ( !\counter_unit|h_count_reg\(3) & ( !\counter_unit|frame_start~0_combout\ & ( (\counter_unit|h_count_reg[7]~DUPLICATE_q\ & 
-- ((!\counter_unit|h_count_reg[6]~DUPLICATE_q\) # ((!\counter_unit|h_count_reg\(4) & !\counter_unit|h_count_reg[5]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101000000010101010000001001010101010000000101010101000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_h_count_reg\(4),
	datac => \counter_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	datae => \counter_unit|ALT_INV_h_count_reg\(3),
	dataf => \counter_unit|ALT_INV_frame_start~0_combout\,
	combout => \pixel_generate|rgb[8]~0_combout\);

-- Location: FF_X75_Y3_N22
\counter_unit|v_count_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~29_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(7));

-- Location: LABCELL_X75_Y3_N39
\pixel_generate|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|LessThan0~0_combout\ = ( \counter_unit|v_count_reg\(5) & ( (\counter_unit|v_count_reg[6]~DUPLICATE_q\ & ((\counter_unit|v_count_reg[3]~DUPLICATE_q\) # (\counter_unit|v_count_reg[4]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010101000101010001010100010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_v_count_reg[6]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_v_count_reg[4]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_v_count_reg[3]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_v_count_reg\(5),
	combout => \pixel_generate|LessThan0~0_combout\);

-- Location: LABCELL_X77_Y3_N30
\pixel_generate|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|LessThan0~1_combout\ = ( \pixel_generate|LessThan0~0_combout\ & ( (!\counter_unit|v_count_reg[9]~DUPLICATE_q\ & (!\counter_unit|v_count_reg\(8) & !\counter_unit|v_count_reg\(10))) ) ) # ( !\pixel_generate|LessThan0~0_combout\ & ( 
-- (!\counter_unit|v_count_reg[9]~DUPLICATE_q\ & (!\counter_unit|v_count_reg\(10) & ((!\counter_unit|v_count_reg\(7)) # (!\counter_unit|v_count_reg\(8))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100000000000101010000000000010100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_v_count_reg[9]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_v_count_reg\(7),
	datac => \counter_unit|ALT_INV_v_count_reg\(8),
	datad => \counter_unit|ALT_INV_v_count_reg\(10),
	dataf => \pixel_generate|ALT_INV_LessThan0~0_combout\,
	combout => \pixel_generate|LessThan0~1_combout\);

-- Location: LABCELL_X77_Y3_N48
\video_on_i~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \video_on_i~0_combout\ = ( \counter_unit|h_count_reg[9]~DUPLICATE_q\ & ( (\counter_unit|h_count_reg[7]~DUPLICATE_q\) # (\counter_unit|h_count_reg[8]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_h_count_reg[9]~DUPLICATE_q\,
	combout => \video_on_i~0_combout\);

-- Location: LABCELL_X77_Y3_N39
\video_on_i~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \video_on_i~1_combout\ = ( !\LessThan5~0_combout\ & ( (!\video_on_i~0_combout\ & (!\counter_unit|v_count_reg\(10) & (!\counter_unit|v_count_reg\(9) & !\counter_unit|h_count_reg\(10)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_video_on_i~0_combout\,
	datab => \counter_unit|ALT_INV_v_count_reg\(10),
	datac => \counter_unit|ALT_INV_v_count_reg\(9),
	datad => \counter_unit|ALT_INV_h_count_reg\(10),
	dataf => \ALT_INV_LessThan5~0_combout\,
	combout => \video_on_i~1_combout\);

-- Location: LABCELL_X77_Y3_N9
\VGA_R~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_R~0_combout\ = ( \counter_unit|h_count_reg[8]~DUPLICATE_q\ & ( (!\counter_unit|h_count_reg[7]~DUPLICATE_q\ & (!\counter_unit|h_count_reg[6]~DUPLICATE_q\)) # (\counter_unit|h_count_reg[7]~DUPLICATE_q\ & (\counter_unit|h_count_reg[6]~DUPLICATE_q\ & 
-- \counter_unit|h_count_reg[5]~DUPLICATE_q\)) ) ) # ( !\counter_unit|h_count_reg[8]~DUPLICATE_q\ & ( (\counter_unit|h_count_reg[7]~DUPLICATE_q\ & ((\counter_unit|h_count_reg[5]~DUPLICATE_q\) # (\counter_unit|h_count_reg[6]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000101010101000100010101010110001000100110011000100010011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	combout => \VGA_R~0_combout\);

-- Location: LABCELL_X77_Y3_N54
\VGA_R~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_R~1_combout\ = ( \counter_unit|h_count_reg\(9) & ( \VGA_R~0_combout\ & ( (\pixel_generate|rgb[8]~1_combout\ & (\pixel_generate|rgb[8]~0_combout\ & (!\pixel_generate|LessThan0~1_combout\ & \video_on_i~1_combout\))) ) ) ) # ( 
-- !\counter_unit|h_count_reg\(9) & ( \VGA_R~0_combout\ & ( (\pixel_generate|rgb[8]~1_combout\ & (\pixel_generate|rgb[8]~0_combout\ & (!\pixel_generate|LessThan0~1_combout\ & \video_on_i~1_combout\))) ) ) ) # ( \counter_unit|h_count_reg\(9) & ( 
-- !\VGA_R~0_combout\ & ( (\pixel_generate|rgb[8]~1_combout\ & (\pixel_generate|rgb[8]~0_combout\ & (!\pixel_generate|LessThan0~1_combout\ & \video_on_i~1_combout\))) ) ) ) # ( !\counter_unit|h_count_reg\(9) & ( !\VGA_R~0_combout\ & ( (\video_on_i~1_combout\ 
-- & (((\pixel_generate|rgb[8]~1_combout\ & \pixel_generate|rgb[8]~0_combout\)) # (\pixel_generate|LessThan0~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000011111000000000001000000000000000100000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \pixel_generate|ALT_INV_rgb[8]~1_combout\,
	datab => \pixel_generate|ALT_INV_rgb[8]~0_combout\,
	datac => \pixel_generate|ALT_INV_LessThan0~1_combout\,
	datad => \ALT_INV_video_on_i~1_combout\,
	datae => \counter_unit|ALT_INV_h_count_reg\(9),
	dataf => \ALT_INV_VGA_R~0_combout\,
	combout => \VGA_R~1_combout\);

-- Location: FF_X77_Y3_N23
\VGA_R[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_R~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_R[0]~reg0_q\);

-- Location: FF_X77_Y3_N16
\VGA_R[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_R~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_R[1]~reg0_q\);

-- Location: FF_X77_Y3_N22
\VGA_R[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_R~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_R[2]~reg0_q\);

-- Location: FF_X77_Y3_N55
\VGA_R[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \VGA_R~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_R[3]~reg0_q\);

-- Location: LABCELL_X77_Y3_N33
\pixel_generate|LessThan4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pixel_generate|LessThan4~0_combout\ = ( \counter_unit|h_count_reg[6]~DUPLICATE_q\ & ( \counter_unit|h_count_reg[8]~DUPLICATE_q\ ) ) # ( !\counter_unit|h_count_reg[6]~DUPLICATE_q\ & ( (\counter_unit|h_count_reg[8]~DUPLICATE_q\ & 
-- \counter_unit|h_count_reg[7]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	dataf => \counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	combout => \pixel_generate|LessThan4~0_combout\);

-- Location: LABCELL_X77_Y3_N57
\VGA_G~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_G~0_combout\ = ( \counter_unit|h_count_reg\(9) & ( \pixel_generate|LessThan4~0_combout\ & ( (\pixel_generate|rgb[8]~1_combout\ & (\pixel_generate|rgb[8]~0_combout\ & (\video_on_i~1_combout\ & !\pixel_generate|LessThan0~1_combout\))) ) ) ) # ( 
-- !\counter_unit|h_count_reg\(9) & ( \pixel_generate|LessThan4~0_combout\ & ( (\pixel_generate|rgb[8]~1_combout\ & (\pixel_generate|rgb[8]~0_combout\ & (\video_on_i~1_combout\ & !\pixel_generate|LessThan0~1_combout\))) ) ) ) # ( 
-- \counter_unit|h_count_reg\(9) & ( !\pixel_generate|LessThan4~0_combout\ & ( (\pixel_generate|rgb[8]~1_combout\ & (\pixel_generate|rgb[8]~0_combout\ & (\video_on_i~1_combout\ & !\pixel_generate|LessThan0~1_combout\))) ) ) ) # ( 
-- !\counter_unit|h_count_reg\(9) & ( !\pixel_generate|LessThan4~0_combout\ & ( (\video_on_i~1_combout\ & (((\pixel_generate|rgb[8]~1_combout\ & \pixel_generate|rgb[8]~0_combout\)) # (\pixel_generate|LessThan0~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100001111000000010000000000000001000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \pixel_generate|ALT_INV_rgb[8]~1_combout\,
	datab => \pixel_generate|ALT_INV_rgb[8]~0_combout\,
	datac => \ALT_INV_video_on_i~1_combout\,
	datad => \pixel_generate|ALT_INV_LessThan0~1_combout\,
	datae => \counter_unit|ALT_INV_h_count_reg\(9),
	dataf => \pixel_generate|ALT_INV_LessThan4~0_combout\,
	combout => \VGA_G~0_combout\);

-- Location: FF_X77_Y3_N28
\VGA_G[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_G~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_G[0]~reg0_q\);

-- Location: FF_X77_Y3_N46
\VGA_G[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_G~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_G[1]~reg0_q\);

-- Location: FF_X77_Y3_N49
\VGA_G[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_G~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_G[2]~reg0_q\);

-- Location: FF_X77_Y3_N58
\VGA_G[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \VGA_G~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_G[3]~reg0_q\);

-- Location: LABCELL_X77_Y3_N6
\counter_unit|Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_unit|Equal0~3_combout\ = ( !\counter_unit|h_count_reg\(10) & ( (!\counter_unit|h_count_reg[6]~DUPLICATE_q\ & (!\counter_unit|h_count_reg[7]~DUPLICATE_q\ & \counter_unit|h_count_reg\(9))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_unit|ALT_INV_h_count_reg[6]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_h_count_reg[7]~DUPLICATE_q\,
	datad => \counter_unit|ALT_INV_h_count_reg\(9),
	dataf => \counter_unit|ALT_INV_h_count_reg\(10),
	combout => \counter_unit|Equal0~3_combout\);

-- Location: LABCELL_X77_Y3_N18
\VGA_B~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_B~0_combout\ = ( \counter_unit|Equal0~3_combout\ & ( (!\counter_unit|h_count_reg[8]~DUPLICATE_q\ & ((!\counter_unit|h_count_reg[5]~DUPLICATE_q\) # (!\counter_unit|h_count_reg\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001000110010001100100011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg[5]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_h_count_reg[8]~DUPLICATE_q\,
	datac => \counter_unit|ALT_INV_h_count_reg\(4),
	dataf => \counter_unit|ALT_INV_Equal0~3_combout\,
	combout => \VGA_B~0_combout\);

-- Location: LABCELL_X79_Y3_N24
\VGA_B~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_B~2_combout\ = ( \counter_unit|h_count_reg\(7) & ( \counter_unit|h_count_reg\(6) & ( (!\counter_unit|h_count_reg\(8) & ((!\counter_unit|h_count_reg[4]~DUPLICATE_q\) # ((!\counter_unit|h_count_reg\(5))))) # (\counter_unit|h_count_reg\(8) & 
-- (((!\counter_unit|h_count_reg\(10) & \counter_unit|h_count_reg\(5))))) ) ) ) # ( !\counter_unit|h_count_reg\(7) & ( \counter_unit|h_count_reg\(6) & ( (!\counter_unit|h_count_reg\(8) & (!\counter_unit|h_count_reg[4]~DUPLICATE_q\ & 
-- ((!\counter_unit|h_count_reg\(5))))) # (\counter_unit|h_count_reg\(8) & (((!\counter_unit|h_count_reg\(10))))) ) ) ) # ( \counter_unit|h_count_reg\(7) & ( !\counter_unit|h_count_reg\(6) & ( (!\counter_unit|h_count_reg\(8) & 
-- (((\counter_unit|h_count_reg\(5))))) # (\counter_unit|h_count_reg\(8) & (!\counter_unit|h_count_reg[4]~DUPLICATE_q\ & (!\counter_unit|h_count_reg\(10) & !\counter_unit|h_count_reg\(5)))) ) ) ) # ( !\counter_unit|h_count_reg\(7) & ( 
-- !\counter_unit|h_count_reg\(6) & ( !\counter_unit|h_count_reg\(8) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011001100001000001100110010111000001100001100110010111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg[4]~DUPLICATE_q\,
	datab => \counter_unit|ALT_INV_h_count_reg\(8),
	datac => \counter_unit|ALT_INV_h_count_reg\(10),
	datad => \counter_unit|ALT_INV_h_count_reg\(5),
	datae => \counter_unit|ALT_INV_h_count_reg\(7),
	dataf => \counter_unit|ALT_INV_h_count_reg\(6),
	combout => \VGA_B~2_combout\);

-- Location: MLABCELL_X78_Y3_N54
\VGA_B~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_B~3_combout\ = ( \VGA_B~2_combout\ & ( !\counter_unit|h_count_reg\(9) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_unit|ALT_INV_h_count_reg\(9),
	dataf => \ALT_INV_VGA_B~2_combout\,
	combout => \VGA_B~3_combout\);

-- Location: LABCELL_X77_Y3_N0
\VGA_B~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \VGA_B~1_combout\ = ( \VGA_B~3_combout\ & ( \video_on_i~1_combout\ & ( ((\pixel_generate|rgb[8]~1_combout\ & \pixel_generate|rgb[8]~0_combout\)) # (\pixel_generate|LessThan0~1_combout\) ) ) ) # ( !\VGA_B~3_combout\ & ( \video_on_i~1_combout\ & ( 
-- (!\pixel_generate|LessThan0~1_combout\ & (\pixel_generate|rgb[8]~1_combout\ & ((\pixel_generate|rgb[8]~0_combout\)))) # (\pixel_generate|LessThan0~1_combout\ & (((\VGA_B~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000011010001110011001101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \pixel_generate|ALT_INV_rgb[8]~1_combout\,
	datab => \pixel_generate|ALT_INV_LessThan0~1_combout\,
	datac => \ALT_INV_VGA_B~0_combout\,
	datad => \pixel_generate|ALT_INV_rgb[8]~0_combout\,
	datae => \ALT_INV_VGA_B~3_combout\,
	dataf => \ALT_INV_video_on_i~1_combout\,
	combout => \VGA_B~1_combout\);

-- Location: FF_X77_Y3_N5
\VGA_B[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_B~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_B[0]~reg0_q\);

-- Location: FF_X77_Y3_N4
\VGA_B[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_B~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_B[1]~reg0_q\);

-- Location: FF_X77_Y3_N19
\VGA_B[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	asdata => \VGA_B~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_B[2]~reg0_q\);

-- Location: FF_X77_Y3_N1
\VGA_B[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \VGA_B~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \VGA_B[3]~reg0_q\);

-- Location: FF_X75_Y3_N1
\counter_unit|v_count_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~9_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(0));

-- Location: FF_X75_Y3_N19
\counter_unit|v_count_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputCLKENA0_outclk\,
	d => \counter_unit|Add1~25_sumout\,
	clrn => \KEY[0]~input_o\,
	sclr => \counter_unit|Equal1~2_combout\,
	ena => \counter_unit|process_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_unit|v_count_reg\(6));

-- Location: IOIBUF_X38_Y0_N18
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: IOIBUF_X50_Y81_N92
\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X80_Y81_N18
\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: LABCELL_X51_Y42_N3
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


