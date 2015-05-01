`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:40:04 04/29/2015 
// Design Name: 
// Module Name:    transmitter 
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
module transmitter(input [31:0] data_in, input clk, output data_out,input transmit,output reg done);
wire busy,ready;
reg [2:0] count;


reg[7:0] data_input;
async_transmitter mod0 (clk,transmit,data_input,data_out,busy,ready);


initial begin
count=3'b101;
end

always@(posedge clk)
begin
if(transmit&&count==3'b101)
count=3'b111;
	if(transmit&&(count<3||count==3'b111)&&ready);
	count=count+1'b1;
	begin
		case(count)
		0: data_input=data_in[31:24];
		1: data_input=data_in[23:16];
		2: data_input=data_in[15:8];
		3: 
		begin
			data_input=data_in[7:0];
			count=3'b101; //set this so it does nothing
		end
	endcase
	if(count==3'b101)
	done=1;
	else done=0;
	end
end
endmodule
