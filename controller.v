module controller
(
    input wire clk, reset,
    output reg [6:0] A, B,
    output reg OP
);

reg [2:0] pstate, nstate;
parameter [2:0] START = 3'b000,
                ONE   = 3'b001,
                TWO   = 3'b010,
                THREE = 3'b011,
                FINISH = 3'b100;

always @(posedge clk or posedge reset)
begin
    if (reset)
        pstate <= START;
    else
        pstate <= nstate;
end

always @(*)
begin
    
    A = 7'b0000000;
    B = 7'b0000000;
    OP = 1'b0;

    nstate = pstate;

    case (pstate)
        START:
            nstate = ONE;
        ONE:
        begin
            A = 7'b1001000;
            B = 7'b1111010;
            OP = 1'b0;
            nstate = TWO;
        end
        TWO:
        begin
            A = 7'b0111001;
            B = 7'b0000110;
            OP = 1'b0;
            nstate = THREE;
        end
        THREE:
        begin
            A = 7'b0000010;
            B = 7'b0000010;
            OP = 1'b1;
            nstate = FINISH;
        end
        FINISH:
        begin    
            nstate = START;
        end  
  
        default: nstate = START;
    endcase
end

endmodule