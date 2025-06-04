module ALU_NOR_7bit
(
    input wire [6:0] A,B,  
    output wire [6:0] result
);

assign result = ~(A | B);

endmodule