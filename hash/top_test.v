`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:30:29 04/07/2015
// Design Name:   top
// Module Name:   X:/EC551/Bitcoin/top_test.v
// Project Name:  Bitcoin
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_test;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] h1;
	wire [31:0] h2;
	wire [31:0] h3;
	wire [31:0] h4;
	wire [31:0] h5;
	wire [31:0] h6;
	wire [31:0] h7;
	wire [31:0] h8;
	wire [31:0] a_out;
	wire [31:0] b_out;
	wire [31:0] c_out;
	wire [31:0] d_out;
	wire [31:0] e_out;
	wire [31:0] f_out;
	wire [31:0] g_out;
	wire [31:0] h_out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.h1(h1), 
		.h2(h2), 
		.h3(h3), 
		.h4(h4), 
		.h5(h5), 
		.h6(h6), 
		.h7(h7), 
		.h8(h8), 
		.a_out(a_out), 
		.b_out(b_out), 
		.c_out(c_out), 
		.d_out(d_out), 
		.e_out(e_out), 
		.f_out(f_out), 
		.g_out(g_out), 
		.h_out(h_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
forever
	begin
		#1; clk = ~clk; 
	end
     		
		// Add stimulus here

	end
	

 
endmodule

