module Mux2_1_8(
	input  sel,
	input [7:0] Op1,
	input [7:0] Op2,
	output reg [7:0]outOp
);

always @ (*)
	begin 
		if(sel)
			outOp=Op2;
		else
			outOp=Op1;
	end
endmodule
