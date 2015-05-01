module super(input mclk, btnd, input sw, 				//mclk = 100Mhz clock. btnd = button for reset. sw = switch for selecting output display
				 output hsync,vsync, output [7:0]rgb,	//vga signals
				 input RxD, output TxD);					//uart signals

// Hash signals
reg [1:0] block;												//2 blocks per double hash, which is the standard for bitcoin
reg [6:0] select;												//65 rounds per block
reg [31:0] K;													//K constant, which changes every round
reg [31:0] nonce, golden_nonce; 							//nonce = current input to try, golden_nonce is transmitted to UART if output < target
wire[607:0] data_out; 										//32 bit data output from receiver
wire rst;														//reset signal to set nonce and select to 0
reg nonce_sig;													//only nonce 0 is run for 3 blocks, every other nonce value runs for 2 blocks for double hash. goes high when nonce =/= 0
integer i;
wire [255:0] target_wire;									//current target, defined by the server
wire [255:0] h_out1;						 					//double hash outputs that we compare to the target
wire [255:0] h_out2; 
//wire [255:0] h_out3;
reg [31:0] message_out1;									//each message_out goes to a different hash module. message_out changes each round
reg [31:0] message_out2;
//reg [31:0] message_out3; 


// Hash constant K values
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


// Transmitter signals
wire message_flag; 											//when full 32 bits is ready this goes high, used to prevent incomplete assignment to message
reg transmit; 													//transmit==1 turns on transmitter, only needs to be held for 1 clk cycle and then 8 bits will be latched
wire done; 														//transmitter done flag


// VGA signals
reg [255:0] vga_output_hash;								//double hash output sent to VGA
wire [1023:0] vga_input_hash;								//1024 bit message input 
wire [10:0] x, y;
reg [17:0] count;												//counter that increments each cycle
parameter countlim = 17'h20000;							//if count == countlim, latch the current output hash value to vga_output_hash. this value is how often our output changes on the screen

assign vga_input_hash = {data_out[607:0],nonce,32'h80000000,32'h00000000,32'h00000000,32'h00000000,
	32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000000,32'h00000280};

initial
begin
	select = 7'b0000000;
	block = 2'b00;
	nonce = 0;
	nonce_sig = 1'b0;
	golden_nonce = 0;
end

always @ (posedge clk)										
begin
	case ((select))											//each message block in a hash runs for 64 rounds. Each round, a different K value is used.
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
	if(rst == 1)												//if we push reset button, set select and block to 0
		begin
			select <=7'b0;
			block <=2'b0;
		end
	else
		begin		
			if (select == 65)									//if select is at 65, we are done processing 64 rounds for a block. set select to 0 and start the next block
			begin
				select <= 0;
				block <= block + 1'b1;
			end
			else
			begin
				if(select ==0 && block ==3)				//else if we're on block 3, we are done with a double hash. 
				begin
					if(nonce_sig == 0)						//if nonce is 0, we have to do 3 blocks for a double hash, for all other nonces we only need 2 blocks 
							block <= 0;
					else
							block <= 1;
					select <=0;
				end
				else
				select <= select + 1'b1;					//if none of the above conditions are true, just increment select (we are inside the 64 rounds)
			end
		end	
end

always @ (negedge clk or posedge rst)					
begin
	if(rst ==1)													//if reset, set nonce back to 0
	begin
		nonce <=0;
		nonce_sig <= 1'b0;
	end
	else
		begin
			if (block == 2'b00)								//output a different message to the hash modules depending on what round we're on
				begin
					case (select[3:0])
						0:
						begin
							message_out1 <= data_out[607:576];
							message_out2 <= data_out[607:576];
//							message_out3 <= data_out[607:576];						
						end		
						1:
						begin
							message_out1 <= data_out[575:544];
							message_out2 <= data_out[575:544];
//							message_out3 <= data_out[575:544];						
						end		
						2:
						begin
							message_out1 <= data_out[543:512];
							message_out2 <= data_out[543:512];
//							message_out3 <= data_out[543:512];						
						end		
						3:
						begin
							message_out1 <= data_out[511:480];
							message_out2 <= data_out[511:480];
//							message_out3 <= data_out[511:480];						
						end		
						4:
						begin
							message_out1 <= data_out[479:448];
							message_out2 <= data_out[479:448];
//							message_out3 <= data_out[479:448];						
						end		
						5:
						begin
							message_out1 <= data_out[447:416];
							message_out2 <= data_out[447:416];
//							message_out3 <= data_out[447:416];						
						end		
						6:
						begin
							message_out1 <= data_out[415:384];
							message_out2 <= data_out[415:384];
//							message_out3 <= data_out[415:384];						
						end		
						7:
						begin
							message_out1 <= data_out[383:352];
							message_out2 <= data_out[383:352];
//							message_out3 <= data_out[383:352];						
						end		
						8:
						begin
							message_out1 <= data_out[351:320];
							message_out2 <= data_out[351:320];
//							message_out3 <= data_out[351:320];						
						end		
						9:
						begin
							message_out1 <= data_out[319:288];
							message_out2 <= data_out[319:288];
//							message_out3 <= data_out[319:288];						
						end		
						10:
						begin
							message_out1 <= data_out[287:256];
							message_out2 <= data_out[287:256];
//							message_out3 <= data_out[287:256];						
						end		
						11:
						begin
							message_out1 <= data_out[255:224];
							message_out2 <= data_out[255:224];
//							message_out3 <= data_out[255:224];						
						end		
						12:
						begin
							message_out1 <= data_out[223:192];
							message_out2 <= data_out[223:192];
//							message_out3 <= data_out[223:192];						
						end		
						13:
						begin
							message_out1 <= data_out[191:160];
							message_out2 <= data_out[191:160];
//							message_out3 <= data_out[191:160];						
						end		
						14:
						begin
							message_out1 <= data_out[159:128];
							message_out2 <= data_out[159:128];
//							message_out3 <= data_out[159:128];						
						end		
						15:
						begin
							message_out1 <= data_out[127:96];
							message_out2 <= data_out[127:96];
//							message_out3 <= data_out[127:96];						
						end		
					endcase
				end
				
			else if (block == 2'b01)						//for block 1, we only need 12 bytes from the server. the rest of the values are always the same
				begin
					if (select == 0)
					begin
						message_out1 <= data_out[95:64];
						message_out2 <= data_out[95:64];
//						message_out3 <= data_out[95:64];
					end
					else if (select == 1)
					begin
						message_out1 <= data_out[63:32];
						message_out2 <= data_out[63:32];
//						message_out3 <= data_out[63:32];
					end
					else if (select == 2)
					begin
						message_out1 <= data_out[31:0];
						message_out2 <= data_out[31:0];
//						message_out3 <= data_out[31:0];
					end					
					else if(select == 3)						//when block = 1, select = 3, we send the nonce value as a message to the hash module. 
					begin											//because the nonce value each hash module gets is different, the final hash output is completely different
						message_out1 <= nonce;
						message_out2 <= nonce + 1'b1;
//						message_out3 <= nonce + 2'b10;
					end					
					else if( select == 4)
					begin
						message_out1 <= 32'h80000000;
						message_out2 <= 32'h80000000;
//						message_out3 <= 32'h80000000;
					end
					else if( select == 15)
					begin
						message_out1 <= 32'h00000280;
						message_out2 <= 32'h00000280;
//						message_out3 <= 32'h00000280;
					end					
					else
					begin
						message_out1 <= 32'h00000000;
						message_out2 <= 32'h00000000;
//						message_out3 <= 32'h00000000;
					end
				end
				
			if (block == 2'b11 && select == 0)			//update nonce when block = 3
			begin
				nonce_sig <= 1;
				nonce <= nonce + 2'b10;
			end

			if (block == 2'b01 && select == 0)			//at this point, done calculating the final double hash
			begin
				if (count == countlim)						//if count = countlim, print output hash to vga
				begin
					case(sw)
						0:vga_output_hash <= h_out1;
						1:vga_output_hash <= h_out2;
					endcase
				end
				count = count +1'b1;
																	
				if(h_out1 < target_wire )					//if our hash output is less than target, we win! write nonce into golden nonce	
				begin
					golden_nonce <= nonce;
					if(done==1)
						transmit=1;								//and transmit golden nonce to the server
					else 
						transmit=0;
				end
				else if(h_out2 < target_wire )			//we are checking the output from every hash module at the same time
				begin
					golden_nonce <= nonce+2'b01;
					if(done==1)
						transmit=1;
					else 
						transmit=0;
				end
//				else if(h_out3 < target_wire )
//				begin
//					golden_nonce <= nonce+2'b10;
//					if(done==1)
//						transmit=1;
//					else 
//						transmit=0;
//				end
				else
					golden_nonce <= 0;						//if our output is not less than target, keep golden_nonce at 0		
			end
		end					
end



// Module Instantiations
clkdiv clk11(clk, mclk);									//clock divider to reduce clk to 50Mhz
R3 mod4(mclk,RxD,data_out,message_flag);				//receiver module
transmitter mod2(golden_nonce,mclk,TxD,transmit,done); //transmitter module
debouncer db1(rst, mclk, btnd);							//debouncer for reset button
vga_sync v1(mclk, hsync, vsync, x, y); 				//vga sync	
graph g1(mclk, vga_input_hash, vga_output_hash, x, y, rgb);		//vga output
target tar1(													//decompresses a 32 bit target from input message to full 256 bit target value
			.target_in(data_out[31:0]),
			.target_out(target_wire)
			);	
		


/*our hash modules. add more hash modules to increase parallelism/performance.  
clk, rst, nonce_sig, block, select, K are broadcasted to these modules
message_out and h_out are different for each hash module*/
 																	
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

//hash hash3(	.clk(clk),
//				.rst(rst),
//				.nonce_sig(nonce_sig),
//				.block(block),
//				.select(select),
//				.msg_in(message_out3),
//				.K(K),
//				.hash_out(h_out3) 
//			 );

endmodule
