`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:32 03/23/2015 
// Design Name: 
// Module Name:    T_1
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
module T_1(data_out,clk,h,S_1,ch,K,W);
output reg [31:0] data_out;
input clk;
input [31:0] h,S_1,ch,K,W;
	
always @ (posedge clk)
	begin
		data_out = h+S_1+ch+K+W;
	end
	

endmodule
