onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ev20_tb/ev20Block/sys_clk
add wave -noupdate /ev20_tb/ev20Block/preInstr
add wave -noupdate /ev20_tb/ev20Block/Instruction
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/PCAdd
add wave -noupdate /ev20_tb/ev20Block/hold
add wave -noupdate /ev20_tb/ev20Block/hold_jump
add wave -noupdate /ev20_tb/ev20Block/load
add wave -noupdate -radix decimal /ev20_tb/ev20Block/W
add wave -noupdate /ev20_tb/ev20Block/b2v_PC/HOLD
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_PC/ADDR_IN
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_PC/ADDR_NEXT
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_PC/ADDR_OUT
add wave -noupdate /ev20_tb/ev20Block/b2v_CarryBlock/ALU_C
add wave -noupdate /ev20_tb/ev20Block/b2v_CarryBlock/carry_out
add wave -noupdate /ev20_tb/ev20Block/b2v_CarryBlock/carry_in
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/sys_clk
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/Instruction
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/uI_mem
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/KMx
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/hold
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/MW
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/MR
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/hold_jump
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/A
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/ALUC
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/B
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/C
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/DAdd
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/sh
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/Tc
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/T
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/Ca
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/Cb
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/Cd
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/hold_ALTERA_SYNTHESIZED
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/carry_in
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/sys_clk
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/A
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/ALU_C
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/B
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/sh
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/Carry_out
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/From_C
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/SYNTHESIZED_WIRE_0
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/SYNTHESIZED_WIRE_1
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/SYNTHESIZED_WIRE_2
add wave -noupdate /ev20_tb/ev20Block/b2v_LAS/SYNTHESIZED_WIRE_3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {66 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 273
configure wave -valuecolwidth 131
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {819 ps} {1006 ps}
