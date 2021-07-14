`timescale 1ns / 1ps
module register(input logic clk,
input logic we3,
input logic [3:0] a1, a2, a3,
input logic [7:0] wd3,input logic R15,
output logic [7:0] rd1, rd2);

reg [7:0] rf[7:0];

initial rf[0]=8'b0000;
initial rf[1]=8'b0001;
initial rf[2]=8'b0010;
initial rf[3]=8'b0011;
initial rf[4]=8'b0100;
initial rf[5]=8'b0101;
initial rf[6]=8'b0110;
initial rf[7]=8'b0111;
assign rf[15] = R15;

always  @(posedge clk)
begin
    if (we3) rf[a3] <= wd3; 
    else
    begin
        rd1 <= rf[a1];
        rd2 <= rf[a2];
    end
end


endmodule
