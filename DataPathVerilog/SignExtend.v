module Mux2_1_5(
	input [15:0] in,
	output reg [31:0] out
);

always @ (*)
	begin 
		if(in[15] == 1'b1)
			out = {16'b1111111111111111, in};
		else
			out = {16'b0, in};
	end
endmodule