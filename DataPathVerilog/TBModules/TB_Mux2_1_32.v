// 1. Declarar el modulo y sus I/O
`timescale 1ns/1ns
module TB_Mux2_1_32();
//2. Definir Elementos /Componentes Internos (Cables, Registros).
reg TB_MemToReg;
reg [31:0] TB_Op1;
reg [31:0] TB_Op2;
wire [31:0] TB_outOp;

Mux2_1_32 mux1_2(.MemToReg(TB_MemToReg),.Op1(TB_Op1),.Op2(TB_Op2),.outOp(TB_outOp));

// 3. Elementos de Procesamiento (Asignacion de Operadores "Logicos y Aritmeticos")
initial
	begin
		TB_MemToReg=0'b1;
		TB_Op1=0'd432;
		TB_Op2=0'd984;
		#100;
		TB_MemToReg=0'b0;
		TB_Op1=0'd432;
		TB_Op2=0'd984;
		#100;
		TB_MemToReg=0'b1;
		TB_Op1=0'd342;
		TB_Op2=0'd532;
		#100;
		TB_MemToReg=0'b0;
		TB_Op1=0'd342;
		TB_Op2=0'd532;
		$stop;
	end
endmodule
