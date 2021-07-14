`timescale 1ns / 1ps


module Alu(input logic [7:0] A,B,input logic [1:0] AluC,
output logic Cout,output logic [7:0] result,
output logic z,o,n,c);


wire [7:0] wire1,wire2;



mux2 notMux(.d0(B),.d1(~B),.s(AluC[0]),.y(wire1));
NbitFulladder fullAdder(.a(A),.b(wire1),.cin(AluC[0]),.s(wire2),.cout(Cout));
mux4 finalMux(.d0(wire2),.d1(wire2),.d2(A&B),.d3(A|B),.s(AluC),.y(result));


assign z =&(~result);
assign n = result[7];
assign c = ((~AluC[1])&Cout);
assign o = ~(AluC[0]^A[7]^B[7])&~(AluC[1])&(A[7]^wire2[7:0]);







endmodule
