`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:09 04/07/2015 
// Design Name: 
// Module Name:    W 
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
module W(input clk, input [5:0] select, input [31:0] message_in, output reg [31:0] message_out);

reg [31:0] message_array [63:0];

always @ (posedge clk)
begin
	if (select < 16)
		begin
			message_out = message_in;
		end
	else 	
		begin
			message_out = (({message_array[select-1][16:0],message_array[select-1][31:17]}) ^ ({message_array[select-1][17:0], message_array[select-1][31:18]})^(message_array[select-1]>>3)) + message_array[select-6] + (({message_array[select-14][6:0], message_array[select-14][31:7]})^({message_array[select-14][17:0], message_array[select-14][31:18]})^(message_array[select-14]>>3)) + message_array[select-15] ;
		end
	message_array[select] = message_in;	
end

endmodule

//Wi = P1(Wi-2) +Wi-7 + P0(Wi-15) +Wi-16
//p0 = ({x[6:0], x[31:7]})^({x[17:0], x[31:18]})^(x>>3);
//p1 = ({x[16:0], x[31:17]})^({x[18:0], x[31:19]})^(x>>10);
