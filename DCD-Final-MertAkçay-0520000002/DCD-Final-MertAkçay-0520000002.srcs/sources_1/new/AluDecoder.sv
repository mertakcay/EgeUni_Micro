`timescale 1ns / 1ps


module AluDecoder(input logic AluS,input logic [2:0] func,output logic [1:0] AluC);

always_comb
    if((AluS == 1'b1) & (func == 3'b000))
        AluC = 2'b00;
    else if ((AluS == 1'b1) & (func == 3'b010))
        AluC = 2'b01;
    else if ((AluS == 1'b1) & (func == 3'b100))
        AluC = 2'b10;
    else if ((AluS == 1'b1) & (func == 3'b101))
        AluC = 2'b11;
    else
        AluC = 2'b00; 

endmodule
