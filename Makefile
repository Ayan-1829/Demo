ALU:
	iverilog -o any_name.vvp ALU_tb.v ALU.v ALU_NOR_7bit.v ALU_ROR_7bit.v
	vvp any_name.vvp
	gtkwave alu_test.vcd

top:
	iverilog -o any_name.vvp top_tb.v top.v controller.v ALU.v ALU_NOR_7bit.v ALU_ROR_7bit.v
	vvp any_name.vvp
	gtkwave top_test.vcd

controller:
	iverilog -o any_name.vvp controller_tb.v controller.v
	vvp any_name.vvp
	gtkwave controller_test.vcd