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
<<<<<<< HEAD
module H2(input [1:0] Block, input clk, input [31:0] b, output reg [31:0] H2_out, H2 );
=======
module H2(input [1:0]Block, input clk, input [31:0] b, output reg [31:0] H2_out, H2 );
>>>>>>> 642f66b6cf519c2c7ac7e2990da1dbc4da16c300

reg source; 
initial
begin
H2_out = 32'hbb67ae85;
H2 = 32'hbb67ae85;
end

always @ (posedge clk)
begin
	
	if (Block == 0)			//initial block, reading default values
		begin
			H2_out = 32'hbb67ae85;
			H2= 32'hbb67ae85;
			source =0;
		end
	else
		begin
		if(Block ==1 && source == 0)
			begin
			H2_out = b + H2_out;
			H2= 32'hbb67ae85;
			source = ~source;
			end
		else
		if(Block ==2 && source ==1)
				begin
					H2_out = b + H2_out;
					H2= 32'hbb67ae85;
					source = ~source;
				end
		end
		
end

endmodule


