// 1. Declarar el modulo y sus I/O
module ControlUnit(
	input  [5:0] op,
	output reg RegDst,
	output reg Branch
	output reg MemRead,,
	output reg MemToReg,
	output reg [2:0] ALUOp,
	output reg MemWrite,
	output reg ALUSrc,
	output reg RegWrite
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).

/*Add
Sub
AND
OR
SLT
Arquitectura de tipo RISC y CISC
Reducidas y complejas*/

//3. Elementos de Procesamiento (Lógicos y aritméticos)
always @(*)
	begin
		case (op)
		6'b0000000:
			begin
				MemToReg=1'b0;
				MemToWrite=1'b0;
				ALUOp=3'b000;
				RegWrite=1'b1;
			end
		default:
			begin
				MemToReg=1'b1;
				MemToWrite=1'b0;
				ALUOp=3'b001;
				RegWrite=1'b0;
			end
		endcase
	end
endmodule
