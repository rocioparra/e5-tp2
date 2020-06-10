-- Copyright (C) 2019  Intel Corporation. All rights reserved.
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
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "05/26/2020 19:31:38"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	PC_Mem_tb IS
    PORT (
	out_counter : OUT std_logic_vector(10 DOWNTO 0);
	PRELOAD : IN std_logic;
	CLK_MTB : IN std_logic;
	ADDR : IN std_logic_vector(10 DOWNTO 0);
	OUT_MTB : OUT std_logic_vector(13 DOWNTO 0)
	);
END PC_Mem_tb;

ARCHITECTURE structure OF PC_Mem_tb IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_out_counter : std_logic_vector(10 DOWNTO 0);
SIGNAL ww_PRELOAD : std_logic;
SIGNAL ww_CLK_MTB : std_logic;
SIGNAL ww_ADDR : std_logic_vector(10 DOWNTO 0);
SIGNAL ww_OUT_MTB : std_logic_vector(13 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \out_counter[10]~output_o\ : std_logic;
SIGNAL \out_counter[9]~output_o\ : std_logic;
SIGNAL \out_counter[8]~output_o\ : std_logic;
SIGNAL \out_counter[7]~output_o\ : std_logic;
SIGNAL \out_counter[6]~output_o\ : std_logic;
SIGNAL \out_counter[5]~output_o\ : std_logic;
SIGNAL \out_counter[4]~output_o\ : std_logic;
SIGNAL \out_counter[3]~output_o\ : std_logic;
SIGNAL \out_counter[2]~output_o\ : std_logic;
SIGNAL \out_counter[1]~output_o\ : std_logic;
SIGNAL \out_counter[0]~output_o\ : std_logic;
SIGNAL \OUT_MTB[13]~output_o\ : std_logic;
SIGNAL \OUT_MTB[12]~output_o\ : std_logic;
SIGNAL \OUT_MTB[11]~output_o\ : std_logic;
SIGNAL \OUT_MTB[10]~output_o\ : std_logic;
SIGNAL \OUT_MTB[9]~output_o\ : std_logic;
SIGNAL \OUT_MTB[8]~output_o\ : std_logic;
SIGNAL \OUT_MTB[7]~output_o\ : std_logic;
SIGNAL \OUT_MTB[6]~output_o\ : std_logic;
SIGNAL \OUT_MTB[5]~output_o\ : std_logic;
SIGNAL \OUT_MTB[4]~output_o\ : std_logic;
SIGNAL \OUT_MTB[3]~output_o\ : std_logic;
SIGNAL \OUT_MTB[2]~output_o\ : std_logic;
SIGNAL \OUT_MTB[1]~output_o\ : std_logic;
SIGNAL \OUT_MTB[0]~output_o\ : std_logic;
SIGNAL \CLK_MTB~input_o\ : std_logic;
SIGNAL \PRELOAD~input_o\ : std_logic;
SIGNAL \inst1|inst|sub|78~combout\ : std_logic;
SIGNAL \ADDR[0]~input_o\ : std_logic;
SIGNAL \inst1|inst2|sub|107~combout\ : std_logic;
SIGNAL \inst1|inst2|sub|110~q\ : std_logic;
SIGNAL \inst1|inst2|sub|104~combout\ : std_logic;
SIGNAL \inst1|inst|sub|9~q\ : std_logic;
SIGNAL \inst1|inst|sub|90~combout\ : std_logic;
SIGNAL \ADDR[1]~input_o\ : std_logic;
SIGNAL \inst1|inst|sub|87~q\ : std_logic;
SIGNAL \inst1|inst|sub|97~combout\ : std_logic;
SIGNAL \ADDR[2]~input_o\ : std_logic;
SIGNAL \inst1|inst|sub|99~q\ : std_logic;
SIGNAL \inst1|inst|sub|106~0_combout\ : std_logic;
SIGNAL \inst1|inst|sub|107~combout\ : std_logic;
SIGNAL \ADDR[3]~input_o\ : std_logic;
SIGNAL \inst1|inst|sub|110~q\ : std_logic;
SIGNAL \inst1|inst1|sub|78~combout\ : std_logic;
SIGNAL \ADDR[4]~input_o\ : std_logic;
SIGNAL \inst1|inst1|sub|9~q\ : std_logic;
SIGNAL \inst1|inst1|sub|90~combout\ : std_logic;
SIGNAL \ADDR[5]~input_o\ : std_logic;
SIGNAL \inst1|inst1|sub|87~q\ : std_logic;
SIGNAL \inst1|inst11|4~0_combout\ : std_logic;
SIGNAL \inst1|inst1|sub|97~combout\ : std_logic;
SIGNAL \ADDR[6]~input_o\ : std_logic;
SIGNAL \inst1|inst1|sub|99~q\ : std_logic;
SIGNAL \inst1|inst1|sub|107~combout\ : std_logic;
SIGNAL \ADDR[7]~input_o\ : std_logic;
SIGNAL \inst1|inst1|sub|110~q\ : std_logic;
SIGNAL \inst1|inst2|sub|78~combout\ : std_logic;
SIGNAL \ADDR[8]~input_o\ : std_logic;
SIGNAL \inst1|inst2|sub|9~q\ : std_logic;
SIGNAL \inst1|inst2|sub|89~0_combout\ : std_logic;
SIGNAL \inst1|inst2|sub|89~1_combout\ : std_logic;
SIGNAL \inst1|inst2|sub|90~combout\ : std_logic;
SIGNAL \ADDR[9]~input_o\ : std_logic;
SIGNAL \inst1|inst2|sub|87~q\ : std_logic;
SIGNAL \inst1|inst2|sub|97~combout\ : std_logic;
SIGNAL \ADDR[10]~input_o\ : std_logic;
SIGNAL \inst1|inst2|sub|99~q\ : std_logic;
SIGNAL \inst|altsyncram_component|auto_generated|q_a\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \inst1|inst2|sub|ALT_INV_104~combout\ : std_logic;

BEGIN

out_counter <= ww_out_counter;
ww_PRELOAD <= PRELOAD;
ww_CLK_MTB <= CLK_MTB;
ww_ADDR <= ADDR;
OUT_MTB <= ww_OUT_MTB;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(13) <= \inst|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(12) <= \inst|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(11) <= \inst|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(10) <= \inst|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(9) <= \inst|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(8) <= \inst|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(7) <= \inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(6) <= \inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(5) <= \inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(4) <= \inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(3) <= \inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(2) <= \inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(1) <= \inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst1|inst2|sub|99~q\ & \inst1|inst2|sub|87~q\ & \inst1|inst2|sub|9~q\ & \inst1|inst1|sub|110~q\ & \inst1|inst1|sub|99~q\ & \inst1|inst1|sub|87~q\ & \inst1|inst1|sub|9~q\ & 
\inst1|inst|sub|110~q\ & \inst1|inst|sub|99~q\ & \inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\);

\inst|altsyncram_component|auto_generated|q_a\(0) <= \inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\inst1|inst2|sub|ALT_INV_104~combout\ <= NOT \inst1|inst2|sub|104~combout\;

\out_counter[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst2|sub|99~q\,
	devoe => ww_devoe,
	o => \out_counter[10]~output_o\);

\out_counter[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst2|sub|87~q\,
	devoe => ww_devoe,
	o => \out_counter[9]~output_o\);

\out_counter[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst2|sub|9~q\,
	devoe => ww_devoe,
	o => \out_counter[8]~output_o\);

\out_counter[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|sub|110~q\,
	devoe => ww_devoe,
	o => \out_counter[7]~output_o\);

\out_counter[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|sub|99~q\,
	devoe => ww_devoe,
	o => \out_counter[6]~output_o\);

\out_counter[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|sub|87~q\,
	devoe => ww_devoe,
	o => \out_counter[5]~output_o\);

\out_counter[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst1|sub|9~q\,
	devoe => ww_devoe,
	o => \out_counter[4]~output_o\);

\out_counter[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|sub|110~q\,
	devoe => ww_devoe,
	o => \out_counter[3]~output_o\);

\out_counter[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|sub|99~q\,
	devoe => ww_devoe,
	o => \out_counter[2]~output_o\);

\out_counter[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|sub|87~q\,
	devoe => ww_devoe,
	o => \out_counter[1]~output_o\);

\out_counter[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|inst|sub|9~q\,
	devoe => ww_devoe,
	o => \out_counter[0]~output_o\);

\OUT_MTB[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(13),
	devoe => ww_devoe,
	o => \OUT_MTB[13]~output_o\);

\OUT_MTB[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(12),
	devoe => ww_devoe,
	o => \OUT_MTB[12]~output_o\);

\OUT_MTB[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(11),
	devoe => ww_devoe,
	o => \OUT_MTB[11]~output_o\);

\OUT_MTB[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(10),
	devoe => ww_devoe,
	o => \OUT_MTB[10]~output_o\);

\OUT_MTB[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(9),
	devoe => ww_devoe,
	o => \OUT_MTB[9]~output_o\);

\OUT_MTB[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(8),
	devoe => ww_devoe,
	o => \OUT_MTB[8]~output_o\);

\OUT_MTB[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(7),
	devoe => ww_devoe,
	o => \OUT_MTB[7]~output_o\);

\OUT_MTB[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(6),
	devoe => ww_devoe,
	o => \OUT_MTB[6]~output_o\);

\OUT_MTB[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(5),
	devoe => ww_devoe,
	o => \OUT_MTB[5]~output_o\);

\OUT_MTB[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(4),
	devoe => ww_devoe,
	o => \OUT_MTB[4]~output_o\);

\OUT_MTB[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(3),
	devoe => ww_devoe,
	o => \OUT_MTB[3]~output_o\);

\OUT_MTB[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(2),
	devoe => ww_devoe,
	o => \OUT_MTB[2]~output_o\);

\OUT_MTB[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(1),
	devoe => ww_devoe,
	o => \OUT_MTB[1]~output_o\);

\OUT_MTB[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|altsyncram_component|auto_generated|q_a\(0),
	devoe => ww_devoe,
	o => \OUT_MTB[0]~output_o\);

\CLK_MTB~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK_MTB,
	o => \CLK_MTB~input_o\);

\PRELOAD~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PRELOAD,
	o => \PRELOAD~input_o\);

\inst1|inst|sub|78\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst|sub|78~combout\ = \inst1|inst|sub|9~q\ $ (!\PRELOAD~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst|sub|9~q\,
	datad => \PRELOAD~input_o\,
	combout => \inst1|inst|sub|78~combout\);

\ADDR[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(0),
	o => \ADDR[0]~input_o\);

\inst1|inst2|sub|107\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst2|sub|107~combout\ = \inst1|inst2|sub|110~q\ $ (((\inst1|inst2|sub|99~q\ & (\inst1|inst2|sub|87~q\ & \inst1|inst2|sub|89~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst2|sub|110~q\,
	datab => \inst1|inst2|sub|99~q\,
	datac => \inst1|inst2|sub|87~q\,
	datad => \inst1|inst2|sub|89~1_combout\,
	combout => \inst1|inst2|sub|107~combout\);

\inst1|inst2|sub|110\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst2|sub|107~combout\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sclr => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst2|sub|110~q\);

\inst1|inst2|sub|104\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst2|sub|104~combout\ = (\inst1|inst2|sub|99~q\ & (\inst1|inst2|sub|87~q\ & (\inst1|inst2|sub|89~1_combout\ & \inst1|inst2|sub|110~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst2|sub|99~q\,
	datab => \inst1|inst2|sub|87~q\,
	datac => \inst1|inst2|sub|89~1_combout\,
	datad => \inst1|inst2|sub|110~q\,
	combout => \inst1|inst2|sub|104~combout\);

\inst1|inst|sub|9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst|sub|78~combout\,
	asdata => \ADDR[0]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|sub|9~q\);

\inst1|inst|sub|90\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst|sub|90~combout\ = \inst1|inst|sub|87~q\ $ (((!\PRELOAD~input_o\ & \inst1|inst|sub|9~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|sub|87~q\,
	datab => \PRELOAD~input_o\,
	datad => \inst1|inst|sub|9~q\,
	combout => \inst1|inst|sub|90~combout\);

\ADDR[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(1),
	o => \ADDR[1]~input_o\);

\inst1|inst|sub|87\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst|sub|90~combout\,
	asdata => \ADDR[1]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|sub|87~q\);

\inst1|inst|sub|97\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst|sub|97~combout\ = \inst1|inst|sub|99~q\ $ (((!\PRELOAD~input_o\ & (\inst1|inst|sub|87~q\ & \inst1|inst|sub|9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|sub|99~q\,
	datab => \PRELOAD~input_o\,
	datac => \inst1|inst|sub|87~q\,
	datad => \inst1|inst|sub|9~q\,
	combout => \inst1|inst|sub|97~combout\);

\ADDR[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(2),
	o => \ADDR[2]~input_o\);

\inst1|inst|sub|99\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst|sub|97~combout\,
	asdata => \ADDR[2]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|sub|99~q\);

\inst1|inst|sub|106~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst|sub|106~0_combout\ = (\inst1|inst|sub|99~q\ & (\inst1|inst|sub|87~q\ & (\inst1|inst|sub|9~q\ & !\PRELOAD~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst|sub|99~q\,
	datab => \inst1|inst|sub|87~q\,
	datac => \inst1|inst|sub|9~q\,
	datad => \PRELOAD~input_o\,
	combout => \inst1|inst|sub|106~0_combout\);

\inst1|inst|sub|107\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst|sub|107~combout\ = \inst1|inst|sub|110~q\ $ (\inst1|inst|sub|106~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst|sub|110~q\,
	datad => \inst1|inst|sub|106~0_combout\,
	combout => \inst1|inst|sub|107~combout\);

\ADDR[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(3),
	o => \ADDR[3]~input_o\);

\inst1|inst|sub|110\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst|sub|107~combout\,
	asdata => \ADDR[3]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst|sub|110~q\);

\inst1|inst1|sub|78\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst1|sub|78~combout\ = \inst1|inst1|sub|9~q\ $ (((\inst1|inst|sub|110~q\ & \inst1|inst|sub|106~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|inst1|sub|9~q\,
	datac => \inst1|inst|sub|110~q\,
	datad => \inst1|inst|sub|106~0_combout\,
	combout => \inst1|inst1|sub|78~combout\);

\ADDR[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(4),
	o => \ADDR[4]~input_o\);

\inst1|inst1|sub|9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst1|sub|78~combout\,
	asdata => \ADDR[4]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|sub|9~q\);

\inst1|inst1|sub|90\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst1|sub|90~combout\ = \inst1|inst1|sub|87~q\ $ (((\inst1|inst1|sub|9~q\ & (\inst1|inst|sub|110~q\ & \inst1|inst|sub|106~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|sub|87~q\,
	datab => \inst1|inst1|sub|9~q\,
	datac => \inst1|inst|sub|110~q\,
	datad => \inst1|inst|sub|106~0_combout\,
	combout => \inst1|inst1|sub|90~combout\);

\ADDR[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(5),
	o => \ADDR[5]~input_o\);

\inst1|inst1|sub|87\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst1|sub|90~combout\,
	asdata => \ADDR[5]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|sub|87~q\);

\inst1|inst11|4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst11|4~0_combout\ = (\inst1|inst1|sub|87~q\ & (\inst1|inst1|sub|9~q\ & (\inst1|inst|sub|110~q\ & \inst1|inst|sub|106~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|sub|87~q\,
	datab => \inst1|inst1|sub|9~q\,
	datac => \inst1|inst|sub|110~q\,
	datad => \inst1|inst|sub|106~0_combout\,
	combout => \inst1|inst11|4~0_combout\);

\inst1|inst1|sub|97\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst1|sub|97~combout\ = \inst1|inst1|sub|99~q\ $ (\inst1|inst11|4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst1|sub|99~q\,
	datad => \inst1|inst11|4~0_combout\,
	combout => \inst1|inst1|sub|97~combout\);

\ADDR[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(6),
	o => \ADDR[6]~input_o\);

\inst1|inst1|sub|99\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst1|sub|97~combout\,
	asdata => \ADDR[6]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|sub|99~q\);

\inst1|inst1|sub|107\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst1|sub|107~combout\ = \inst1|inst1|sub|110~q\ $ (((\inst1|inst1|sub|99~q\ & \inst1|inst11|4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|inst1|sub|110~q\,
	datac => \inst1|inst1|sub|99~q\,
	datad => \inst1|inst11|4~0_combout\,
	combout => \inst1|inst1|sub|107~combout\);

\ADDR[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(7),
	o => \ADDR[7]~input_o\);

\inst1|inst1|sub|110\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst1|sub|107~combout\,
	asdata => \ADDR[7]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst1|sub|110~q\);

\inst1|inst2|sub|78\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst2|sub|78~combout\ = \inst1|inst2|sub|9~q\ $ (((\inst1|inst1|sub|110~q\ & (\inst1|inst1|sub|99~q\ & \inst1|inst11|4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst2|sub|9~q\,
	datab => \inst1|inst1|sub|110~q\,
	datac => \inst1|inst1|sub|99~q\,
	datad => \inst1|inst11|4~0_combout\,
	combout => \inst1|inst2|sub|78~combout\);

\ADDR[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(8),
	o => \ADDR[8]~input_o\);

\inst1|inst2|sub|9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst2|sub|78~combout\,
	asdata => \ADDR[8]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst2|sub|9~q\);

\inst1|inst2|sub|89~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst2|sub|89~0_combout\ = (\inst1|inst1|sub|99~q\ & (\inst1|inst1|sub|87~q\ & (\inst1|inst1|sub|9~q\ & \inst1|inst|sub|110~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst1|sub|99~q\,
	datab => \inst1|inst1|sub|87~q\,
	datac => \inst1|inst1|sub|9~q\,
	datad => \inst1|inst|sub|110~q\,
	combout => \inst1|inst2|sub|89~0_combout\);

\inst1|inst2|sub|89~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst2|sub|89~1_combout\ = (\inst1|inst2|sub|9~q\ & (\inst1|inst1|sub|110~q\ & (\inst1|inst|sub|106~0_combout\ & \inst1|inst2|sub|89~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|inst2|sub|9~q\,
	datab => \inst1|inst1|sub|110~q\,
	datac => \inst1|inst|sub|106~0_combout\,
	datad => \inst1|inst2|sub|89~0_combout\,
	combout => \inst1|inst2|sub|89~1_combout\);

\inst1|inst2|sub|90\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst2|sub|90~combout\ = \inst1|inst2|sub|87~q\ $ (\inst1|inst2|sub|89~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|inst2|sub|87~q\,
	datad => \inst1|inst2|sub|89~1_combout\,
	combout => \inst1|inst2|sub|90~combout\);

\ADDR[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(9),
	o => \ADDR[9]~input_o\);

\inst1|inst2|sub|87\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst2|sub|90~combout\,
	asdata => \ADDR[9]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst2|sub|87~q\);

\inst1|inst2|sub|97\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|inst2|sub|97~combout\ = \inst1|inst2|sub|99~q\ $ (((\inst1|inst2|sub|87~q\ & \inst1|inst2|sub|89~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|inst2|sub|99~q\,
	datac => \inst1|inst2|sub|87~q\,
	datad => \inst1|inst2|sub|89~1_combout\,
	combout => \inst1|inst2|sub|97~combout\);

\ADDR[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDR(10),
	o => \ADDR[10]~input_o\);

\inst1|inst2|sub|99\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK_MTB~input_o\,
	d => \inst1|inst2|sub|97~combout\,
	asdata => \ADDR[10]~input_o\,
	clrn => \inst1|inst2|sub|ALT_INV_104~combout\,
	sload => \PRELOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|inst2|sub|99~q\);

\inst|altsyncram_component|auto_generated|ram_block1a13\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a12\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a11\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a10\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a9\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a8\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a7\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a6\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a5\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a3\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F0F0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a1\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000CCCC",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

\inst|altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000AAAA",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "Program.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Program:inst|altsyncram:altsyncram_component|altsyncram_85s3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 14,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLK_MTB~input_o\,
	portaaddr => \inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

ww_out_counter(10) <= \out_counter[10]~output_o\;

ww_out_counter(9) <= \out_counter[9]~output_o\;

ww_out_counter(8) <= \out_counter[8]~output_o\;

ww_out_counter(7) <= \out_counter[7]~output_o\;

ww_out_counter(6) <= \out_counter[6]~output_o\;

ww_out_counter(5) <= \out_counter[5]~output_o\;

ww_out_counter(4) <= \out_counter[4]~output_o\;

ww_out_counter(3) <= \out_counter[3]~output_o\;

ww_out_counter(2) <= \out_counter[2]~output_o\;

ww_out_counter(1) <= \out_counter[1]~output_o\;

ww_out_counter(0) <= \out_counter[0]~output_o\;

ww_OUT_MTB(13) <= \OUT_MTB[13]~output_o\;

ww_OUT_MTB(12) <= \OUT_MTB[12]~output_o\;

ww_OUT_MTB(11) <= \OUT_MTB[11]~output_o\;

ww_OUT_MTB(10) <= \OUT_MTB[10]~output_o\;

ww_OUT_MTB(9) <= \OUT_MTB[9]~output_o\;

ww_OUT_MTB(8) <= \OUT_MTB[8]~output_o\;

ww_OUT_MTB(7) <= \OUT_MTB[7]~output_o\;

ww_OUT_MTB(6) <= \OUT_MTB[6]~output_o\;

ww_OUT_MTB(5) <= \OUT_MTB[5]~output_o\;

ww_OUT_MTB(4) <= \OUT_MTB[4]~output_o\;

ww_OUT_MTB(3) <= \OUT_MTB[3]~output_o\;

ww_OUT_MTB(2) <= \OUT_MTB[2]~output_o\;

ww_OUT_MTB(1) <= \OUT_MTB[1]~output_o\;

ww_OUT_MTB(0) <= \OUT_MTB[0]~output_o\;
END structure;


