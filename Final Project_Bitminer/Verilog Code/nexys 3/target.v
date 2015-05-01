module target(input [31:0] target_in, output reg [255:0] target_out);		//converts a 32 bit target input to 256 bits

reg [7:0] num_ending_zeroes; 												
reg [23:0] significand;

always @ (*)
begin
	num_ending_zeroes = (target_in[31:24] - 2'b11) << 3;							//first byte is the exponent, base 256
	significand = target_in[23:0];														//last three bytes is the mantissa
	target_out = significand << num_ending_zeroes;	
end

endmodule
