module ShiftLeft2(
	input [5:0] in,
	output reg [7:0] out
);

assign out = in << 2;

endmodule