module maj(output reg[31:0]m, input [31:0] x, y, z, input clk);
always @(posedge clk)
begin
m= (x&y)^(x&z)^(y&z);
end
endmodule
