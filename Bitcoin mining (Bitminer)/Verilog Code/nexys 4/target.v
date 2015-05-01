`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:44:24 04/22/2015 
// Design Name: 
// Module Name:    target 
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
module target(input [31:0] target_in, output reg [255:0] target_out);

reg [7:0] num_ending_zeroes; 
reg [23:0] significand;

always @ (*)
begin
	num_ending_zeroes = (target_in[31:24] - 2'b11) << 3;
	significand = target_in[23:0];
	target_out = significand << num_ending_zeroes;	
end

endmodule
