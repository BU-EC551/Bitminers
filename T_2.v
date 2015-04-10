`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:32 03/23/2015 
// Design Name: 
// Module Name:    T_2
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
module T_2(data_out,clk,S_0,maj);
output reg [31:0] data_out;
input clk;
input [31:0] S_0,maj;
	
always @ (posedge clk)
	begin
		data_out = S_0+maj;
	end
	

endmodule
