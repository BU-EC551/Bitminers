`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:02 04/01/2015 
// Design Name: 
// Module Name:    terminal 
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
module terminal(
	input wire clk,
	input wire [1023:0] inhash,
	input wire [255:0] outhash,
	output wire hsync, vsync,
	output wire [7:0] rgb

    );
	 
	
//	wire push;
	wire [10:0] x, y;
	
		
	vga_sync v1(clk, hsync, vsync, x, y); // 25MHZ
		
	graph g1(clk, inhash, outhash, x, y, rgb); // 100MHZ / 25MHZ

endmodule
