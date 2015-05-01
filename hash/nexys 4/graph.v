`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:30 04/17/2015 
// Design Name: 
// Module Name:    graph 
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
module graph(input wire  clk,// push,//reset,
	input wire [1023:0] inhash,
	input wire [255:0] outhash,	
   input wire  [10:0] x, y,
	output wire [7:0] rgb
    );
	

	reg [2:0] bgx;
	reg [3:0] bgy;
	reg [7:0] rgb_now;
	reg [6:0] col;
	reg [4:0] row;
	wire [7:0] index;
	wire [7:0] rgb_screen;
	
	
	localparam font_color = 8'b11111111;
	localparam bg_color = 8'b01001011;
	
	initial begin
		rgb_now = 8'b01001011;
		bgx = 0;
		bgy = 0;
	end
	


	always @ (posedge clk) begin
	
		bgx = x[2:0];
		bgy = y[3:0];	
		
		// inside the screen
		if (x >= 0 && y >= 0 && x < 640 && y < 480) begin
					case (bgx)
					7: rgb_now = rgb_screen[0:0]? font_color : 8'b01001011; //bg_color;
					6: rgb_now = rgb_screen[1:1]? font_color : 8'b01001011; //bg_color;
					5: rgb_now = rgb_screen[2:2]? font_color : 8'b01001011; //bg_color;
					4: rgb_now = rgb_screen[3:3]? font_color : 8'b01001011; //bg_color;
					3: rgb_now = rgb_screen[4:4]? font_color : 8'b01001011; //bg_color;
					2: rgb_now = rgb_screen[5:5]? font_color : 8'b01001011; //bg_color;
					1: rgb_now = rgb_screen[6:6]? font_color : 8'b01001011; //bg_color;
					0: rgb_now = rgb_screen[7:7]? font_color : 8'b01001011; //bg_color;
							//default : rgb_now = 8'b01001011;
					endcase						
		end
		// outside the screen
		else rgb_now = 8'b01001011;
	end
	
	
	
	
	char_mem c1(index, bgy, rgb_screen);
	
	screen_mem r1(clk, x[9:3], y[8:4], inhash, outhash, index);

	assign rgb = rgb_now;

	
endmodule