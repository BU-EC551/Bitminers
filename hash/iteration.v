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
module iteration(a,b,c,d,e,f,g,h, h1, h2, h3, h4, h5, h6, h7, h8, control, message_in, message_hash, block, select, clk);

output reg [31:0]a,b,c,d,e,f,g,h;	
input [31:0] h1, h2, h3, h4, h5, h6, h7, h8, message_in, message_hash;
input [1:0]block;	
input [6:0] select;
input control, clk;
//reg [31:0] K[63:0];
reg [31:0] K;
reg [31:0] message_array [16:0];
reg [31:0] t1, t2;
integer i;

//initial
//begin
//$readmemh("Kvalues.bin",K,0,63);
//end 

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

always @ (posedge clk)
begin
	case ((select-1))
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

always @(posedge clk)
	begin
	 for(i = 0; i <16; i=i+1) begin
          message_array[i] = message_array[i+1];
       end 
	end

always @ (posedge clk)
	begin
		if (control == 1)				//we are initializing from the intermediate hash value when counter = 0
		begin
			h = h8;						//update value of a,b,c,d,e,f,g,h
			g = h7;
			f = h6;
			e = h5;
			d = h4;
			c = h3;
			b = h2;
			a = h1;
			end
		else
			begin
			h = g;						//update value of a,b,c,d,e,f,g,h
			g = f;
			f = e;
			e = t2;
			d = c;
			c = b;
			b = a;
			a = t1;
			end
	end

always @(posedge clk)
begin


if (select < 16)
		begin
		if(block ==2)
		message_array[16] = message_hash;
		else
		message_array[16] = message_in;
		end
	else 	
		begin
			message_array[16] = (({message_array[14][16:0],message_array[14][31:17]}) ^ ({message_array[14][18:0], message_array[14][31:19]})^(message_array[14]>>10)) + message_array[9] + (({message_array[1][6:0], message_array[1][31:7]})^({message_array[1][17:0], message_array[1][31:18]})^(message_array[1]>>3)) + message_array[0] ;;
		end

//t1=h+(({e[5:0], e[31:6]})^({e[10:0], e[31:11]})^({e[24:0], e[31:25]}))+((e&f)^((~e)&g))+K[select-1]+ message_array[15];
t1=h+(({e[5:0], e[31:6]})^({e[10:0], e[31:11]})^({e[24:0], e[31:25]}))+((e&f)^((~e)&g))+ K + message_array[15] + (({a[1:0], a[31:2]})^({a[12:0], a[31:13]})^({a[21:0], a[31:22]}))+((a&b)^(a&c)^(b&c));;
t2=h+(({e[5:0], e[31:6]})^({e[10:0], e[31:11]})^({e[24:0], e[31:25]}))+((e&f)^((~e)&g))+ K + message_array[15] +d;
      
end



endmodule

