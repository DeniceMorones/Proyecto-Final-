`timescale 1ns/1ns

module TB_ControlUnit();
	reg [5:0] opcode;
	wire RegDst;
	wire Jump;
	wire Branch;
	wire MemRead;
	wire MemToReg;
	wire [2:0] ALUOp;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;

	ControlUnit DUT(.opcode(opcode),.RegDst(RegDst),.Jump(Jump), .Branch(Branch),.MemRead(MemRead), .MemToReg(MemToReg), .ALUOp(ALUOp), .MemWrite(MemWrite), 
	.ALUSrc(ALUSrc), .RegWrite(RegWrite));

	initial begin
			opcode=6'b000000;
			#100;
			opcode=6'b001000;
			#100;
			opcode=6'b001101;
			#100;
			opcode=6'b001100;
			#100;
			opcode=6'b001010;
			#100;
			opcode=6'b100011;
			#100;
			opcode=6'b101011;
			#100;
			opcode=6'b000100;
			#100;
			opcode=6'b000010;
			#100;
			
			$stop;
	end
endmodule
