module ShiftLeft2(
	input [5:0] in,
	output reg [7:0] out
);

always @ (*)
	begin 
		out = {in, 2'b00};
	end
endmodule