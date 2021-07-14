`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2021 09:47:30 PM
// Design Name: 
// Module Name: PcbDecoder
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


module PcbDecoder(input logic [3:0] opcode,output logic s);

always_comb
    if(opcode == 4'b1000)
        s = 0;
    else if (opcode == 4'b0010)
        s = 0;
    else
        s = 1; 


endmodule
