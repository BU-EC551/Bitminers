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

module super(input clk, output vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B, temp);


reg print;
reg [1:0] block;
reg [6:0] select;
reg [31:0] message [31:0];
reg [31:0] message_out1, message_out2;
reg [31:0] message_out3, message_out4;
reg [31:0] nonce; 
reg [31:0] vga_input_message [0:31];
reg [31:0] vga_output_hash [15:0];
reg [3:0] vga_output_1;
reg [3:0] vga_output_2;
reg [3:0] vga_output_3;
reg [3:0] vga_output_4;


integer i;
wire [31:0] h1_1, h2_1, h3_1, h4_1, h5_1, h6_1, h7_1, h8_1;
wire [31:0] h1_2, h2_2, h3_2, h4_2, h5_2, h6_2, h7_2, h8_2;
wire [31:0] h1_3, h2_3, h3_3, h4_3, h5_3, h6_3, h7_3, h8_3;
wire [31:0] h1_4, h2_4, h3_4, h4_4, h5_4, h6_4, h7_4, h8_4;

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

initial
begin
	select = 7'b0000000;
	block = 2'b00;
	$readmemh("message2.bin",message);
	nonce = 0;
end

assign temp = h1_1[0] + h2_1[0] + h3_1[0] + h4_1[0] + h5_1[0] + h6_1[0] + h7_1[0] + h8_1[0] +
				  h1_2[0] + h2_2[0] + h3_2[0] + h4_2[0] + h5_2[0] + h6_2[0] + h7_2[0] + h8_2[0] +
				  h1_3[0] + h2_3[0] + h3_3[0] + h4_3[0] + h5_3[0] + h6_3[0] + h7_3[0] + h8_3[0] + 
				  h1_4[0] + h2_4[0] + h3_4[0] + h4_4[0] + h5_4[0] + h6_4[0] + h7_4[0] + h8_4[0];

clkdiv cl1(pixel_clk,clk);


always @ (posedge clk)
begin


		if (select == 65)
		begin
			select <= 0;
			block <= block + 1'b1;
		end
		else
		begin
			if(select ==0 && block ==3)
			begin
				select <=0;
				block <=0;
			end
			else
			select <= select + 1'b1;
		end
	
		if (nonce == 4)												//update vga input only when nonce = 0
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
							begin
								message_out1 <= message[select[3:0]];
								message_out2 <= message[select[3:0]];
								message_out3 <= message[select[3:0]];
								message_out4 <= message[select[3:0]];								
							end
							
						else if (block == 2'b01)
							begin
								if(select == 3)
									begin
										message_out1 <= nonce;
										message_out2 <= nonce + 1'b1;
										message_out3 <= nonce + 2'b10;
										message_out4 <= nonce + 2'b11;
									end
								else
									begin
										message_out1 <= message[select[3:0]+16];
										message_out2 <= message[select[3:0]+16];
										message_out3 <= message[select[3:0]+16];
										message_out4 <= message[select[3:0]+16];
									end
							end
							
						if (block == 2'b11 && select == 0)						//update nonce when block = 3
						begin
							nonce <= nonce + 3'b100;
							print <=1;
						end

						if ((block == 2'b00) && (select == 0) && (print ==1))						//at this point, done calculating the final double hash for nonce 0
							begin
								if (nonce == 4)
									begin
										vga_output_hash[15] <= h1_2;
										vga_output_hash[14] <= h2_2;
										vga_output_hash[13] <= h3_2;
										vga_output_hash[12] <= h4_2;
										vga_output_hash[11] <= h5_2;
										vga_output_hash[10] <= h6_2;
										vga_output_hash[9] <= h7_2;
										vga_output_hash[8] <= h8_2;
										vga_output_hash[7] <= h1_1;
										vga_output_hash[6] <= h2_1;
										vga_output_hash[5] <= h3_1;
										vga_output_hash[4] <= h4_1;
										vga_output_hash[3] <= h5_1;
										vga_output_hash[2] <= h6_1;
										vga_output_hash[1] <= h7_1;
										vga_output_hash[0] <= h8_1;	
										print<=0;
									end
							end

				
					
end	

always @ (posedge nonce[19])
begin
		vga_output_1 <= h1_1[31:28];
		vga_output_2 <= h2_1[31:28];
		vga_output_3 <= h1_2[31:28];
		vga_output_4 <= h2_2[31:28];
	
end
				




hash hash1(	.clk(clk),
				.block(block),
				.select(select),
				.msg_in(message_out1),
				.h1(h1_1), 
				.h2(h2_1), 
				.h3(h3_1), 
				.h4(h4_1), 
				.h5(h5_1), 
				.h6(h6_1), 
				.h7(h7_1), 
				.h8(h8_1) 
			 );
			 
hash hash2(	.clk(clk),
				.block(block),
				.select(select),
				.msg_in(message_out2),
				.h1(h1_2), 
				.h2(h2_2), 
				.h3(h3_2), 
				.h4(h4_2), 
				.h5(h5_2), 
				.h6(h6_2), 
				.h7(h7_2), 
				.h8(h8_2) 
			 );

hash hash3(	.clk(clk),
				.block(block),
				.select(select),
				.msg_in(message_out3),
				.h1(h1_3), 
				.h2(h2_3), 
				.h3(h3_3), 
				.h4(h4_3), 
				.h5(h5_3), 
				.h6(h6_3), 
				.h7(h7_3), 
				.h8(h8_3) 
			 );
			 
hash hash4(	.clk(clk),
				.block(block),
				.select(select),
				.msg_in(message_out4),
				.h1(h1_4), 
				.h2(h2_4), 
				.h3(h3_4), 
				.h4(h4_4), 
				.h5(h5_4), 
				.h6(h6_4), 
				.h7(h7_4), 
				.h8(h8_4) 
			 );			 







sync syncgen( .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY),.pixel_clk(pixel_clk));
 
vga v1(vga_R1, vga_G1, vga_B1, vga_output_1, offset1, inDisplayArea, CounterX, CounterY, pixel_clk);
vga v2(vga_R2, vga_G2, vga_B2, vga_output_2, offset2, inDisplayArea, CounterX, CounterY, pixel_clk);
vga v3(vga_R3, vga_G3, vga_B3, vga_output_3, offset3, inDisplayArea, CounterX, CounterY,pixel_clk);
vga v4(vga_R4, vga_G4, vga_B4, vga_output_4, offset4, inDisplayArea, CounterX, CounterY, pixel_clk);
endmodule
