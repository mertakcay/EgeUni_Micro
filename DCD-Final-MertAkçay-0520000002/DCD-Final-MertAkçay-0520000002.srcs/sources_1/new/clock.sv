`timescale 1ns / 1ps



module clock(input logic clk,input logic [7:0] inp,output logic [7:0] out);
always @ (posedge clk)
    assign out = inp;
endmodule
