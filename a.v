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
module a(data_out,clk,control,H1,T1,T2);
output reg [31:0] data_out;
input control, clk;
input [31:0] H1,T1,T2;
	
always @ (posedge clk)
	begin
		if (control == 1)				//we are initializing from the intermediate hash value when counter = 0
			data_out = H1;				//update value of a 
		else
			data_out = T1 + T2;
	end
	

endmodule
