-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"
-- CREATED		"Tue May 19 18:05:09 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY LatchALUShifter IS 
	PORT
	(
		sys_clk :  IN  STD_LOGIC;
		carry_in :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		ALU_ctrl :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		shift_ctrl :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		carry_out :  OUT  STD_LOGIC;
		output :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END LatchALUShifter;

ARCHITECTURE bdf_type OF LatchALUShifter IS 

COMPONENT shifter
	PORT(sys_clk : IN STD_LOGIC;
		 ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

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



b2v_inst : shifter
PORT MAP(sys_clk => sys_clk,
		 ctrl => shift_ctrl,
		 input => SYNTHESIZED_WIRE_0,
		 output => SYNTHESIZED_WIRE_3);


b2v_inst1 : alu
PORT MAP(cy_in => carry_in,
		 sys_clk => sys_clk,
		 a => SYNTHESIZED_WIRE_1,
		 b => SYNTHESIZED_WIRE_2,
		 ctrl => ALU_ctrl,
		 cy_out => carry_out,
		 output => SYNTHESIZED_WIRE_0);


b2v_LatchA : latch16
PORT MAP(sys_clk => sys_clk,
		 input => a,
		 output => SYNTHESIZED_WIRE_1);


b2v_LatchB : latch16
PORT MAP(sys_clk => sys_clk,
		 input => b,
		 output => SYNTHESIZED_WIRE_2);


b2v_LatchC : latch16
PORT MAP(sys_clk => sys_clk,
		 input => SYNTHESIZED_WIRE_3,
		 output => output);


END bdf_type;