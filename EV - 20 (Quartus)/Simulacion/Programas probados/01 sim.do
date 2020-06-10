onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ev20_tb/ev20Block/sys_clk
add wave -noupdate /ev20_tb/ev20Block/A
add wave -noupdate /ev20_tb/ev20Block/ALUC
add wave -noupdate /ev20_tb/ev20Block/B
add wave -noupdate /ev20_tb/ev20Block/C
add wave -noupdate /ev20_tb/ev20Block/carry
add wave -noupdate /ev20_tb/ev20Block/DAdd
add wave -noupdate /ev20_tb/ev20Block/From_C
add wave -noupdate /ev20_tb/ev20Block/hold
add wave -noupdate /ev20_tb/ev20Block/Instruction
add wave -noupdate /ev20_tb/ev20Block/kMuxc
add wave -noupdate /ev20_tb/ev20Block/MR
add wave -noupdate /ev20_tb/ev20Block/MW
add wave -noupdate /ev20_tb/ev20Block/PC
add wave -noupdate /ev20_tb/ev20Block/preInstr
add wave -noupdate /ev20_tb/ev20Block/preLoad
add wave -noupdate /ev20_tb/ev20Block/To_A
add wave -noupdate /ev20_tb/ev20Block/To_B
add wave -noupdate /ev20_tb/ev20Block/uIFromROM
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/W
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {185 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 198
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
WaveRestoreZoom {373 ps} {823 ps}
