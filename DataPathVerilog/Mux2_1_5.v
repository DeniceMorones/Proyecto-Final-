module Mux2_1_5(
	input  sel,
	input [4:0] Op1,
	input [4:0] Op2,
	output reg [4:0]outOp
);

always @ (*)
	begin 
		if(sel)
			outOp=Op2;
		else
			outOp=Op1;
	end
endmodule
