module ch(output reg [31:0]c, input [31:0]x, input [31:0]y, input [31:0]z, input clk);
wire [31:0] xn;

 always @(posedge clk)
begin
 c = (x&y)^((~x)&z);
end

endmodule