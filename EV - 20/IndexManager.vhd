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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"
-- CREATED		"Tue Jun 09 01:21:17 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY IndexManager IS 
	PORT
	(
		DAddr :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		I :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		R0 :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		R1 :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		DAddrOut :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END IndexManager;

ARCHITECTURE bdf_type OF IndexManager IS 

COMPONENT muxr
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

COMPONENT add10b
	PORT(dataa : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(9 DOWNTO 0);


BEGIN 



b2v_inst : muxr
PORT MAP(sel => I(0),
		 data0x => R0(9 DOWNTO 0),
		 data1x => R1(9 DOWNTO 0),
		 result => SYNTHESIZED_WIRE_1);


b2v_inst1 : muxr
PORT MAP(sel => I(1),
		 data0x => DAddr,
		 data1x => SYNTHESIZED_WIRE_0,
		 result => DAddrOut);


b2v_inst2 : add10b
PORT MAP(dataa => SYNTHESIZED_WIRE_1,
		 datab => DAddr,
		 result => SYNTHESIZED_WIRE_0);


END bdf_type;