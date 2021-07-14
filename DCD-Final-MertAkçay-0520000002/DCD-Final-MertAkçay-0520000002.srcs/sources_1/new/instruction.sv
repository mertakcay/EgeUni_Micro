`timescale 1ns / 1ps


module instruction(input logic [7:0] A,output logic [15:0] RD);

reg [255:0] iM[15:0];

//assign A = 8'b00000000;
assign RD = iM[A];
//always @ (posedge clk)
//    A <= A+8'b00000001;

endmodule
