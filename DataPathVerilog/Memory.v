// 1. Declarar el modulo y sus I/O
module Mem(
	input Ewr,
	input [31:0] Dir,
	input [31:0] Din,
	output reg [31:0] Dout
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).
reg [31:0] MEM [0:255];

//3. Elementos de Procesamiento (Lógicos y aritméticos)

always @*
	begin
		if(Ewr) begin
			MEM[Dir]=Din;
		end
		else begin
				Dout= MEM[Dir];
		end
	end
endmodule
