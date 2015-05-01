`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:20:49 04/27/2015
// Design Name:   super
// Module Name:   X:/EC551/Bitcoin/test_super.v
// Project Name:  Bitcoin
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: super
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_super;

	// Inputs
	reg clk;
	reg btnd;
	reg sw;

	// Outputs
	wire  hsync;
	wire vsync;
	wire [7:0]rgb;
	

	// Instantiate the Unit Under Test (UUT)
	super uut (
		.clk(clk), 
		.btnd(btnd), 
		.sw(sw), 
		.hsync(hsync), 
		.vsync(vsync), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		btnd = 1;
		sw = 0;

		forever
	begin
		#1; clk = ~clk; 
	end
     		
        
		// Add stimulus here

	end
      
endmodule
