`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:12:22 03/23/2015
// Design Name:   K
// Module Name:   X:/EC551/Bitcoin/k_test.v
// Project Name:  Bitcoin
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: K
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module k_test;
	reg [5:0] i;
	// Inputs
	reg clk;
	reg [5:0] select;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	K uut (
		.data_out(data_out),
		.clk(clk), 
		.select(select)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		select = 0;
		for(i=0; i<64; i =i+1'b1)
		begin
		#1
		 clk = ~clk;
		select = select + 1'b1;
		end

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

