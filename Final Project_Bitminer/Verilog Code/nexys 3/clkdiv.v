`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:41 03/23/2015 
// Design Name: 
// Module Name:    clkdiv 
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
module clkdiv(
    output reg clk,
    input mclk
    );


reg count;


always @(posedge mclk)
begin
count <= count + 1'b1;
if (count == 1'b1)
clk <= 1;
else
clk <= 0;
end

endmodule

