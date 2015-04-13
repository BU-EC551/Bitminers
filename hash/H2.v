`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:26 04/07/2015 
// Design Name: 
// Module Name:    H2 
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
module H2(input Block, clk, input [31:0] b, output reg [31:0] H2_out );

reg source; 
initial
begin
H2_out = 32'hbb67ae85;
end

always @ (posedge clk)
begin
	
	if (Block == 0)			//initial block, reading default values
		begin
			H2_out = 32'hbb67ae85;
			source =0;
		end
	else
		begin
		if(source == 0)
			begin
			H2_out = b + H2_out;
			source = ~source;
			end
		end
		
end

endmodule


