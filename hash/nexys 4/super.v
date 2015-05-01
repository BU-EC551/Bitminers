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
module super(input clk, btnd, input [3:0] sw, output hsync,vsync, output [7:0]rgb);

//Hash Signals
reg [1:0] block;
reg [6:0] select;
reg [31:0] message [19:0];
reg [31:0] message_out1; 
reg [31:0] message_out2;
reg [31:0] message_out3; 
reg [31:0] message_out4;
reg [31:0] message_out5;
reg [31:0] message_out6;
reg [31:0] message_out7;
reg [31:0] message_out8;
reg [31:0] message_out9;
reg [31:0] message_out10;
wire[607:0] data_out; //32 bit data output from receiver
reg [31:0] K;
reg [31:0] nonce; 
wire rst;
reg nonce_sig;
integer i;
wire [255:0] h_out1,h_out2, h_out3, h_out4, h_out5, h_out6, h_out7, h_out8, h_out9, h_out10, target_wire;

//hash constant K parameters
localparam K00 = 32'h428a2f98;
localparam K01 = 32'h71374491;
localparam K02 = 32'hb5c0fbcf;
localparam K03 = 32'he9b5dba5;
localparam K04 = 32'h3956c25b;
localparam K05 = 32'h59f111f1;
localparam K06 = 32'h923f82a4;
localparam K07 = 32'hab1c5ed5;
localparam K08 = 32'hd807aa98;
localparam K09 = 32'h12835b01;
localparam K10 = 32'h243185be;
localparam K11 = 32'h550c7dc3;
localparam K12 = 32'h72be5d74;
localparam K13 = 32'h80deb1fe;
localparam K14 = 32'h9bdc06a7;
localparam K15 = 32'hc19bf174;
localparam K16 = 32'he49b69c1;
localparam K17 = 32'hefbe4786;
localparam K18 = 32'h0fc19dc6;
localparam K19 = 32'h240ca1cc;
localparam K20 = 32'h2de92c6f;
localparam K21 = 32'h4a7484aa;
localparam K22 = 32'h5cb0a9dc;
localparam K23 = 32'h76f988da;
localparam K24 = 32'h983e5152;
localparam K25 = 32'ha831c66d;
localparam K26 = 32'hb00327c8;
localparam K27 = 32'hbf597fc7;
localparam K28 = 32'hc6e00bf3;
localparam K29 = 32'hd5a79147;
localparam K30 = 32'h06ca6351;
localparam K31 = 32'h14292967;
localparam K32 = 32'h27b70a85;
localparam K33 = 32'h2e1b2138;
localparam K34 = 32'h4d2c6dfc;
localparam K35 = 32'h53380d13;
localparam K36 = 32'h650a7354;
localparam K37 = 32'h766a0abb;
localparam K38 = 32'h81c2c92e;
localparam K39 = 32'h92722c85;
localparam K40 = 32'ha2bfe8a1;
localparam K41 = 32'ha81a664b;
localparam K42 = 32'hc24b8b70;
localparam K43 = 32'hc76c51a3;
localparam K44 = 32'hd192e819;
localparam K45 = 32'hd6990624;
localparam K46 = 32'hf40e3585;
localparam K47 = 32'h106aa070;
localparam K48 = 32'h19a4c116;
localparam K49 = 32'h1e376c08;
localparam K50 = 32'h2748774c;
localparam K51 = 32'h34b0bcb5;
localparam K52 = 32'h391c0cb3;
localparam K53 = 32'h4ed8aa4a;
localparam K54 = 32'h5b9cca4f;
localparam K55 = 32'h682e6ff3;
localparam K56 = 32'h748f82ee;
localparam K57 = 32'h78a5636f;
localparam K58 = 32'h84c87814;
localparam K59 = 32'h8cc70208;
localparam K60 = 32'h90befffa;
localparam K61 = 32'ha4506ceb;
localparam K62 = 32'hbef9a3f7;
localparam K63 = 32'hc67178f2;

//// Transmitter signals
//wire done_flag; 						//full message ready
//wire message_flag; 					//when full 32 bits is ready this goes high, used to prevent incomplete assignment to message
////wire[6:0] R_count; 					//counter for placing 32 bit outputs in message
//reg transmit; 							//transmit==1 turns on transmitter, only needs to be held for 1 clk cycle and then 8 bits will be latched
//wire done; 								//transmitter done flag
////wire done_R; 							//receiver done flag set when full message array sent held until new byte seen by receiver

// VGA signals
reg [255:0] vga_output_hash;
wire [1023:0] vga_input_hash;
wire [10:0] x, y;
reg [17:0] count;
parameter countlim = 17'h20000;

assign vga_input_hash = {message[0],message[1],message[2],message[3],message[4],message[5],message[6],message[7],
	message[8],message[9],message[10],message[11],message[12],message[13],message[14],message[15],
	message[16],message[17],message[18],nonce,32'h80000000,32'h00000000,32'h00000000,32'h00000000,
	32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000280};
	



initial
begin
	select = 7'b0000000;
	block = 2'b00;
	nonce_sig = 1'b0;
	$readmemh("message2.bin",message);
	nonce = 0;	
end



debouncer db1(rst, clk, btnd);

always @ (posedge clk)
begin
	case ((select))
		0: K = K00;
		1: K = K01;
		2: K = K02;
		3: K = K03;
		4: K = K04;
		5: K = K05;
		6: K = K06;
		7: K = K07;
		8: K = K08;
		9: K = K09;
		10: K = K10;
		11: K = K11;
		12: K = K12;
		13: K = K13;
		14: K = K14;
		15: K = K15;
		16: K = K16;
		17: K = K17;
		18: K = K18;
		19: K = K19;
		20: K = K20;
		21: K = K21;
		22: K = K22;
		23: K = K23;
		24: K = K24;
		25: K = K25;
		26: K = K26;
		27: K = K27;
		28: K = K28;
		29: K = K29;
		30: K = K30;
		31: K = K31;
		32: K = K32;
		33: K = K33;
		34: K = K34;
		35: K = K35;
		36: K = K36;
		37: K = K37;
		38: K = K38;
		39: K = K39;
		40: K = K40;
		41: K = K41;
		42: K = K42;
		43: K = K43;
		44: K = K44;
		45: K = K45;
		46: K = K46;
		47: K = K47;
		48: K = K48;
		49: K = K49;
		50: K = K50;
		51: K = K51;
		52: K = K52;
		53: K = K53;
		54: K = K54;
		55: K = K55;
		56: K = K56;
		57: K = K57;
		58: K = K58;
		59: K = K59;
		60: K = K60;
		61: K = K61;
		62: K = K62;
		63: K = K63;
		default: K = K63;
	endcase	
end

always @ (posedge clk or posedge rst)
begin
	if(rst ==1)
		begin
			select <= 7'b0;
			block <= 2'b0;
		end
	else
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
					if(nonce_sig == 0)
							block <=0;
					else
							block<=1;
					select <=0;
				end
				else
				select <= select + 1'b1;
			end
		end	
end


always @ (posedge clk)
begin
	case ((select))
		0: K = K00;
		1: K = K01;
		2: K = K02;
		3: K = K03;
		4: K = K04;
		5: K = K05;
		6: K = K06;
		7: K = K07;
		8: K = K08;
		9: K = K09;
		10: K = K10;
		11: K = K11;
		12: K = K12;
		13: K = K13;
		14: K = K14;
		15: K = K15;
		16: K = K16;
		17: K = K17;
		18: K = K18;
		19: K = K19;
		20: K = K20;
		21: K = K21;
		22: K = K22;
		23: K = K23;
		24: K = K24;
		25: K = K25;
		26: K = K26;
		27: K = K27;
		28: K = K28;
		29: K = K29;
		30: K = K30;
		31: K = K31;
		32: K = K32;
		33: K = K33;
		34: K = K34;
		35: K = K35;
		36: K = K36;
		37: K = K37;
		38: K = K38;
		39: K = K39;
		40: K = K40;
		41: K = K41;
		42: K = K42;
		43: K = K43;
		44: K = K44;
		45: K = K45;
		46: K = K46;
		47: K = K47;
		48: K = K48;
		49: K = K49;
		50: K = K50;
		51: K = K51;
		52: K = K52;
		53: K = K53;
		54: K = K54;
		55: K = K55;
		56: K = K56;
		57: K = K57;
		58: K = K58;
		59: K = K59;
		60: K = K60;
		61: K = K61;
		62: K = K62;
		63: K = K63;
		default: K = K63;
	endcase	
end

always @ (negedge clk or posedge rst)
begin
		if(rst ==1)
		begin
			nonce<=0;
			nonce_sig <= 1'b0;
		end
		else
			begin
						if (block == 2'b00)
							begin
								message_out1 <= message[select[3:0]];
								message_out2 <= message[select[3:0]];
								message_out3 <= message[select[3:0]];
								message_out4 <= message[select[3:0]];
								message_out5 <= message[select[3:0]];
								message_out6 <= message[select[3:0]];
								message_out7 <= message[select[3:0]];
								message_out8 <= message[select[3:0]];
								message_out9 <= message[select[3:0]];
								message_out10 <= message[select[3:0]];
							end
							
						else if (block == 2'b01)
							begin
								if(select == 3)
									begin
										message_out1 <= nonce;
										message_out2 <= nonce + 1'b1;
										message_out3 <= nonce + 2'b10;
										message_out4 <= nonce + 2'b11;
										message_out5 <= nonce + 3'b100;
										message_out6 <= nonce + 3'b101;
										message_out7 <= nonce + 3'b110;
										message_out8 <= nonce + 3'b111;
										message_out9 <= nonce + 4'b1000;
										message_out10 <= nonce + 4'b1001;

									end
								else if( select == 0 || select == 1 || select == 2)
									begin
										message_out1 <= message[select[3:0]+16];
										message_out2 <= message[select[3:0]+16];
										message_out3 <= message[select[3:0]+16];
										message_out4 <= message[select[3:0]+16];
										message_out5 <= message[select[3:0]+16];
										message_out6 <= message[select[3:0]+16];
										message_out7 <= message[select[3:0]+16];
										message_out8 <= message[select[3:0]+16];
										message_out9 <= message[select[3:0]+16];
										message_out10 <= message[select[3:0]+16];

									end

								else if( select == 15)
									begin
										message_out1 <= 32'h00000280;
										message_out2 <= 32'h00000280;
										message_out3 <= 32'h00000280;
										message_out4 <= 32'h00000280;
										message_out5 <= 32'h00000280;
										message_out6 <= 32'h00000280;
										message_out7 <= 32'h00000280;
										message_out8 <= 32'h00000280;
										message_out9 <= 32'h00000280;
										message_out10 <= 32'h00000280;
										
									end
								else if( select == 4)
									begin
										message_out1 <= 32'h80000000;
										message_out2 <= 32'h80000000;
										message_out3 <= 32'h80000000;
										message_out4 <= 32'h80000000;
										message_out5 <= 32'h80000000;
										message_out6 <= 32'h80000000;
										message_out7 <= 32'h80000000;
										message_out8 <= 32'h80000000;
										message_out9 <= 32'h80000000;
										message_out10 <= 32'h80000000;
										
									end
								else
									begin
										message_out1 <= 32'h00000000;
										message_out2 <= 32'h00000000;
										message_out3 <= 32'h00000000;
										message_out4 <= 32'h00000000;
										message_out5 <= 32'h00000000;
										message_out6 <= 32'h00000000;
										message_out7 <= 32'h00000000;
										message_out8 <= 32'h00000000;
										message_out9 <= 32'h00000000;
										message_out10 <= 32'h00000000;
									
									end
							end
							
						if (block == 2'b11 && select == 0)						//update nonce when block = 3
						begin
							nonce_sig<=1;
							nonce <= nonce + 4'b1010;
						end

						if ((block == 2'b01) && (select == 0))						//at this point, done calculating the final double hash for nonce 0
							begin
								if (count == countlim)
									begin
										case(sw)
											0:vga_output_hash <= h_out1;
											1:vga_output_hash <= h_out2;
											2:vga_output_hash <= h_out3;
											3:vga_output_hash <= h_out4;
											4:vga_output_hash <= h_out5;
											5:vga_output_hash <= h_out6;
											6:vga_output_hash <= h_out7;
											7:vga_output_hash <= h_out8;
											9:vga_output_hash <= h_out9;
											10:vga_output_hash <= h_out10;
											default: vga_output_hash <=32'b0;
										endcase
								end
									count = count +1'b1;
									
								if(h_out1 < target_wire )
									message[19] <= nonce;
								else if(h_out2< target_wire )
											message[19] <= nonce+2'b01;
								else if(h_out3 < target_wire )
											message[19] <= nonce+2'b10;
								else if(h_out4 < target_wire )
									message[19] <= nonce+2'b11;
								else if(h_out5 < target_wire )
									message[19] <= nonce+3'b100;
								else if(h_out6 < target_wire )
									message[19] <= nonce+3'b101;
								else if(h_out7 < target_wire )
									message[19] <= nonce+3'b110;
								else if(h_out8 < target_wire )
									message[19] <= nonce+3'b110;
								else if(h_out9 < target_wire )
									message[19] <= nonce+4'b1000;
								else if(h_out10 < target_wire )
									message[19] <= nonce+4'b1001;
								
								else
									message[19] <= 0;
											
							end

		end
					
end	

		
//R3 mod4(clk,RxD,data_out,message_flag); //new code
//	
//transmitter mod2(message[19],clk,TxD,transmit,done); 




hash hash1(	.clk(clk),
				.rst(rst),	
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out1),
				.K(K),
				.hash_out(h_out1) 
			 );
			 
hash hash2(	.clk(clk),
				.rst(rst),
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out2),
				.K(K),
				.hash_out(h_out2)  
			 );

hash hash3(	.clk(clk),
				.rst(rst),
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out3),
				.K(K),
				.hash_out(h_out3) 
			 );

hash hash4(	.clk(clk),
				.rst(rst),	
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out4),
				.K(K),
				.hash_out(h_out4) 
			 );
			 
hash hash5(	.clk(clk),
				.rst(rst),
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out5),
				.K(K),
				.hash_out(h_out5)  
			 );

hash hash6(	.clk(clk),
				.rst(rst),
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out6),
				.K(K),
				.hash_out(h_out6) 
			 );


hash hash7(	.clk(clk),
				.rst(rst),	
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out7),
				.K(K),
				.hash_out(h_out7) 
			 );
			 
hash hash8(	.clk(clk),
				.rst(rst),
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out8),
				.K(K),
				.hash_out(h_out8)  
			 );

hash hash9(	.clk(clk),
				.rst(rst),
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out9),
				.K(K),
				.hash_out(h_out9) 
			 );			 
hash hash10(	.clk(clk),
				.rst(rst),
				.nonce_sig(nonce_sig),
				.block(block),
				.select(select),
				.msg_in(message_out10),
				.K(K),
				.hash_out(h_out10) 
			 );	

target target1(
					.target_in(message[18]),
					.target_out(target_wire)
					);

vga_sync v1(clk, hsync, vsync, x, y); 
	
graph g1(clk, vga_input_hash, vga_output_hash, x, y, rgb); 



endmodule
