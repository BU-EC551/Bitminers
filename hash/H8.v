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
module H8(input Block, clk, input [31:0] h, output reg [31:0] H8_out );

reg source; 
initial
begin
H8_out = 32'h5be0cd19;
end

always @ (posedge clk)
begin
	
	if (Block == 0)			
	begin
			H8_out = 32'h5be0cd19;
			source = 0;
		end
	else
		begin
		if(source ==0)
		begin
			H8_out = h + H8_out;
			source = ~source;
			end
		end
		
end

endmodule
