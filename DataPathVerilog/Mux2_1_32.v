module Mux2_1_32(
	input  sel,
	input [31:0] Op1,
	input [31:0] Op2,
	output reg [31:0]outOp
);

always @ (*)
	begin 
		if(sel)
			outOp=Op2;
		else
			outOp=Op1;
	end
endmodule
