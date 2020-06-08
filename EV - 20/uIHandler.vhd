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
-- CREATED		"Mon Jun 08 20:38:27 2020"

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
		hold :  OUT  STD_LOGIC;
		MW :  OUT  STD_LOGIC;
		MR :  OUT  STD_LOGIC;
		hold_jump :  OUT  STD_LOGIC;
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
	PORT(MR : IN STD_LOGIC;
		 A2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 B2 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C3 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C4 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C5 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 T1 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 T2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 T3 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 T4 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 T5 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 hold_jump : OUT STD_LOGIC;
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
		 ALU_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B_in : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C_in : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 M : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 T_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 MW : OUT STD_LOGIC;
		 MR : OUT STD_LOGIC;
		 ALU_Out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
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

SIGNAL	Ca :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	Cb :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	Cd :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	hold_ALTERA_SYNTHESIZED :  STD_LOGIC;
SIGNAL	M :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	Tc :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(1 DOWNTO 0);


BEGIN 
A <= SYNTHESIZED_WIRE_0;
B <= SYNTHESIZED_WIRE_12;
C <= SYNTHESIZED_WIRE_2;
T <= SYNTHESIZED_WIRE_5;



b2v_inst : uc2
PORT MAP(MR => M(1),
		 A2 => SYNTHESIZED_WIRE_0,
		 B2 => SYNTHESIZED_WIRE_12,
		 C3 => Cb,
		 C4 => Cd,
		 C5 => SYNTHESIZED_WIRE_2,
		 T1 => uI_mem(6 DOWNTO 0),
		 T2 => SYNTHESIZED_WIRE_13,
		 T3 => SYNTHESIZED_WIRE_14,
		 T4 => Tc,
		 T5 => SYNTHESIZED_WIRE_5,
		 hold_jump => hold_jump,
		 hold => hold_ALTERA_SYNTHESIZED);


b2v_inst10 : ui3
PORT MAP(sys_clk => sys_clk,
		 C_in => Cd,
		 T_in => Tc,
		 C => SYNTHESIZED_WIRE_2,
		 T => SYNTHESIZED_WIRE_5);


b2v_inst12 : uc1
PORT MAP(hold => hold_ALTERA_SYNTHESIZED,
		 sys_clk => sys_clk,
		 ALU_in => SYNTHESIZED_WIRE_6,
		 B_in => SYNTHESIZED_WIRE_12,
		 C_in => Ca,
		 M => M,
		 T_in => SYNTHESIZED_WIRE_13,
		 MW => MW,
		 MR => MR,
		 ALU_Out => SYNTHESIZED_WIRE_9,
		 C => Cb,
		 T => SYNTHESIZED_WIRE_14);


b2v_inst8 : ui1
PORT MAP(sys_clk => sys_clk,
		 hold => hold_ALTERA_SYNTHESIZED,
		 instruction => Instruction,
		 uI_mem => uI_mem,
		 KMx => KMx,
		 A => SYNTHESIZED_WIRE_0,
		 ALUC => SYNTHESIZED_WIRE_6,
		 B => SYNTHESIZED_WIRE_12,
		 C => Ca,
		 Dadd => DAdd,
		 M => M,
		 sh => SYNTHESIZED_WIRE_10,
		 T => SYNTHESIZED_WIRE_13);


b2v_inst9 : ui2
PORT MAP(sys_clk => sys_clk,
		 ALUC_in => SYNTHESIZED_WIRE_9,
		 C_in => Cb,
		 sh_in => SYNTHESIZED_WIRE_10,
		 T_in => SYNTHESIZED_WIRE_14,
		 ALUC => ALUC,
		 C => Cd,
		 sh => sh,
		 T => Tc);

hold <= hold_ALTERA_SYNTHESIZED;

END bdf_type;