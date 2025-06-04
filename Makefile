main:
	iverilog -o any_name.vvp ALU_tb.v ALU.v ALU_NOR_7bit.v ALU_ROR_7bit.v
	vvp any_name.vvp
	gtkwave alu_test.vcd