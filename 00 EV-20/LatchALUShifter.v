// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"
// CREATED		"Tue May 19 18:03:28 2020"

module LatchALUShifter(
	sys_clk,
	carry_in,
	a,
	ALU_ctrl,
	b,
	shift_ctrl,
	carry_out
);


input wire	sys_clk;
input wire	carry_in;
input wire	[15:0] a;
input wire	[3:0] ALU_ctrl;
input wire	[15:0] b;
input wire	[1:0] shift_ctrl;
output wire	carry_out;

wire	[15:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[15:0] SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;





shifter	b2v_inst(
	.sys_clk(sys_clk),
	.ctrl(shift_ctrl),
	.input(SYNTHESIZED_WIRE_0),
	.output(SYNTHESIZED_WIRE_3));


ALU	b2v_inst1(
	.cy_in(carry_in),
	.sys_clk(sys_clk),
	.a(SYNTHESIZED_WIRE_1),
	.b(SYNTHESIZED_WIRE_2),
	.ctrl(ALU_ctrl),
	.cy_out(carry_out),
	.output(SYNTHESIZED_WIRE_0));


Latch16	b2v_LatchA(
	.sys_clk(sys_clk),
	.input(a),
	.output(SYNTHESIZED_WIRE_1));


Latch16	b2v_LatchB(
	.sys_clk(sys_clk),
	.input(b),
	.output(SYNTHESIZED_WIRE_2));


Latch16	b2v_LatchC(
	.sys_clk(sys_clk),
	.input(SYNTHESIZED_WIRE_3)
	);


endmodule
