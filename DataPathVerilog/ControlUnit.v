module ControlUnit(
	input  [5:0] op,
	output reg RegDst,
	output reg Jump,
	output reg Branch,
	output reg MemRead,
	output reg MemToReg,
	output reg [2:0] ALUOp,
	output reg MemWrite,
	output reg ALUSrc,
	output reg RegWrite
);

always @(*)
	begin
		case (op)
		6'b0: // Instrucciones tipo R
			begin
				RegDst = 1'b1;
				Jump = 1'b0;
				Branch = 1'b0;
				MemRead = 1'b0;
				MemToReg = 1'b0;
				ALUOp = 3'b000;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b1;
			end
		6'b1000011: // Instruccion LW
			begin
				RegDst = 1'b0;
				Jump = 1'b0;
				Branch = 1'b0;
				MemRead = 1'b1;
				MemToReg = 1'b1;
				ALUOp = 3'b000;
				MemWrite = 1'b0;
				ALUSrc = 1'b1;
				RegWrite = 1'b1;
			end
		6'b0000010: // Instruccion J
			begin
				RegDst = 1'b0;
				Jump = 1'b1;
				Branch = 1'b0;
				MemRead = 1'b0;
				MemToReg = 1'b0;
				ALUOp = 3'b000;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b0;
			end
		default:
			begin
				RegDst = 1'b1;
				Branch = 1'b0;
				MemRead = 1'b0;
				MemToReg = 1'b0;
				ALUOp = 3'b000;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b1;
			end
		endcase
	end
endmodule
