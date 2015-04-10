`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:11:25 03/23/2015
// Design Name:   P_0
// Module Name:   X:/EC551/Bitcoin/P_0_test.v
// Project Name:  Bitcoin
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: P_0
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module P_0_test;

	// Inputs
	reg [31:0] x;
	reg clk;

	// Outputs
	wire [31:0] p0;

	// Instantiate the Unit Under Test (UUT)
	P_0 uut (
		.p0(p0), 
		.x(x), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		x = 32'b00000000000000001111111111111111;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

