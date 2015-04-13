`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:25:33 04/07/2015 
// Design Name: 
// Module Name:    top 
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
module top(input clk, output [31:0] h1);
	 
reg block;
reg [6:0]select;
reg input_select;		//selects which set of inputs to work on
reg regControl;		//high only when counter = 0, to input H values to a-h registers 
reg [31:0] msg_in[15:0];
wire[31:0]  a_out, b_out, c_out, d_out, e_out, f_out, g_out, h_out , h2, h3, h4, h5, h6, h7, h8;

initial 
begin
	select =0;
	block =0;
	regControl = 0;
	$readmemh("message1.txt",msg_in);
	input_select = 1'b0;
end

wire [31:0] t1_out, t2_out;

	H1 h_1(block, clk, a_out, h1);
	H2 h_2(block, clk, b_out, h2);
	H3 h_3(block, clk, c_out, h3);
	H4 h_4(block, clk, d_out, h4);
	H5 h_5(block, clk, e_out, h5);
	H6 h_6(block, clk, f_out, h6);
	H7 h_7(block, clk, g_out, h7);
	H8 h_8(block, clk, h_out, h8); 
	
   iteration i1(t1_out, t2_out, a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out,msg_in[select[3:0]],select, clk);
	
	a a1(clk,a_out,regControl,h1,t1_out); 
	bcdfgh b1(clk,regControl,h2,a_out,b_out);
	bcdfgh c1(clk,regControl,h3,b_out,c_out);
	bcdfgh d1(clk,regControl,h4,c_out,d_out);
	e e1(e_out,clk,regControl,h5,t2_out);
	bcdfgh f1(clk,regControl,h6,e_out,f_out);
	bcdfgh g1(clk,regControl,h7,f_out,g_out);
	bcdfgh h11(clk,regControl,h8,g_out,h_out);

	
	
always @(posedge clk)
begin

	if(select == 0)
		begin
			regControl = 1;
			
		end
	else
		begin
			regControl = 0;	
		end

	if (select == 64)
	begin
	select = 0;		
	block = block +1'b1;
	end
	else
	select = select + 1'b1;

	
	input_select = input_select + 1'b1; 
end

endmodule
