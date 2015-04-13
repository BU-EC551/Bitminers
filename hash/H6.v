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
module H6(input Block, clk, input [31:0] f, output reg [31:0] H6_out );

reg source; 
initial
begin
H6_out = 32'h9b05688c;
end

always @ (posedge clk)
begin
	
	if (Block == 0)			
	begin
			H6_out = 32'h9b05688c;
			source =0;
		end
	else
		begin
		if(source ==0)
		begin
			H6_out = f + H6_out;
			source = ~source;
			end
		end
		
end

endmodule
