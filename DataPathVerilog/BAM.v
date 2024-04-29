// 1. Declarar el modulo y sus I/O
module BAM(
	input bamEwr,
	input [4:0] bamDir1,
	input [2:0] bamSel,
	input [4:0] bamRA1,
	input [4:0] bamRA2,
	input [31:0] bamDi,
	input [4:0] bamDir2,
	input bamRegWrite,
	output bamZF,
	output [31:0] bamDout
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).

wire [31:0] bamDR1;
wire [31:0] bamDR2;
wire [31:0] bamDin;


BancoDeRegistro BR1(.RA1(bamRA1),.RA2(bamRA2),.Di(bamDi),.Dir(bamDir2),.RegWrite(bamRegWrite),
			.DR1(bamDR1),.DR2(bamDR2));
_ALU Alu1 (.operador1(bamDR1),.operador2(bamDR2),.selector(bamSel),.resultado(bamDin),.ZF(bamZF));

Mem Mem1 (.Ewr(bamEwr),.Dir(bamDir1),.Din(bamDin),.Dout(bamDout));
//3. Elementos de Procesamiento (Lógicos y aritméticos)

endmodule