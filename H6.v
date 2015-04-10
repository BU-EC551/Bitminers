`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:26 04/07/2015 
// Design Name: 
// Module Name:    H6 
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
module H6(input Block, input [31:0] f, output reg [31:0] H6_out );

reg source; 
initial
begin
	source = 1;
//	H2_out = 32'hbb67ae85;
end

always @ (Block)
begin
	source = ~source;
	if (source == 0)			begin
			H6_out = 32'h9b05688c;
		end
	else
		begin
			H6_out = f + H6_out;
		end
		
end

endmodule
