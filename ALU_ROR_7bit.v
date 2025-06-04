module ALU_ROR_7bit
(
    input [6:0] in,
    input [2:0] shift,
    output reg [6:0] out
);

always @(*) begin
    
    case(shift)
        3'b000: out = in;
        3'b001: out = {in[0], in[6:1]};
        3'b010: out = {in[1:0], in[6:2]};
        3'b011: out = {in[2:0], in[6:3]};
        3'b100: out = {in[3:0], in[6:4]};
        3'b101: out = {in[4:0], in[6:5]};
        3'b110: out = {in[5:0], in[6]};
        3'b111: out = in;
    endcase
end

endmodule