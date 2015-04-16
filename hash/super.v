`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:37 04/15/2015 
// Design Name: 
// Module Name:    super 
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
module super(input clk, tx, output [31:0] h1, h2, h3, h4, h5, h6, h7, h8);

reg [1:0]block;
reg [6:0]select;
reg [31:0] message [31:0];
reg [31:0] message_out;
reg [31:0] nonce;
reg [31:0] vga_input_message [31:0];
reg [31:0] vga_output_hash [7:0];
integer i;

initial
begin
	select = 7'b0000000;
	block = 2'b00;
	$readmemh("message.txt",message);
	nonce = 0;
end

always @ (posedge clk)
begin
	if (select == 64)
	begin
	select <= 0;		
	block <= block +1'b1;
	end
	else
	select <= select + 1'b1;
	message[19] <= nonce;
	
	if (nonce == 0)												//update vga input only when nonce = 0
		begin
			for(i = 0; i <32; i=i+1) 
				begin
					vga_input_message[i] <= message[i]; 
				end
		end
end

always @ (negedge clk)
begin
	if (block == 2'b00)
		message_out = message[select[3:0]];
	else if (block == 2'b01)
		message_out = message[select[3:0]+16];
//	else
//		message_out = message[{0,select[3:0]}];
	if (block == 2'b10 && select == 64)						//at this point, done calculating the final hash for nonce 0
		begin
			if (nonce == 0)
				begin
					vga_output_hash[7] <= h1;
					vga_output_hash[6] <= h2;
					vga_output_hash[5] <= h3;
					vga_output_hash[4] <= h4;
					vga_output_hash[3] <= h5;
					vga_output_hash[2] <= h6;
					vga_output_hash[1] <= h7;
					vga_output_hash[0] <= h8;				
				end
		end
		
	if (block == 2'b11 && select == 0)						//update nonce when block = 3
		nonce <= nonce + 1'b1;
 
end	

	




hash hash1(	.clk(clk),
				.block(block),
				.select(select),
				.msg_in(message_out),
				.h1(h1), 
				.h2(h2), 
				.h3(h3), 
				.h4(h4), 
				.h5(h5), 
				.h6(h6), 
				.h7(h7), 
				.h8(h8) 
			 );
endmodule
