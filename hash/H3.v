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
module H3(input Block, clk, input [31:0] c, output reg [31:0] H3_out );

reg source; 
initial
begin
	H3_out =32'h3c6ef372;
end

always @ (posedge clk)
begin
	
	if (Block == 0)			//initial block, reading default values
		begin
			H3_out = 32'h3c6ef372;
			source =0;
		end
	else
		begin
		if(source == 0)
			begin
			H3_out = c + H3_out;
			source = ~source;
			end
		end
		
end

endmodule
