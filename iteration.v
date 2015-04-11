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
module iteration(t1_out, t2_out, a,b,c,d,e,f,g,h,message_in,select, clk);

output  reg [31:0]t1_out, t2_out;	
input [31:0] a,b,c,d,e,f,g,h,message_in;	
input [5:0] select;
input clk;
reg [31:0] K[63:0];
reg [31:0] message_array [63:0];
reg [31:0]t1,t2;
reg [31:0] temp1,temp2;
initial
begin
$readmemh("Kvalues.bin",K,0,63);
end

	

always @(posedge clk)
begin

temp1= K[select-1];


if (select < 16)
		begin
	//W = message_in;
			message_array[select] = message_in;
		end
	else 	
		begin
			//W = (({message_array[select-2][16:0],message_array[select-2][31:17]}) ^ ({message_array[select-2][17:0], message_array[select-2][31:18]})^(message_array[select-2]>>3)) + message_array[select-7] + (({message_array[select-15][6:0], message_array[select-15][31:7]})^({message_array[select-15][17:0], message_array[select-15][31:18]})^(message_array[select-15]>>3)) + message_array[select-16] ;		
			message_array[select] = (({message_array[select-2][16:0],message_array[select-2][31:17]}) ^ ({message_array[select-2][17:0], message_array[select-2][31:18]})^(message_array[select-2]>>3)) + message_array[select-7] + (({message_array[select-15][6:0], message_array[select-15][31:7]})^({message_array[select-15][17:0], message_array[select-15][31:18]})^(message_array[select-15]>>3)) + message_array[select-16] ;;
		end
temp2 = message_array[select-1];
t1=h+(({e[5:0], e[31:6]})^({e[10:0], e[31:11]})^({e[24:0], e[31:25]}))+((e&f)^((~e)&g))+temp1+ temp2;
t2=(({a[1:0], a[31:2]})^({a[12:0], a[31:13]})^({a[21:0], a[31:22]}))+((a&b)^(a&c)^(b&c));
t1_out = t1+t2;
t2_out = d+t1;

end



endmodule

