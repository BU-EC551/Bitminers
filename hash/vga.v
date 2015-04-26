module vga(vga_R, vga_G, vga_B, num,offset, inDisplayArea, CounterX, CounterY, pixel_clk);
input pixel_clk;
input [3:0]num;
input [9:0]offset;
output vga_R, vga_G, vga_B;
input inDisplayArea;
input [9:0] CounterX;
input [8:0] CounterY;
reg[6:0] seven;
reg color;
reg R, B,G;


reg vga_R, vga_G, vga_B;

always @(num or CounterX or CounterY or offset)
begin
case(num)
		4'b0000:begin
					seven =7'b0111111;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
					
4'b0001:begin
					seven =7'b0000110;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b0010:begin
					seven =7'b1011011;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b0011:begin
					seven =7'b1001111;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b0100:begin
					seven =7'b1100110;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b0101:begin
					seven =7'b1101101;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b0110:begin
					seven =7'b1111101;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b0111:begin
					seven =7'b0000111;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b1000:begin
					seven =7'b1111111;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b1001:begin
					seven =7'b1101111;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b1010:begin
					seven =7'b1110111;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b1011:begin
					seven =7'b1111100;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b1100:begin
					seven =7'b0111001;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b1101:begin
					seven =7'b1011110;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b1110:begin
					seven =7'b1111001;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
4'b1111:begin
					seven =7'b1110001;
					if((CounterX>(100+offset))&&(CounterX<(140+offset)))
						begin
							if((CounterY>50)&&(CounterY<60))begin
								color = seven[0];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>190)&&(CounterY<200)) begin
								color = seven[3];
								R=color;
								B=color;
								G=color;
								end
							else
							if((CounterY>120)&&(CounterY<130)) begin
								color = seven[6];
								R=color;
								B=color;
								G=color;
								end
							else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(140+offset))&&(CounterX<(150+offset))) 
						begin
								if((CounterY>135)&&(CounterY<185)) begin
								color = seven[2];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>65)&&(CounterY<115)) begin
								color = seven[1];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
						if((CounterX>(90+offset))&&(CounterX<(100+offset)))
						begin
							if((CounterY>=135)&&(CounterY<=185)) begin
								color = seven[4];
								R=color;
								B=color;
								G=color;
								end
								else
								if((CounterY>=65)&&(CounterY<=115)) begin
								color = seven[5];
								R=color;
								B=color;
								G=color;
								end
								else
								begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
								end
							end
						else
							begin
									color = 1'b0;
									R=color;
									B=color;
									G=color;
							end
					end
					
					
					
					
      default: seven =7'b1111111;
endcase
end 

always @(posedge pixel_clk)
begin
  vga_R <= R & inDisplayArea;
  vga_G <= G & inDisplayArea;
  vga_B <= B & inDisplayArea;
   
end
endmodule
