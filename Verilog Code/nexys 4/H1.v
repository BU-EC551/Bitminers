`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:26 04/07/2015 
// Design Name: 
// Module Name:    H1 
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
module H1(input [1:0] Block, input clk, nonce_sig, input [31:0] a, output reg [31:0] H1_out, H1);

reg source;			// 0 - read from initial values. 1 - read from intermediate
reg [31:0] inter;
initial
begin
H1_out = 32'h6a09e667;
H1= 32'h6a09e667;
end

always @ (posedge clk)
begin

	if (Block == 0 && nonce_sig ==0)		//initial block, reading default values
		begin
			H1_out <= 32'h6a09e667;
			H1<= 32'h6a09e667;
			source <=0;
		end
	else
		begin
		if(Block ==1 && source == 0)
		begin
			H1_out <= a + H1_out;
			H1<= a + H1_out;
			if (nonce_sig == 0)
				inter <= a + H1_out;
			source <= ~source;
		end
		else
		if(Block ==2 && source ==1)
				begin
					H1_out <=a+ H1_out;
					H1<= 32'h6a09e667;
					source <= ~source;
				end
			else
		if(Block ==3 && source ==0)
				begin
					H1_out <= a + H1;
					H1 <= inter;
					if(nonce_sig ==0)
					source <= ~source;
					else
					source <= 0;
				end
		end
		
end

endmodule
