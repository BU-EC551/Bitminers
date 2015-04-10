`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:52:08 03/23/2015
// Design Name:   ch
// Module Name:   X:/EC551/Bitcoin/ch_test.v
// Project Name:  Bitcoin
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ch_test;

	// Inputs
	reg [31:0] x;
	reg [31:0] y;
	reg [31:0] z;
	reg clk;

	// Outputs
	wire [31:0] c;

	// Instantiate the Unit Under Test (UUT)
	ch uut (
		.c(c), 
		.x(x), 
		.y(y), 
		.z(z), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		x = 32'b00000000000000001111111111111111;
		y = 32'b00011100011100101010100101110010;
		z = 32'b11100011100011010101011011110010;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		// Add stimulus here

	end
      
endmodule

