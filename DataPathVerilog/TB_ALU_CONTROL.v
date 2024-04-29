`timescale 1ns/1ns
module TB_ALU_Control();
reg [0:5]TB_Func;
reg [2:0]TB_InOp;
wire [3:0]TB_outOP;

ALU_Control ALU_C1(.Func(TB_Func),.InOp(TB_InOp),.outOp(TB_outOP));

initial
	begin
		TB_Func=6'b100000;
		TB_InOp=3'b000;
		#100;
		TB_Func=6'b100000;
		TB_InOp=3'b001;
		#100;
		TB_Func=6'b100010;
		TB_InOp=3'b000;
		#100;
		TB_Func=6'b100100;
		TB_InOp=3'b000;
		#100;
		TB_Func=6'b100101;
		TB_InOp=3'b000;
		#100;
		TB_Func=6'b101010;
		TB_InOp=3'b000;
		#100;
		TB_Func=6'b111011;
		TB_InOp=3'b000;
		#100;
		
	end
endmodule