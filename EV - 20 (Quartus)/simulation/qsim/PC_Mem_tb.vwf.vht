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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/26/2020 19:31:37"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          PC_Mem_tb
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY PC_Mem_tb_vhd_vec_tst IS
END PC_Mem_tb_vhd_vec_tst;
ARCHITECTURE PC_Mem_tb_arch OF PC_Mem_tb_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ADDR : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL CLK_MTB : STD_LOGIC;
SIGNAL out_counter : STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL OUT_MTB : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL PRELOAD : STD_LOGIC;
COMPONENT PC_Mem_tb
	PORT (
	ADDR : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	CLK_MTB : IN STD_LOGIC;
	out_counter : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
	OUT_MTB : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
	PRELOAD : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : PC_Mem_tb
	PORT MAP (
-- list connections between master ports and signals
	ADDR => ADDR,
	CLK_MTB => CLK_MTB,
	out_counter => out_counter,
	OUT_MTB => OUT_MTB,
	PRELOAD => PRELOAD
	);

-- CLK_MTB
t_prcs_CLK_MTB: PROCESS
BEGIN
LOOP
	CLK_MTB <= '0';
	WAIT FOR 10000 ps;
	CLK_MTB <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 10000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK_MTB;
-- ADDR[10]
t_prcs_ADDR_10: PROCESS
BEGIN
	ADDR(10) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_10;
-- ADDR[9]
t_prcs_ADDR_9: PROCESS
BEGIN
	ADDR(9) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_9;
-- ADDR[8]
t_prcs_ADDR_8: PROCESS
BEGIN
	ADDR(8) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_8;
-- ADDR[7]
t_prcs_ADDR_7: PROCESS
BEGIN
	ADDR(7) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_7;
-- ADDR[6]
t_prcs_ADDR_6: PROCESS
BEGIN
	ADDR(6) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_6;
-- ADDR[5]
t_prcs_ADDR_5: PROCESS
BEGIN
	ADDR(5) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_5;
-- ADDR[4]
t_prcs_ADDR_4: PROCESS
BEGIN
	ADDR(4) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_4;
-- ADDR[3]
t_prcs_ADDR_3: PROCESS
BEGIN
	ADDR(3) <= '0';
	WAIT FOR 170000 ps;
	ADDR(3) <= '1';
	WAIT FOR 40000 ps;
	ADDR(3) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_3;
-- ADDR[2]
t_prcs_ADDR_2: PROCESS
BEGIN
	ADDR(2) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_2;
-- ADDR[1]
t_prcs_ADDR_1: PROCESS
BEGIN
	ADDR(1) <= '0';
	WAIT FOR 170000 ps;
	ADDR(1) <= '1';
	WAIT FOR 40000 ps;
	ADDR(1) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_1;
-- ADDR[0]
t_prcs_ADDR_0: PROCESS
BEGIN
	ADDR(0) <= '0';
WAIT;
END PROCESS t_prcs_ADDR_0;

-- PRELOAD
t_prcs_PRELOAD: PROCESS
BEGIN
	PRELOAD <= '0';
	WAIT FOR 170000 ps;
	PRELOAD <= '1';
	WAIT FOR 30000 ps;
	PRELOAD <= '0';
WAIT;
END PROCESS t_prcs_PRELOAD;
END PC_Mem_tb_arch;
