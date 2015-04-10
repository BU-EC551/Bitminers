`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:53 03/23/2015 
// Design Name: 
// Module Name:    compression 
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
module compression(t1, t2, s1, s0, k, c, m, x, y, z, h, W, clk );
output [31:0] t1, t2, s1, s0, c, m, k;	
input wire [31:0] x, y, z, h, W;	
input clk;
reg [5:0] select;

initial
select = 0;

always @(posedge clk)
begin
select = select + 1'b1;
end

	K k1(k,clk,select);

	maj maj1(m, x, y, z, clk);
	ch ch1(c,x,y, z,clk);
	S_1 s_1(s1, x, clk);
	S_0 s_0(s0, x, clk);
	T_1 t_1(t1,clk,h,s1,c,k,W);
	T_2 t_2(t2,clk,s0,m);
	


endmodule
