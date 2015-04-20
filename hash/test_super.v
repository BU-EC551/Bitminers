`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:24:48 04/17/2015
// Design Name:   super
// Module Name:   X:/ec551/bitminer/test_super.v
// Project Name:  bitminer
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

	// Outputs
	wire vga_h_sync;
	wire vga_v_sync;
	wire vga_R;
	wire vga_G;
	wire vga_B;
	wire temp;

	// Instantiate the Unit Under Test (UUT)
	super uut (
		.clk(clk), 
		.vga_h_sync(vga_h_sync), 
		.vga_v_sync(vga_v_sync), 
		.vga_R(vga_R), 
		.vga_G(vga_G), 
		.vga_B(vga_B),
		.temp(temp)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		forever
	begin
		#1; clk = ~clk; 
	end
     		
        
		// Add stimulus here

	end
      
endmodule

