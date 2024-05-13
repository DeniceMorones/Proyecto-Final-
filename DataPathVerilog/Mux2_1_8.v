// 1. Declarar el modulo y sus I/O
module Mux2_1_8(
	input  sel,
	input [7:0] Op1,
	input [7:0] Op2,
	output reg [7:0]outOp
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
