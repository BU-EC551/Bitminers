`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:32 03/23/2015 
// Design Name: 
// Module Name:    a 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module K(data_out,clk,select);
output reg [31:0] data_out;
input clk;
input [5:0] select;
reg [31:0] K_Reg[63:0];

initial
	begin
		 $readmemh("Kvalues.bin",K_Reg,0,63);
	end


always @ (posedge clk)
	begin
		data_out = K_Reg[select];
	end
	

endmodule
