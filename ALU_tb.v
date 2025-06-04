`timescale 1ns/1ps
module ALU_tb;

    reg [6:0] A, B;       
    reg OP;          
    wire [6:0] R;          
    wire CF;
    wire SF;
    wire ZF;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .result(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );

    initial begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0, ALU_tb);

        A = 7'b0000100; B = 7'b0000011; OP = 1'b0;
        #10;

        A = 7'b0001100; B = 7'b0000010; OP = 1'b1;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b ZF=%b SF=%b", $time, A, B, OP, R, CF, ZF, SF);
    end

endmodule