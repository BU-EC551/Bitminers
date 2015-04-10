module P_0(output reg[31:0]p0, input [31:0]x, input clk);
always @(posedge clk)
begin
p0 = ({x[6:0], x[31:7]})^({x[17:0], x[31:18]})^(x>>3);
end
endmodule
