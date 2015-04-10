`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:53 03/23/2015 
// Design Name: 
// Module Name:    iteration 
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
module iteration(t1_out, t2_out, a,b,c,d,e,f,g,h,W,clk );
output [31:0] reg t1_out, t2_out;	
input [31:0] a,b,c,d,e,f,g,h, W;	
input clk;
input [5:0] select;
reg [31:0] K[63:0];

wire [31:0]t1,t2;

initial
begin
$readmemh("Kvalues.bin",K,0,63);
end

	

always @(posedge clk)
begin
t1=h+({e[5:0], e[31:6]})^({e[10:0], e[31:11]})^({e[24:0], e[31:25]})+(e&f)^((~e)&g)+K[select]+W;
t2=({a[1:0], a[31:2]})^({a[12:0], a[31:13]})^({a[21:0], a[31:22]})+(a&b)^(a&c)^(b&c);
t1_out = t1+t2;
t2_out = d+t2;
end


endmodule

