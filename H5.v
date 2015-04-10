`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:26 04/07/2015 
// Design Name: 
// Module Name:    H5 
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
module H5(input Block, input [31:0] e, output reg [31:0] H5_out );

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
			H5_out = 32'h510e527f;
		end
	else
		begin
			H5_out = e + H5_out;
		end
		
end

endmodule
