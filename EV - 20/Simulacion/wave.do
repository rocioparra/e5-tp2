onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ev20_tb/ev20Block/sys_clk
add wave -noupdate /ev20_tb/ev20Block/preInstr
add wave -noupdate /ev20_tb/ev20Block/Instruction
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/PCAdd
add wave -noupdate /ev20_tb/ev20Block/hold
add wave -noupdate /ev20_tb/ev20Block/load
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/W
add wave -noupdate /ev20_tb/ev20Block/b2v_PC/HOLD
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_PC/ADDR_IN
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_PC/ADDR_OUT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {68 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 273
configure wave -valuecolwidth 100
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
WaveRestoreZoom {6 ps} {205 ps}
