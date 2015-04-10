`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:02:59 03/23/2015
// Design Name:   maj
// Module Name:   X:/EC551/Bitcoin/maj_test.v
// Project Name:  Bitcoin
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: maj
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module maj_test;

	// Inputs
	reg [31:0] x;
	reg [31:0] y;
	reg [31:0] z;
	reg clk;

	// Outputs
	wire [31:0] m;

	// Instantiate the Unit Under Test (UUT)
	maj uut (
		.m(m), 
		.x(x), 
		.y(y), 
		.z(z), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		x = 32'b00000000000000001111111111111111;
		y = 32'b00000000111111110000000011111111;
		z = 32'b00110011001100110101010101010101;
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

