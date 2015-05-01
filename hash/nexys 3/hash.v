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
module hash( input clk, rst, nonce_sig, input [1:0]block, input [6:0]select, input [31:0] msg_in,K, output [255:0] hash_out);
	 

reg regControl;		//high only when counter = 0, to input H values to a-h registers 

wire[31:0]  a_out, b_out, c_out, d_out, e_out, f_out, g_out, h_out; // registers to store intermiate values
wire[31:0] h11, h12, h13, h14, h15, h16, h17, h18; //hash registers to load correct hash vales for a- h registers
reg [31:0] msg_hash; // message used for double hash
wire [31:0] h1, h2, h3, h4, h5, h6, h7, h8;// final hash regiters

initial 
begin
	regControl = 0;
end

wire [31:0] t1_out, t2_out;

	H1 h_1(block, clk, nonce_sig, a_out, h1, h11);
	H2 h_2(block, clk, nonce_sig,  b_out, h2, h12);
	H3 h_3(block, clk, nonce_sig,  c_out, h3, h13);  // modules to add hash after 64 cycles
	H4 h_4(block, clk, nonce_sig, d_out, h4, h14);
	H5 h_5(block, clk, nonce_sig, e_out, h5, h15);
	H6 h_6(block, clk, nonce_sig, f_out, h6, h16);
	H7 h_7(block, clk, nonce_sig, g_out, h7, h17);
	H8 h_8(block, clk, nonce_sig, h_out, h8, h18);
	

  iteration i1(a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out,K, h11, h12,     // converts 512 bit message to 256 bit hash 
  h13, h14, h15, h16, h17, h18,regControl, msg_in, msg_hash,block,select, clk);


assign hash_out = {h1,h2,h3,h4,h5,h6,h7,h8}; 


always @(posedge clk or posedge rst)
begin
if(rst == 1)
	begin
		regControl <=0;
	end
else
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
end

always @(negedge clk or posedge rst)
begin
if(rst ==1)
	begin
		msg_hash <=0;
	end
else
	begin
	if(block ==2)
		begin
		case(select[3:0])
		0: msg_hash <= a_out; //input for double hash computation
		1: msg_hash <= h2;
		2: msg_hash <= h3;
		3: msg_hash <= h4;
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
end

endmodule 