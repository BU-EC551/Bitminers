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
module H5(input Block, clk, input [31:0] e, output reg [31:0] H5_out, H5 );

reg source; 
initial
begin
H5_out = 32'h510e527f;
H5 = 32'h510e527f;
end

always @ (posedge clk)
begin
	
	if (Block == 0)			
	begin
			H5_out = 32'h510e527f;
			H5 = 32'h510e527f;
			source =0;
		end
	else
		begin
		if(Block ==1 && source == 0)
		begin
			H5_out = e + H5_out;
			H5 = 32'h510e527f;
			source = ~source;
			end
				else
		if(Block ==2 && source ==1)
				begin
					H5_out = e + H5_out;
			H5 = 32'h510e527f;
			source = ~source;
				end
		end
		
end

endmodule
