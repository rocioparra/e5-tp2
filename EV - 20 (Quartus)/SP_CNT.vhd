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
-- CREATED		"Sun Jun 07 15:55:34 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SP_CNT IS 
	PORT
	(
		UP_DOWN :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		CLRN :  IN  STD_LOGIC;
		SP :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		TOS :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END SP_CNT;

ARCHITECTURE bdf_type OF SP_CNT IS 

COMPONENT counter_3b
	PORT(updown : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 aclr : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT add_3b
	PORT(dataa : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(2 DOWNTO 0);


BEGIN 
SP <= SYNTHESIZED_WIRE_1;



b2v_inst : counter_3b
PORT MAP(updown => UP_DOWN,
		 clock => CLK,
		 aclr => SYNTHESIZED_WIRE_0,
		 q => SYNTHESIZED_WIRE_1);


b2v_inst2 : add_3b
PORT MAP(dataa => SYNTHESIZED_WIRE_1,
		 result => TOS);


SYNTHESIZED_WIRE_0 <= NOT(CLRN);



END bdf_type;