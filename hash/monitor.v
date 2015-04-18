`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:42 03/02/2015 
// Design Name: 
// Module Name:    monitor 
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
module monitor(output vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B,input [15:0]num,input clk);
	 

wire pixel_clk;	
parameter [9:0]offset1 = 0;
parameter [9:0]offset2 = 100; 
parameter [9:0]offset3 = 200; 
parameter [9:0]offset4 = 300;
wire vga_R1, vga_G1, vga_B1, vga_R2, vga_G2, vga_B2, vga_R3, vga_G3, vga_B3, vga_R4, vga_G4, vga_B4;
wire inDisplayArea;
wire [9:0] CounterX;
wire [8:0] CounterY;

assign vga_R= vga_R1 || vga_R2 || vga_R3 || vga_R4;
assign vga_B= vga_B1 || vga_B2 || vga_B3 || vga_B4;
assign vga_G= vga_G1 || vga_G2 || vga_G3 || vga_G4;





clk_div cl1(pixel_clk,clk);
sync syncgen( .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY),.pixel_clk(pixel_clk));
 
vga v1(vga_R1, vga_G1, vga_B1, num[15:12], offset1, inDisplayArea, CounterX, CounterY, pixel_clk);
vga v2(vga_R2, vga_G2, vga_B2, num[11:8], offset2, inDisplayArea, CounterX, CounterY, pixel_clk);
vga v3(vga_R3, vga_G3, vga_B3, num[7:4], offset3, inDisplayArea, CounterX, CounterY,pixel_clk);
vga v4(vga_R4, vga_G4, vga_B4, num[3:0], offset4, inDisplayArea, CounterX, CounterY, pixel_clk);
endmodule 