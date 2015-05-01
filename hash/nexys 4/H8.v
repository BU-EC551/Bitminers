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
module H8(input [1:0] Block, input clk,nonce_sig, input [31:0] h, output reg [31:0] H8_out, H8 );


reg [31:0]inter;
reg source; 
initial
begin
H8_out = 32'h5be0cd19;
H8 = 32'h5be0cd19;
end

always @ (posedge clk)
begin
	
	if (Block == 0  && nonce_sig ==0)			
	begin
			H8_out <= 32'h5be0cd19;
			H8 <= 32'h5be0cd19;
			source <= 0;
		end
	else
		begin
		if(Block ==1 && source == 0)
		begin
			H8_out <= h + H8_out;
			H8 <= h + H8_out;
      if(nonce_sig ==0)
			inter <= h + H8_out;
			source <= ~source;
			end
				else
		if(Block ==2 && source ==1)
				begin
					H8_out <= h + H8_out;
			H8 <= 32'h5be0cd19;
			source <= ~source;
				end
						else
		if(Block ==3 && source ==0)
				begin
					H8_out <= h + H8;
					H8 <= inter;
					if(nonce_sig ==0)
					source <= ~source;
					else
					source <= 0;
				end
		end
		
end

endmodule
