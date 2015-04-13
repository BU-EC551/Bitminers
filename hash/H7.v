`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:26 04/07/2015 
// Design Name: 
// Module Name:    H7 
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
module H7(input Block,clk, input [31:0] g, output reg [31:0] H7_out );

reg source; 
initial
begin
H7_out = 32'h1f83d9ab;
end

always @ (posedge clk)
begin
	
	if (Block == 0)			
	begin
			H7_out = 32'h1f83d9ab;
			source =0;
		end
	else
		begin
		if(source ==0)
		begin
			H7_out = g + H7_out;
			source = ~source;
			end
		end
		
end

endmodule
