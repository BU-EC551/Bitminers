`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:36:17 03/23/2015
// Design Name:   a
// Module Name:   X:/EC551/Bitcoin/a_test.v
// Project Name:  Bitcoin
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: a
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module a_test;

	// Inputs
	reg clk;
	reg control;
	reg [31:0] H1;
	reg [31:0] T1;
	reg [31:0] T2;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	a uut (
		.clk(clk), 
		.control(control), 
		.H1(H1), 
		.T1(T1), 
		.T2(T2), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		control = 0;
		H1 = 32'h01234567;
		T1 = 32'h0000FFFF;
		T2 = 32'hF0F50000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		T1 = 32'h00FF0000;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		control = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
	end
      
endmodule

