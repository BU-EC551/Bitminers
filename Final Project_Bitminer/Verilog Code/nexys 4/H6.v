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
module H6(input [1:0] Block, input clk, nonce_sig, input [31:0] f, output reg [31:0] H6_out, H6 );

reg [31:0] inter;
reg source; 
initial
begin
H6_out = 32'h9b05688c;
H6= 32'h9b05688c;
end

always @ (posedge clk)
begin
	
	if (Block == 0  && nonce_sig ==0)			
	begin
			H6_out <= 32'h9b05688c;
			H6<= 32'h9b05688c;
			source <=0;
		end
	else
		begin
		if(Block ==1 && source == 0)
		begin
			H6_out <= f + H6_out;
			H6<= f + H6_out;
      if(nonce_sig ==0)
      inter <= f + H6_out;
      
			source <= ~source;
			end
				else
		if(Block ==2 && source ==1)
				begin
					H6_out <= f + H6_out;
					H6<= 32'h9b05688c;
					source <= ~source;
				end
			if(Block ==3 && source ==0)
				begin
					H6_out <= f + H6;
					H6 <= inter;
					if(nonce_sig ==0)
					source <= ~source;
					else
					source <= 0;
				end
		end
		
end

endmodule
