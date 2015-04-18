`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:25:33 04/07/2015 
// Design Name: 
// Module Name:    hash
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
module hash( input clk, input [1:0]block, input [6:0]select, input [31:0] msg_in, output [31:0] h1, h2, h3, h4, h5, h6, h7, h8);
	 

reg regControl;		//high only when counter = 0, to input H values to a-h registers 

wire[31:0]  a_out, b_out, c_out, d_out, e_out, f_out, g_out, h_out;
wire[31:0] h11, h12, h13, h14, h15, h16, h17, h18;
reg [31:0]msg_hash;

initial 
begin
	regControl = 0;
end

wire [31:0] t1_out, t2_out;

	H1 h_1(block, clk, a_out, h1 , h11);
	H2 h_2(block, clk, b_out, h2, h12);
	H3 h_3(block, clk, c_out, h3, h13);
	H4 h_4(block, clk, d_out, h4, h14);
	H5 h_5(block, clk, e_out, h5, h15);
	H6 h_6(block, clk, f_out, h6, h16);
	H7 h_7(block, clk, g_out, h7, h17);
	H8 h_8(block, clk, h_out, h8, h18);
	
   iteration i1(t1_out, t2_out, a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out, msg_in, msg_hash,block,select, clk);
	
	a a1(clk,a_out,regControl,h11,t1_out); 
	bcdfgh b1(clk,regControl,h12,a_out,b_out);
	bcdfgh c1(clk,regControl,h13,b_out,c_out);
	bcdfgh d1(clk,regControl,h14,c_out,d_out);
	e e1(e_out,clk,regControl,h15,t2_out);
	bcdfgh f1(clk,regControl,h16,e_out,f_out);
	bcdfgh g1(clk,regControl,h17,f_out,g_out);
	bcdfgh h(clk,regControl,h18,g_out,h_out);

	
	
always @(posedge clk)
begin

	if(select == 0)
		begin
			regControl <= 1;
			
		end
	else
		begin
			regControl <= 0;	
		end
end

always @(negedge clk)
begin
if(block ==2)
	begin
	case(select[3:0])
	0: msg_hash <= h1+ t1_out;
	1: msg_hash <= h2;
	2: msg_hash <= h3;
	3: msg_hash<= h4;
	4: msg_hash <= h5;
	5: msg_hash <= h6;
	6: msg_hash <= h7;
	7: msg_hash <= h8;
	8: msg_hash <= 32'h80000000;
	9: msg_hash <= 32'b0;
	10: msg_hash <= 32'b0;
	11: msg_hash <= 32'b0;
	12: msg_hash <= 32'b0;
	13: msg_hash <= 32'b0;
	14: msg_hash <= 32'b0;
	15: msg_hash <= 32'h00000100;
	endcase
	end 

end

endmodule 