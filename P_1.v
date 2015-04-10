module P_1(output reg[31:0]p1, input [31:0]x, input clk);
always @(posedge clk)
begin
p1 = ({x[16:0], x[31:17]})^({x[18:0], x[31:19]})^(x>>10);
end
endmodule
