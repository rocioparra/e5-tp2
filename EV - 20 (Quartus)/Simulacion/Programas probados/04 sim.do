onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ev20_tb/ev20Block/sys_clk
add wave -noupdate -radix hexadecimal /ev20_tb/ev20Block/PCAdd
add wave -noupdate -radix hexadecimal /ev20_tb/ev20Block/b2v_PC/ADDR_NEXT
add wave -noupdate -radix hexadecimal /ev20_tb/ev20Block/b2v_PC/ADDR_OUT
add wave -noupdate /ev20_tb/ev20Block/hold
add wave -noupdate /ev20_tb/ev20Block/hold_jump
add wave -noupdate /ev20_tb/ev20Block/Instruction
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/W
add wave -noupdate -radix unsigned /ev20_tb/ev20Block/b2v_RegBank/reg_map
add wave -noupdate /ev20_tb/ev20Block/load
add wave -noupdate /ev20_tb/ev20Block/kMuxc
add wave -noupdate /ev20_tb/ev20Block/b2v_BranchBlock/BRA
add wave -noupdate /ev20_tb/ev20Block/b2v_BranchBlock/RET
add wave -noupdate /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Adaptador/TOS
add wave -noupdate /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Adaptador/SP
add wave -noupdate -radix hexadecimal /ev20_tb/ev20Block/b2v_BranchBlock/Jmp_Addr
add wave -noupdate -radix hexadecimal /ev20_tb/ev20Block/b2v_BranchBlock/Bra_Addr
add wave -noupdate -radix hexadecimal /ev20_tb/ev20Block/b2v_BranchBlock/Ret_Addr
add wave -noupdate -radix hexadecimal /ev20_tb/ev20Block/b2v_BranchBlock/Addr_Out
add wave -noupdate -radix hexadecimal /ev20_tb/ev20Block/b2v_BranchBlock/Curr_Addr
add wave -noupdate /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/wren
add wave -noupdate -radix hexadecimal -childformat {{/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(15) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(14) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(13) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(12) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(11) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(10) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(9) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(8) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(7) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(6) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(5) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(4) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(3) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(2) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(1) -radix hexadecimal} {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(0) -radix hexadecimal}} -expand -subitemconfig {/ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(15) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(14) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(13) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(12) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(11) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(10) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(9) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(8) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(7) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(6) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(5) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(4) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(3) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(2) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(1) {-height 15 -radix hexadecimal} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a(0) {-height 15 -radix hexadecimal}} /ev20_tb/ev20Block/b2v_BranchBlock/b2v_Memoria/altsyncram_component/MEMORY/m_mem_data_a
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {324 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 362
configure wave -valuecolwidth 39
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
WaveRestoreZoom {13 ps} {415 ps}
