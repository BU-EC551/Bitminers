`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:26 04/07/2015 
// Design Name: 
// Module Name:    H8 
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
module H8(input Block, input [31:0] h, output reg [31:0] H8_out );

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
			H8_out = 32'h5be0cd19;
		end
	else
		begin
			H8_out = h + H8_out;
		end
		
end

endmodule
