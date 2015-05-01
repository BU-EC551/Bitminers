`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:29:54 04/29/2015 
// Design Name: 
// Module Name:    receiver 
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
module R3(input clk, input RxD,output reg [607:0] data_out,output reg message_flag);
reg [6:0] count;
//reg[31:0] temp;
wire idle,EoP;
wire[7:0] output_byte;

initial begin
data_out = 608'h6162636462636465636465666465666765666768666768696768696A68696A6B696A6B6C6A6B6C6D6B6C6D6E6C6D6E6F6D6E6F706E6F70718000000000000000000000000000000000000000;
count=7'b1111111;
end
async_receiver mod0 (clk,RxD,byte_good,output_byte);
always@(posedge clk)
begin
	if(byte_good==1)
	begin
		count=count+1'b1;
		case(count)
		0: data_out[607:600]=output_byte;
		1: data_out[599:592]=output_byte;
		2: data_out[591:584]=output_byte;
		3: data_out[583:576]=output_byte;
		4: data_out[575:568]=output_byte;
		5: data_out[567:560]=output_byte;
		6: data_out[559:552]=output_byte;
		7: data_out[551:544]=output_byte;
		8: data_out[543:536]=output_byte;
		9: data_out[535:528]=output_byte;
		10: data_out[527:520]=output_byte;
		11: data_out[519:512]=output_byte;
		12: data_out[511:504]=output_byte;
		13: data_out[503:496]=output_byte;
		14: data_out[495:488]=output_byte;
		15: data_out[487:480]=output_byte;
		16: data_out[479:472]=output_byte;
		17: data_out[471:464]=output_byte;
		18: data_out[463:456]=output_byte;
		19: data_out[455:448]=output_byte;		
		20: data_out[447:440]=output_byte;
		21: data_out[439:432]=output_byte;
		22: data_out[431:424]=output_byte;
		23: data_out[423:416]=output_byte;
		24: data_out[415:408]=output_byte;
		25: data_out[407:400]=output_byte;
		26: data_out[399:392]=output_byte;
		27: data_out[391:384]=output_byte;
		28: data_out[383:376]=output_byte;
		29: data_out[375:368]=output_byte;
		30: data_out[367:360]=output_byte;
		31: data_out[359:352]=output_byte;
		32: data_out[351:344]=output_byte;
		33: data_out[343:336]=output_byte;
		34: data_out[335:328]=output_byte;
		35: data_out[327:320]=output_byte;
		36: data_out[319:312]=output_byte;
		37: data_out[311:304]=output_byte;
		38: data_out[303:296]=output_byte;
		39: data_out[295:288]=output_byte;			
		40: data_out[287:280]=output_byte;
		41: data_out[279:272]=output_byte;
		42: data_out[271:264]=output_byte;
		43: data_out[263:256]=output_byte;
		44: data_out[255:248]=output_byte;
		45: data_out[247:240]=output_byte;
		46: data_out[239:232]=output_byte;
		47: data_out[231:224]=output_byte;
		48: data_out[223:216]=output_byte;
		49: data_out[215:208]=output_byte;
		50: data_out[207:200]=output_byte;
		51: data_out[199:192]=output_byte;
		52: data_out[191:184]=output_byte;
		53: data_out[183:176]=output_byte;
		54: data_out[175:168]=output_byte;
		55: data_out[167:160]=output_byte;
		56: data_out[159:152]=output_byte;
		57: data_out[151:144]=output_byte;
		58: data_out[143:136]=output_byte;
		59: data_out[135:128]=output_byte;		
		60: data_out[127:120]=output_byte;
		61: data_out[119:112]=output_byte;
		62: data_out[111:104]=output_byte;
		63: data_out[103:96]=output_byte;
		64: data_out[95:88]=output_byte;
		65: data_out[87:80]=output_byte;
		66: data_out[79:72]=output_byte;
		67: data_out[71:64]=output_byte;
		68: data_out[63:56]=output_byte;
		69: data_out[55:48]=output_byte;
		70: data_out[47:40]=output_byte;
		71: data_out[39:32]=output_byte;
		72: data_out[31:24]=output_byte;
		73: data_out[23:16]=output_byte;
		74: data_out[15:8]=output_byte;
		75:data_out[7:0]=output_byte;
		76:begin 
		message_flag=1'b1;
		count=7'b1111111;
		end
		endcase
	end
end
endmodule
