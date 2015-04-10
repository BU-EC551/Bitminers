`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:54:52 03/23/2015
// Design Name:   compression
// Module Name:   X:/EC551/Bitcoin/compression_test.v
// Project Name:  Bitcoin
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: compression
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module compression_test;

	// Inputs
	reg [31:0] x;
	reg [31:0] y;
	reg [31:0] z;
	reg [31:0] h;
	reg [31:0] W;
	reg clk;

	// Outputs
	wire [31:0] t1;
	wire [31:0] t2;
	wire [31:0] s1;
	wire [31:0] s0;
	wire [31:0] c;
	wire [31:0] m;
	wire [31:0] k;

	// Instantiate the Unit Under Test (UUT)
	compression uut (
		.t1(t1), 
		.t2(t2), 
		.s1(s1), 
		.s0(s0), 
		.c(c), 
		.m(m), 
		.x(x), 
		.y(y), 
		.z(z), 
		.h(h),  
		.W(W), 
		.clk(clk),
		.k(k)
	);

	initial begin
		// Initialize Inputs
			x = 32'h 0000ffff;
		y = 32'h 00ff000f;
		z = 32'h 8764ffff;
		h = 32'h 7624532f;
		W = 32'h 45638fff;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;x = 32'h 000fffff;
		#1
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;x = 32'h 00078fff;
		#1;
		clk = 1;
		#1
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1
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

