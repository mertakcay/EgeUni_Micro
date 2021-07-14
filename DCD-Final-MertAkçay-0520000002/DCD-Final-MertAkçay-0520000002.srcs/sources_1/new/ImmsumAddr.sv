`timescale 1ns / 1ps
module ImmsumAddr(input logic [6:0] Addr,input logic [4:0] Imm,output logic [6:0] outSum);

assign outSum = Addr+Imm;
endmodule
