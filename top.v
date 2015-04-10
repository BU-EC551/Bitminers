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
module top(input clk, output [31:0] h1, h2, h3, h4, h5, h6, h7, h8, a_out, b_out, c_out, d_out, e_out, f_out, g_out, h_out 
    );
	 
reg block;
reg [5:0]select;
reg [1:0]input_select;		//selects which set of inputs to work on
reg regControl;		//high only when counter = 0, to input H values to a-h registers 
reg [31:0] msg_in[15:0];

initial 
begin
	select =0;
	block =0;
	regControl = 1;
	$readmemh("message1.txt",msg_in);
	input_select = 2'b00;
end

wire [31:0] k, w, major, choice, s1, s0, t1, t2;

	H1 h_1(block, a_out, h1);
	H2 h_2(block, b_out, h2);
	H3 h_3(block, c_out, h3);
	H4 h_4(block, d_out, h4);
	H5 h_5(block, e_out, h5);
	H6 h_6(block, f_out, h6);
	H7 h_7(block, g_out, h7);
	H8 h_8(block, h_out, h8);
	
	K k1(k,clk,select);
	W w1(clk, select, msg_in[select[3:0]], w);
	maj maj1(major, a_out, b_out, c_out, clk);
	ch ch1(choice,e_out,f_out, g_out,clk);
	S_1 s_1(s1, e_out, clk);
	S_0 s_0(s0, a_out, clk);
	T_1 t_1(t1,clk,h_out,s1,choice,k,w);
	T_2 t_2(t2,clk,s0,major);
	
	a a1(a_out,clk,regControl,h1,t1,t2); 
	bcdfgh b1(clk,regControl,h2,a_out,b_out);
	bcdfgh c1(clk,regControl,h3,b_out,c_out);
	bcdfgh d1(clk,regControl,h4,c_out,d_out);
	e e1(e_out,clk,regControl,h5,t1,d_out);
	bcdfgh f1(clk,regControl,h6,e_out,f_out);
	bcdfgh g1(clk,regControl,h7,f_out,g_out);
	bcdfgh h11(clk,regControl,h8,g_out,h_out);

	
	
always @(posedge clk)
begin
	if (input_select == 2) 
		begin
			select = select + 1'b1;
			input_select = 0;
		end
	else
		input_select = input_select + 1'b1;
	if(select == 0)
		begin
			regControl = 1;
		end
	else
		begin
			regControl = 0;	
		end
	if (select == 62)
	begin
			block = !block;
	end

end

endmodule
