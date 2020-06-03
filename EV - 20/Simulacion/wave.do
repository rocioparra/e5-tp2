onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ev20_tb/ev20Block/sys_clk
add wave -noupdate /ev20_tb/ev20Block/preInstr
add wave -noupdate /ev20_tb/ev20Block/Instruction
add wave -noupdate /ev20_tb/ev20Block/uIFromROM
add wave -noupdate /ev20_tb/ev20Block/A
add wave -noupdate /ev20_tb/ev20Block/ALUC
add wave -noupdate /ev20_tb/ev20Block/B
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/C
add wave -noupdate /ev20_tb/ev20Block/carry
add wave -noupdate /ev20_tb/ev20Block/DAdd
add wave -noupdate /ev20_tb/ev20Block/From_C
add wave -noupdate /ev20_tb/ev20Block/hold
add wave -noupdate /ev20_tb/ev20Block/kMuxc
add wave -noupdate /ev20_tb/ev20Block/MR
add wave -noupdate /ev20_tb/ev20Block/MW
add wave -noupdate /ev20_tb/ev20Block/PC
add wave -noupdate /ev20_tb/ev20Block/preLoad
add wave -noupdate /ev20_tb/ev20Block/To_A
add wave -noupdate /ev20_tb/ev20Block/To_B
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/W
add wave -noupdate /ev20_tb/ev20Block/b2v_CarryBlock/carry_out
add wave -noupdate /ev20_tb/ev20Block/b2v_CarryBlock/carry_in
add wave -noupdate -radix unsigned -childformat {{/ev20_tb/ev20Block/b2v_RegBank/reg_map(0) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(1) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(2) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(3) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(4) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(5) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(6) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(7) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(8) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(9) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(10) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(11) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(12) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(13) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(14) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(15) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(16) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(17) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(18) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(19) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(20) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(21) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(22) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(23) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(24) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(25) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(26) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(27) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(28) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(29) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(30) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(31) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(32) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(33) -radix unsigned} {/ev20_tb/ev20Block/b2v_RegBank/reg_map(34) -radix unsigned}} -subitemconfig {/ev20_tb/ev20Block/b2v_RegBank/reg_map(0) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(1) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(2) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(3) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(4) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(5) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(6) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(7) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(8) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(9) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(10) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(11) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(12) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(13) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(14) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(15) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(16) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(17) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(18) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(19) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(20) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(21) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(22) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(23) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(24) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(25) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(26) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(27) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(28) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(29) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(30) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(31) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(32) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(33) {-height 15 -radix unsigned} /ev20_tb/ev20Block/b2v_RegBank/reg_map(34) {-height 15 -radix unsigned}} /ev20_tb/ev20Block/b2v_RegBank/reg_map
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_uIControl/A
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_uIControl/ALUC
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_uIControl/B
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_uIControl/Ca
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_uIControl/Cb
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_uIControl/Cd
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_uIControl/C
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/Tb
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/Tc
add wave -noupdate /ev20_tb/ev20Block/b2v_uIControl/T
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {312 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 287
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
WaveRestoreZoom {226 ps} {415 ps}
