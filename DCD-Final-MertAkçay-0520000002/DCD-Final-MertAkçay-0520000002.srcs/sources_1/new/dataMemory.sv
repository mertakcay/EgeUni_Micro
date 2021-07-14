`timescale 1ns / 1ps
module dataMemory(input logic clk,
input logic we,
input logic [7:0] A,
input logic [7:0] wd,
output logic [7:0] RD);

reg [7:0] rf[255:0];
// asl?nda burada adresleme ile yap?ld??? teoride gösterildi
// fakat  datamemory nin nas?l kodland???n? bulam?yorum
initial rf[0]=8'b0000;
initial rf[1]=8'b0001;
initial rf[2]=8'b0010;
initial rf[3]=8'b0011;
initial rf[4]=8'b0100;
initial rf[5]=8'b0101;
initial rf[6]=8'b0110;
initial rf[7]=8'b0111;

always  @(posedge clk)
begin
    if (we) rf[A] <= wd; 
    else
    begin
        RD <= rf[A];
    end
end


endmodule
