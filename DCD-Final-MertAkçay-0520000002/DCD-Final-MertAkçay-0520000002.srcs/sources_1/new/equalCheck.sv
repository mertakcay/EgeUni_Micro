`timescale 1ns / 1ps


module EqualCheck(input logic [2:0]rA,rD,output logic s);
always_comb
    if(rA == rD)
        s = 1'b1;
    else
        s = 1'b0;
endmodule
