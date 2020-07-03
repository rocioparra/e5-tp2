onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 20 /ev20_tb/ev20Block/sys_clk
add wave -noupdate -height 20 /ev20_tb/ev20Block/Instruction
add wave -noupdate -height 20 /ev20_tb/ev20Block/preInstr
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/d_addr_in
add wave -noupdate -height 20 /ev20_tb/ev20Block/resetN
add wave -noupdate -height 20 /ev20_tb/ev20Block/A
add wave -noupdate -height 20 /ev20_tb/ev20Block/ALUC
add wave -noupdate -height 20 /ev20_tb/ev20Block/B
add wave -noupdate -height 20 /ev20_tb/ev20Block/C
add wave -noupdate -height 20 /ev20_tb/ev20Block/carry
add wave -noupdate -height 20 /ev20_tb/ev20Block/From_C
add wave -noupdate -height 20 /ev20_tb/ev20Block/hold
add wave -noupdate -height 20 /ev20_tb/ev20Block/hold_jump
add wave -noupdate -height 20 /ev20_tb/ev20Block/kMuxc
add wave -noupdate -height 20 /ev20_tb/ev20Block/load
add wave -noupdate -height 20 /ev20_tb/ev20Block/MR
add wave -noupdate -height 20 /ev20_tb/ev20Block/MW
add wave -noupdate -height 20 /ev20_tb/ev20Block/PCAdd
add wave -noupdate -height 20 /ev20_tb/ev20Block/To_A
add wave -noupdate -height 20 /ev20_tb/ev20Block/uIFromROM
add wave -noupdate -height 20 -radix unsigned /ev20_tb/ev20Block/W
add wave -noupdate -height 20 /ev20_tb/ev20Block/I
add wave -noupdate -height 20 -radix hexadecimal /ev20_tb/ev20Block/DAdd
add wave -noupdate -height 20 -radix unsigned /ev20_tb/ev20Block/R0
add wave -noupdate -height 20 -radix unsigned /ev20_tb/ev20Block/R1
add wave -noupdate -height 20 -radix unsigned /ev20_tb/ev20Block/b2v_DataRAM/address
add wave -noupdate -height 20 /ev20_tb/ev20Block/b2v_DataRAM/clock
add wave -noupdate -height 20 -radix hexadecimal /ev20_tb/ev20Block/b2v_DataRAM/data
add wave -noupdate -height 20 /ev20_tb/ev20Block/b2v_DataRAM/wren
add wave -noupdate -height 20 /ev20_tb/ev20Block/b2v_DataRAM/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {213 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 566
configure wave -valuecolwidth 38
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
WaveRestoreZoom {84 ps} {318 ps}
