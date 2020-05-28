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
-- CREATED		"Thu May 28 00:35:46 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CYBlock IS 
	PORT
	(
		carry_out :  IN  STD_LOGIC;
		sys_clk :  IN  STD_LOGIC;
		ALU_C :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		carry_in :  OUT  STD_LOGIC
	);
END CYBlock;

ARCHITECTURE bdf_type OF CYBlock IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT mux_0
	PORT(data : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(0 TO 0);
		 result : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF mux_0: COMPONENT IS true;
ATTRIBUTE noopt OF mux_0: COMPONENT IS true;

SIGNAL	data :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	result :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 



b2v_inst : mux_0
PORT MAP(data => data,
		 sel(0) => SYNTHESIZED_WIRE_0,
		 result => result);


data(1) <= ALU_C(3) AND ALU_C(2) AND SYNTHESIZED_WIRE_1 AND SYNTHESIZED_WIRE_2;


SYNTHESIZED_WIRE_3 <= NOT(ALU_C(2));



SYNTHESIZED_WIRE_1 <= NOT(ALU_C(1));



SYNTHESIZED_WIRE_2 <= NOT(ALU_C(0));



SYNTHESIZED_WIRE_4 <= ALU_C(3) AND SYNTHESIZED_WIRE_3 AND ALU_C(1) AND ALU_C(0);


SYNTHESIZED_WIRE_0 <= SYNTHESIZED_WIRE_4 OR data(1);


PROCESS(sys_clk)
BEGIN
IF (RISING_EDGE(sys_clk)) THEN
	carry_in <= result;
END IF;
END PROCESS;


data(0) <= carry_out;
END bdf_type;