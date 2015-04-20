module raw7seg(clk, segment, anode, word);

   // by teknohog at iki 0 fi

   // Display a word on a 7-segment display as raw bits. To display
   // legible text, use external modules/software to figure out the
   // mapping.

   // Size of 7-seg display to use, also determines the input word
   // size which must be 8 times this.
   parameter SEG_UNITS = 4;

   // Change these to suit the signaling conventions of your board.
   parameter INVERT_ANODES = 1;
   parameter INVERT_SEGMENTS = 1;
   
   input clk;
   output [(SEG_UNITS - 1):0] anode;
   output [7:0] segment;
   
   input [(SEG_UNITS * 8 - 1):0] word;

   // cnt is used as a prescaler
   reg [5:0] 	cnt;
   
   always @(posedge clk) cnt<=cnt+1;
   wire 	cntovf = cnt[5];

   // Fixed to a maximum of 16 digits for now, as I cannot easily use
   // log and ceil functions in Verilog.
   reg [3:0] 	an_index;
   
   // Procedural assignment to a non-register segment is not permitted
   reg [7:0] 	SevenSeg;

   reg [(SEG_UNITS * 8 - 1):0] word_shifted;
   generate
      if (INVERT_SEGMENTS)
	begin: if_is
	   assign segment = ~word_shifted[7:0];
	end
      else
	begin: else_is
	   assign segment = word_shifted[7:0];
	end
   endgenerate
	integer counter;
   always @(posedge cntovf) begin
		case(counter)
		0:
		begin
			//an_index <= 4'b1000;
		counter <= 1;
		if (an_index == SEG_UNITS - 1)
       an_index <= 0;
		else
       an_index <= an_index + 1'b1;
		end
		1:
		begin
			word_shifted <= word >> (an_index * 8);
			counter <= 2;
		end
		2:
		begin
			word_shifted <= 0;
			counter <= 3;
		end
		3:
		begin
			//an_index <= 4'b0100;
			counter <= 4;
			if (an_index == SEG_UNITS - 1)
				an_index <= 0;
			else
				an_index <= an_index + 1'b1;
		end
		4:
		begin
			word_shifted <= word >> (an_index * 8);
			counter <= 5;
		end
		5:
		begin
			word_shifted <= 0;
			counter <= 6;
		end
		6:
		begin
			//an_index <= 4'b0010;
			counter <= 7;
			if (an_index == SEG_UNITS - 1)
				an_index <= 0;
			else
				an_index <= an_index + 1'b1;
		end
		7:
		begin
			word_shifted <= word >> (an_index * 8);
			counter <= 8;
		end
		8:
		begin
			word_shifted <= 0;
			counter <= 9;
		end
		9:
		begin
			//an_index <= 4'b0001;
			counter <= 10;
			if (an_index == SEG_UNITS - 1)
				an_index <= 0;
			else
				an_index <= an_index + 1'b1;
		end
		10:
		begin
			word_shifted <= word >> (an_index * 8);
			counter <= 11;
		end
		11:
		begin
			word_shifted <= 0;
			counter <= 0;
		end
		default:
			counter <= 0;
		endcase
	end

   localparam [(SEG_UNITS - 1):0] 	anode_init = 1;
   generate
      if (INVERT_ANODES)
	begin: if_ia
	   assign anode = ~(anode_init << an_index);
	end
      else
	begin: else_ia
	   assign anode = (anode_init << an_index);
	end
   endgenerate
   
endmodule