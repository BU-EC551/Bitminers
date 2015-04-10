module S_1(output reg[31:0]s1, input [31:0]x, input clk);
always @(posedge clk)
begin
s1 = ({x[5:0], x[31:6]})^({x[10:0], x[31:11]})^({x[24:0], x[31:25]});
end
endmodule
