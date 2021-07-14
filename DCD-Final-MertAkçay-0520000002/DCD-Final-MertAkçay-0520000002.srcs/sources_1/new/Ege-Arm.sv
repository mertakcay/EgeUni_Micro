`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2021 01:13:26 PM
// Design Name: 
// Module Name: Ege-Arm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Ege_Arm(input logic clk);

wire[7:0] pcBout,outClock;
wire [15:0] RD;
wire [7:0] rd1, rd2;
wire AluS,dataCheckMemory,regW,aluSrc,dataW;
wire aluC;
wire [7:0]aluInp;
wire Cout,z,o,n,c;
wire [7:0] resultAlu;
wire [7:0] RDMem,outLine;
wire [7:0] outImmAdrr,outPcb;
wire pcbsignal;





clock clockk(.clk(clk),.inp(outPcb),.out(outClock));
instruction instra(.A(outClock),.RD(RD));
MainDecoder maindecoder(.opcode(RD[3:0]),.AluS(AluS),.dataCheckMemory(dataCheckMemory),.regW(regW),.aluSrc(aluSrc),.dataW(dataW));
AluDecoder aludecoder(.AluS(AluS),.func(RD[2:0]),.AluC(aluC));
register regis(.clk(clk),.we3(regW),.wd3(outLine),.a1(RD[8:6]),.a2(RD[5:3]),.a3(RD[11:9]),.R15(outClock+2),.rd1(rd1),.rd2(rd2));
generalMux2 aluMux(.d0(rd2),.d1(RD[5:0]),.s(aluSrc),.y(aluInp));
Alu alu(.A(rd1),.B(aluInp),.AluC(aluC),.Cout(Cout),.result(resultAlu),.z(z),.o(o),.n(n),.c(c));
dataMemory datamemory(.clk(clk),.we(dataW),.A(resultAlu),.wd(RD[11:9]),.RD(RDMem));
generalMux2 ?mmMuxMem(.d0(resultAlu),.d1(RDMem),.s(dataCheckMemory),.y(outLine));
generalMux2 immAdrMux(.d0(RD[7:0]),.d1(RD[5:0]),.s(~(RD[8:6]^RD[11:9])),.y(outImmAdrr));
PcbDecoder pcbdecoder(.opcode(RD[3:0]),.s(pcbsignal));
generalMux2 pcbMux(.d0(outImmAdrr+2),.d1(outClock+1),.s(pcbsignal),.y(outPcb));

endmodule
