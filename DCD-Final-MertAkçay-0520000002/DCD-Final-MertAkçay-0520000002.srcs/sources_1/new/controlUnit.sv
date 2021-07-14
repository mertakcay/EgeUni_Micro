`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2021 08:53:07 PM
// Design Name: 
// Module Name: controlUnit
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


module MainDecoder(input logic [3:0] opcode,output logic AluS,dataCheckMemory,regW,aluSrc,dataW);


always @(opcode)
begin
    if(opcode == 4'b0000)
    begin
        assign AluS = 1;
        assign dataCheckMemory = 0;
        assign regW = 1;
        assign aluSrc = 0;
        assign dataW = 0;
    end
    else if (opcode == 4'b0100)
    begin
        assign AluS = 0;
        assign dataCheckMemory = 0;
        assign regW = 1;
        assign aluSrc = 1;
        assign dataW = 0; //xx
    end
    else if (opcode == 4'b1011)
    begin
        assign AluS = 0;
        assign dataCheckMemory = 1;
        assign regW = 1;
        assign aluSrc = 1;
        assign dataW = 0; //xx
    end
    else if (opcode == 4'b1111)
    begin
        assign AluS = 0;
        assign dataCheckMemory = 0; //xx
        assign regW = 0;
        assign aluSrc = 1;
        assign dataW = 1; //xx
    end
    else if (opcode == 4'b1000)
    begin
        assign AluS = 0; //xx
        assign dataCheckMemory = 0; //xx
        assign regW = 1; //xx
        assign aluSrc = 1; //xx
        assign dataW = 0; //xx
    end
    else if (opcode == 4'b0010)
    begin
        assign AluS = 0; //xx
        assign dataCheckMemory = 0;//xx
        assign regW = 1; //xx
        assign aluSrc = 1; //xx
        assign dataW = 0; //xx
    end
end    
endmodule
