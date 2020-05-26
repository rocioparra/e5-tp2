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
-- Generated on "05/25/2020 11:24:24"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Mem_tb
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Mem_tb_vhd_vec_tst IS
END Mem_tb_vhd_vec_tst;
ARCHITECTURE Mem_tb_arch OF Mem_tb_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL IN1_MTB : STD_LOGIC;
SIGNAL IN2_MTB : STD_LOGIC;
SIGNAL OUT_MTB : STD_LOGIC;
COMPONENT Mem_tb
	PORT (
	IN1_MTB : IN STD_LOGIC;
	IN2_MTB : IN STD_LOGIC;
	OUT_MTB : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Mem_tb
	PORT MAP (
-- list connections between master ports and signals
	IN1_MTB => IN1_MTB,
	IN2_MTB => IN2_MTB,
	OUT_MTB => OUT_MTB
	);

-- IN1_MTB
t_prcs_IN1_MTB: PROCESS
BEGIN
	IN1_MTB <= '0';
	WAIT FOR 570000 ps;
	IN1_MTB <= '1';
WAIT;
END PROCESS t_prcs_IN1_MTB;

-- IN2_MTB
t_prcs_IN2_MTB: PROCESS
BEGIN
	IN2_MTB <= '1';
WAIT;
END PROCESS t_prcs_IN2_MTB;
END Mem_tb_arch;
