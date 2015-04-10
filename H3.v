`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:26 04/07/2015 
// Design Name: 
// Module Name:    H3 
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
module H3(input Block, input [31:0] c, output reg [31:0] H3_out );

reg source; 
initial
begin
	source = 1;
//	H2_out = 32'hbb67ae85;
end

always @ (Block)
begin
	source = ~source;
	if (source == 0)			//initial block, reading default values
		begin
			H3_out = 32'h3c6ef372;
		end
	else
		begin
			H3_out = c + H3_out;
		end
		
end

endmodule
