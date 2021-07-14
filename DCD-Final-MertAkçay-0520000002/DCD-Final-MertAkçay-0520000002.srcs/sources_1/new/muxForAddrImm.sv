`timescale 1ns / 1ps

module muxForAddrImm(input logic [6:0] Addr,input logic [4:0] Imm,
input logic s,
output logic [6:0] y);

assign y = s ? Imm : Addr;
endmodule
