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
module iteration(a,b,c,d,e,f,g,h,K,h1, h2, h3, h4, h5, h6, h7, h8, control, message_in, message_hash, block, select, clk);

output reg [31:0]a,b,c,d,e,f,g,h;	
input [31:0] h1, h2, h3, h4, h5, h6, h7, h8, message_in, message_hash;
input [1:0]block;	
input [6:0] select;
input  clk;
input control; //high only when counter = 0, to input H values to a-h registers 
input [31:0] K;
reg [31:0] message_array [16:0];
reg [31:0] t1;
reg [31:0] t2;
reg [31:0]temp;
integer i;


// a-h logic implemetation

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
			if(control ==0 && select !=0)
			begin
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
	end
//Computation of W: W is a 64, 32 bit values, first 16 values are sames as meassage input, rest is computed based those 16 values.
always @(posedge clk)
begin
if(select == 0)
			begin
				if(block ==0)
				begin
					 for(i = 0; i <16; i=i+1) 							//W is a 64, 32 bit values, first 16 values are sames as meassage input
					 begin
							 message_array[i] = message_array[i+1]; //shift register to store input message for computation of W
						 end 
				end
			end
			else
				begin
					 for(i = 0; i <16; i=i+1) 
					 begin
						message_array[i] = message_array[i+1]; //shift register to store input message for computation of W
					 end 
				end

if (select < 16)
		begin
			if(block ==2)
				begin
					message_array[16] = message_hash; //load message_array with hash values for double hash computation
				end
			else
				begin
					message_array[16] = message_in;	// load message_array with input message
				end
		end
			
	else
		begin
			if(select ==65)
				message_array[16] = message_array[15];
			else
					message_array[16] = (({message_array[14][16:0],message_array[14][31:17]}) ^ ({message_array[14][18:0], message_array[14][31:19]})^(message_array[14]>>10)) + message_array[9] + (({message_array[1][6:0], message_array[1][31:7]})^({message_array[1][17:0], message_array[1][31:18]})^(message_array[1]>>3)) + message_array[0] ;// compute the next message

		end
end



always @(posedge clk)
begin
if(select ==1)
	begin
		temp = h8+(({h5[5:0], h5[31:6]})^({h5[10:0], h5[31:11]})^({h5[24:0], h5[31:25]}))+((h5&h6)^((~h5)&h7))+ K + message_array[16]; //compute t1 and t2 using h1 to h8 register (maintaining the timing)
		t1= temp + (({h1[1:0], h1[31:2]})^({h1[12:0], h1[31:13]})^({h1[21:0], h1[31:22]}))+((h1&h2)^(h1&h3)^(h2&h3));
		t2= temp +h4;
	end
else
	begin
		temp = g+(({t2[5:0], t2[31:6]})^({t2[10:0], t2[31:11]})^({t2[24:0], t2[31:25]}))+((t2&e)^((~t2)&f))+ K + message_array[16]; //compute t1 and t2 using a to h register 
		t1= temp + (({t1[1:0], t1[31:2]})^({t1[12:0], t1[31:13]})^({t1[21:0], t1[31:22]}))+((t1&a)^(t1&b)^(a&b));
		t2= temp +c;
	end
end


endmodule     

