module ALU
(
    input wire [6:0] A, B,                   
    input wire OP,    
    output reg [6:0] result,     
    output wire CF,
    output wire SF,
    output wire ZF           
);

    wire [6:0] R_NOR, R_ROR;

    // Instantiate modules
    ALU_NOR_7bit NOR1 ( .A(A), .B(B), .result(R_NOR));
    ALU_ROR_7bit ROR1 ( .in(A), .shift(B[2:0]), .out(R_ROR));  // last 3 bits of input B

    always @(*) 
    begin
        case (OP)
            1'b0: // NOR 
                begin 
                    result = R_NOR; 
                end
            1'b1: // ROR
                begin 
                    
                    result = R_ROR;
                end
            
            default: 
                begin
                    result = 7'b0000000;  
                end
        endcase
    end

    assign CF = 1'b0;
    assign SF = result[6];
    assign ZF = ~(result[6] | result[5] | result[4] | result[3] | result[2] | result[1] | result[0]);

endmodule