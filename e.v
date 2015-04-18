`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:32 03/23/2015 
// Design Name: 
// Module Name:    e 
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
module e(data_out,clk,control,H5,t);
output reg [31:0] data_out;
input control, clk;
input [31:0] H5,t;
	
always @ (negedge clk)
	begin
		if (control == 1)				//we are initializing from the intermediate hash value
			data_out = H5;				//update value of a 
		else
			data_out = t;
	end
	

endmodule
