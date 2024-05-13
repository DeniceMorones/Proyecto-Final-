// 1. Declarar el modulo y sus I/O
module Mux2_1_32(
	input  sel,
	input [31:0] Op1,
	input [31:0] Op2,
	output reg [31:0]outOp
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).

//3. Elementos de Procesamiento (Lógicos y aritméticos)
always @ (*)
	begin 
		if(sel)
			outOp=Op2;
		else
			outOp=Op1;
	end
endmodule
