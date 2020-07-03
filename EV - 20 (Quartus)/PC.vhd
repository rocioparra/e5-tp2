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
-- CREATED		"Sat Jun 06 13:48:08 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY PC IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		LOAD :  IN  STD_LOGIC;
		HOLD :  IN  STD_LOGIC;
		ADDR_IN :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		ADDR_NEXT :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0);
		ADDR_OUT :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END PC;

ARCHITECTURE bdf_type OF PC IS 

COMPONENT inc_11b
	PORT(ADDR_IN : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 ADDR_OUT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT latchppc
	PORT(sys_clk : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux_11b
	PORT(SEL : IN STD_LOGIC;
		 INA : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 INB : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 ADDR_OUT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(10 DOWNTO 0);


BEGIN 
ADDR_NEXT <= SYNTHESIZED_WIRE_1;
ADDR_OUT <= SYNTHESIZED_WIRE_5;



b2v_inst : inc_11b
PORT MAP(ADDR_IN => SYNTHESIZED_WIRE_5,
		 ADDR_OUT => SYNTHESIZED_WIRE_2);


b2v_inst1 : latchppc
PORT MAP(sys_clk => CLK,
		 input => SYNTHESIZED_WIRE_1,
		 output => SYNTHESIZED_WIRE_5);


b2v_inst4 : mux_11b
PORT MAP(SEL => LOAD,
		 INA => ADDR_IN,
		 INB => SYNTHESIZED_WIRE_2,
		 ADDR_OUT => SYNTHESIZED_WIRE_4);


b2v_inst5 : mux_11b
PORT MAP(SEL => HOLD,
		 INA => SYNTHESIZED_WIRE_5,
		 INB => SYNTHESIZED_WIRE_4,
		 ADDR_OUT => SYNTHESIZED_WIRE_1);


END bdf_type;