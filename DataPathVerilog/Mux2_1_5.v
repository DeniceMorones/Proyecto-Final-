// 1. Declarar el modulo y sus I/O
module Mux2_1_5(
	input  MemToReg,
	input [4:0] Op1,
	input [4:0] Op2,
	output reg [4:0]outOp
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).

//3. Elementos de Procesamiento (Lógicos y aritméticos)
always @ (*)
	begin 
		if(MemToReg)
			outOp=Op1;
		else
			outOp=Op2;
	end
endmodule
