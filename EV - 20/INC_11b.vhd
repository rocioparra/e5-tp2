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
-- CREATED		"Sat Jun 06 13:46:43 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY INC_11b IS 
	PORT
	(
		ADDR_IN :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		ADDR_OUT :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END INC_11b;

ARCHITECTURE bdf_type OF INC_11b IS 

SIGNAL	ADDR_OUT_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_21 <= '1';



ADDR_OUT_ALTERA_SYNTHESIZED(0) <= ADDR_IN(0) XOR SYNTHESIZED_WIRE_21;


SYNTHESIZED_WIRE_23 <= ADDR_IN(4) AND SYNTHESIZED_WIRE_22;


ADDR_OUT_ALTERA_SYNTHESIZED(5) <= ADDR_IN(5) XOR SYNTHESIZED_WIRE_23;


SYNTHESIZED_WIRE_24 <= ADDR_IN(5) AND SYNTHESIZED_WIRE_23;


ADDR_OUT_ALTERA_SYNTHESIZED(6) <= ADDR_IN(6) XOR SYNTHESIZED_WIRE_24;


SYNTHESIZED_WIRE_25 <= ADDR_IN(6) AND SYNTHESIZED_WIRE_24;


ADDR_OUT_ALTERA_SYNTHESIZED(7) <= ADDR_IN(7) XOR SYNTHESIZED_WIRE_25;


SYNTHESIZED_WIRE_26 <= ADDR_IN(7) AND SYNTHESIZED_WIRE_25;


ADDR_OUT_ALTERA_SYNTHESIZED(8) <= ADDR_IN(8) XOR SYNTHESIZED_WIRE_26;


SYNTHESIZED_WIRE_27 <= ADDR_IN(8) AND SYNTHESIZED_WIRE_26;


ADDR_OUT_ALTERA_SYNTHESIZED(9) <= ADDR_IN(9) XOR SYNTHESIZED_WIRE_27;


SYNTHESIZED_WIRE_28 <= ADDR_IN(0) AND SYNTHESIZED_WIRE_21;


SYNTHESIZED_WIRE_13 <= ADDR_IN(9) AND SYNTHESIZED_WIRE_27;


ADDR_OUT_ALTERA_SYNTHESIZED(10) <= ADDR_IN(10) XOR SYNTHESIZED_WIRE_13;



ADDR_OUT_ALTERA_SYNTHESIZED(1) <= ADDR_IN(1) XOR SYNTHESIZED_WIRE_28;


SYNTHESIZED_WIRE_29 <= ADDR_IN(1) AND SYNTHESIZED_WIRE_28;


ADDR_OUT_ALTERA_SYNTHESIZED(2) <= ADDR_IN(2) XOR SYNTHESIZED_WIRE_29;


SYNTHESIZED_WIRE_30 <= ADDR_IN(2) AND SYNTHESIZED_WIRE_29;


ADDR_OUT_ALTERA_SYNTHESIZED(3) <= ADDR_IN(3) XOR SYNTHESIZED_WIRE_30;


SYNTHESIZED_WIRE_22 <= ADDR_IN(3) AND SYNTHESIZED_WIRE_30;


ADDR_OUT_ALTERA_SYNTHESIZED(4) <= ADDR_IN(4) XOR SYNTHESIZED_WIRE_22;

ADDR_OUT <= ADDR_OUT_ALTERA_SYNTHESIZED;

END bdf_type;