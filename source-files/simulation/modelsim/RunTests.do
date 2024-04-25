vsim work.basicrisccputestbench

add wave -position insertpoint  \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_IR/Q

add wave -position insertpoint  \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_PC/Q

add wave -position insertpoint  \
sim:/basicrisccputestbench/b2v_BasicRISCCPU/b2v_Datapath/b2v_RegisterFile/RF

run 75000 ns
