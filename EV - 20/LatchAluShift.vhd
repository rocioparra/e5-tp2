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
-- CREATED		"Thu May 28 12:35:04 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY LatchAluShift IS 
	PORT
	(
		carry_in :  IN  STD_LOGIC;
		sys_clk :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		ALU_C :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		sh :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Carry_out :  OUT  STD_LOGIC;
		From_C :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END LatchAluShift;

ARCHITECTURE bdf_type OF LatchAluShift IS 

COMPONENT alu
	PORT(cy_in : IN STD_LOGIC;
		 sys_clk : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 ctrl : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 cy_out : OUT STD_LOGIC;
		 output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT shifter
	PORT(sys_clk : IN STD_LOGIC;
		 ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT latch16
	PORT(sys_clk : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 



b2v_inst1 : alu
PORT MAP(cy_in => carry_in,
		 sys_clk => sys_clk,
		 a => SYNTHESIZED_WIRE_0,
		 b => SYNTHESIZED_WIRE_1,
		 ctrl => ALU_C,
		 cy_out => Carry_out,
		 output => SYNTHESIZED_WIRE_2);


b2v_inst2 : shifter
PORT MAP(sys_clk => sys_clk,
		 ctrl => sh,
		 input => SYNTHESIZED_WIRE_2,
		 output => SYNTHESIZED_WIRE_3);


b2v_inst4 : latch16
PORT MAP(sys_clk => sys_clk,
		 input => SYNTHESIZED_WIRE_3,
		 output => From_C);


b2v_LatchA : latch16
PORT MAP(sys_clk => sys_clk,
		 input => A,
		 output => SYNTHESIZED_WIRE_0);


b2v_LatchB : latch16
PORT MAP(sys_clk => sys_clk,
		 input => B,
		 output => SYNTHESIZED_WIRE_1);


END bdf_type;