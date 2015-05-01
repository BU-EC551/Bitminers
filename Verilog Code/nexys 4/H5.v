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
module H5(input [1:0] Block, input clk, nonce_sig, input [31:0] e, output reg [31:0] H5_out, H5 );

reg [31:0] inter;
reg source; 
initial
begin
H5_out = 32'h510e527f;
H5 = 32'h510e527f;
end

always @ (posedge clk)
begin
	
	if (Block == 0  && nonce_sig ==0)			
	begin
			H5_out <=32'h510e527f;
			H5 <=32'h510e527f;
			source <=0;
		end
	else
		begin
		if(Block ==1 && source == 0)
		begin
			H5_out <=e + H5_out;
			H5 <=e + H5_out;
			if(nonce_sig ==0)
			inter <= e+ H5_out;

			source <=~source;
			end
				else
		if(Block ==2 && source ==1)
				begin
					H5_out <=e + H5_out;
			H5 <=32'h510e527f;
			source <=~source;
				end
				if(Block ==3 && source ==0)
				begin
					H5_out <=e + H5;
					H5 <= inter;
					if(nonce_sig ==0)
					source <= ~source;
					else
					source <= 0;
				end
		end
		
end

endmodule
