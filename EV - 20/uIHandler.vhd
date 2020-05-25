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
-- CREATED		"Mon May 25 00:59:12 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY uIHandler IS 
	PORT
	(
		sys_clk :  IN  STD_LOGIC;
		Instruction :  IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
		uI_mem :  IN  STD_LOGIC_VECTOR(27 DOWNTO 0);
		KMx :  OUT  STD_LOGIC;
		MR :  OUT  STD_LOGIC;
		MW :  OUT  STD_LOGIC;
		hold :  OUT  STD_LOGIC;
		A :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ALUC :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
		C :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0);
		DAdd :  OUT  STD_LOGIC_VECTOR(9 DOWNTO 0);
		sh :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		T :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END uIHandler;

ARCHITECTURE bdf_type OF uIHandler IS 

COMPONENT uc2
	PORT(A2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 B2 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C3 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C4 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C5 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 T2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 T3 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 T4 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 T5 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 hold : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT ui3
	PORT(sys_clk : IN STD_LOGIC;
		 C_in : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 T_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 T : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uc1
	PORT(hold : IN STD_LOGIC;
		 sys_clk : IN STD_LOGIC;
		 B_in : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C_in : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 M : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 T_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 MW : OUT STD_LOGIC;
		 MR : OUT STD_LOGIC;
		 C : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 T : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ui1
	PORT(sys_clk : IN STD_LOGIC;
		 hold : IN STD_LOGIC;
		 instruction : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
		 uI_mem : IN STD_LOGIC_VECTOR(27 DOWNTO 0);
		 KMx : OUT STD_LOGIC;
		 A : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ALUC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 Dadd : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		 M : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 sh : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 T : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ui2
	PORT(sys_clk : IN STD_LOGIC;
		 ALUC_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 C_in : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 sh_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 T_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 ALUC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 C : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		 sh : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 T : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	hold_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(1 DOWNTO 0);


BEGIN 
A <= SYNTHESIZED_WIRE_0;
B <= SYNTHESIZED_WIRE_19;
C <= SYNTHESIZED_WIRE_4;
T <= SYNTHESIZED_WIRE_8;



b2v_inst : uc2
PORT MAP(A2 => SYNTHESIZED_WIRE_0,
		 B2 => SYNTHESIZED_WIRE_19,
		 C3 => SYNTHESIZED_WIRE_20,
		 C4 => SYNTHESIZED_WIRE_21,
		 C5 => SYNTHESIZED_WIRE_4,
		 T2 => SYNTHESIZED_WIRE_22,
		 T3 => SYNTHESIZED_WIRE_23,
		 T4 => SYNTHESIZED_WIRE_24,
		 T5 => SYNTHESIZED_WIRE_8,
		 hold => hold_ALTERA_SYNTHESIZED);


b2v_inst10 : ui3
PORT MAP(sys_clk => sys_clk,
		 C_in => SYNTHESIZED_WIRE_21,
		 T_in => SYNTHESIZED_WIRE_24,
		 C => SYNTHESIZED_WIRE_4,
		 T => SYNTHESIZED_WIRE_8);


b2v_inst12 : uc1
PORT MAP(hold => hold_ALTERA_SYNTHESIZED,
		 sys_clk => sys_clk,
		 B_in => SYNTHESIZED_WIRE_19,
		 C_in => SYNTHESIZED_WIRE_12,
		 M => SYNTHESIZED_WIRE_13,
		 T_in => SYNTHESIZED_WIRE_22,
		 MW => MR,
		 MR => MW,
		 C => SYNTHESIZED_WIRE_20,
		 T => SYNTHESIZED_WIRE_23);


b2v_inst8 : ui1
PORT MAP(sys_clk => sys_clk,
		 hold => hold_ALTERA_SYNTHESIZED,
		 instruction => Instruction,
		 uI_mem => uI_mem,
		 KMx => KMx,
		 A => SYNTHESIZED_WIRE_0,
		 ALUC => SYNTHESIZED_WIRE_15,
		 B => SYNTHESIZED_WIRE_19,
		 C => SYNTHESIZED_WIRE_12,
		 Dadd => DAdd,
		 M => SYNTHESIZED_WIRE_13,
		 sh => SYNTHESIZED_WIRE_17,
		 T => SYNTHESIZED_WIRE_22);


b2v_inst9 : ui2
PORT MAP(sys_clk => sys_clk,
		 ALUC_in => SYNTHESIZED_WIRE_15,
		 C_in => SYNTHESIZED_WIRE_20,
		 sh_in => SYNTHESIZED_WIRE_17,
		 T_in => SYNTHESIZED_WIRE_23,
		 ALUC => ALUC,
		 C => SYNTHESIZED_WIRE_21,
		 sh => sh,
		 T => SYNTHESIZED_WIRE_24);

hold <= hold_ALTERA_SYNTHESIZED;

END bdf_type;