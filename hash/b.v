`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:48 03/23/2015 
// Design Name: 
// Module Name:    b 
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
module bcdfgh(clk,control,H1,data_in,data_out);
input control, clk;
input [31:0] H1, data_in;
output reg [31:0] data_out;
	
always @ (negedge clk)
	begin
		if (control == 1)				//we are initializing from the intermediate hash value
			data_out = H1;				//update value of a 
		else
			data_out = data_in;
	end
	

endmodule
