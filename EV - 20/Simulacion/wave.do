onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /checkdeps_tb/instruction_in
add wave -noupdate /checkdeps_tb/instr2
add wave -noupdate /checkdeps_tb/ui_mem
add wave -noupdate /checkdeps_tb/sys_clk
add wave -noupdate /checkdeps_tb/hold
add wave -noupdate /checkdeps_tb/instArray
add wave -noupdate /checkdeps_tb/simulationEnded
add wave -noupdate /checkdeps_tb/instr_i
add wave -noupdate /checkdeps_tb/uicontrol/sys_clk
add wave -noupdate /checkdeps_tb/uicontrol/Instruction
add wave -noupdate /checkdeps_tb/uicontrol/uI_mem
add wave -noupdate /checkdeps_tb/uicontrol/KMx
add wave -noupdate /checkdeps_tb/uicontrol/MR
add wave -noupdate /checkdeps_tb/uicontrol/MW
add wave -noupdate /checkdeps_tb/uicontrol/hold
add wave -noupdate /checkdeps_tb/uicontrol/A
add wave -noupdate /checkdeps_tb/uicontrol/ALUC
add wave -noupdate /checkdeps_tb/uicontrol/B
add wave -noupdate /checkdeps_tb/uicontrol/C
add wave -noupdate /checkdeps_tb/uicontrol/DAdd
add wave -noupdate /checkdeps_tb/uicontrol/sh
add wave -noupdate /checkdeps_tb/uicontrol/T
add wave -noupdate /checkdeps_tb/uicontrol/hold_ALTERA_SYNTHESIZED
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
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
WaveRestoreZoom {0 ps} {129 ps}
