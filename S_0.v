module S_0(output reg[31:0]s0, input [31:0]x, input clk);
always @(posedge clk)
begin
s0 = ({x[1:0], x[31:2]})^({x[12:0], x[31:13]})^({x[21:0], x[31:22]});
end
endmodule
