`timescale 1ns/1ns
module TB_Unidad_control();
reg [5:0]TB_op;
wire TB_MemToReg;
wire TB_MemToWrite;
wire [2:0] TB_ALUOp;
wire TB_RegWrite;

Unidad_de_Control UC1(.op(TB_op),.MemToReg(TB_MemToReg),.MemToWrite(TB_MemToWrite),
	.ALUOp(TB_ALUOp),.RegWrite(TB_RegWrite));

initial
	begin
		TB_op=6'b000000;
		#100;
		TB_op=6'b000001;
		#100;
		TB_op=6'b000000;
		#100;
		$stop;
	end
endmodule
