 // 1. Declarar el modulo y sus I/O
module BancoDeRegistro(
	input [4:0] RA1,
	input [4:0] RA2,
	input [31:0] Di,
	input [4:0] Dir,
	input RegWrite,
	output reg [31:0] DR1,
	output reg [31:0] DR2 	
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).
reg [31:0] MEM [0:31];

Mux_0_1 c2(.salida(RegWrite));

// 3. Elementos de Procesamiento (Asignacion de Operadores "Logicos y Aritmeticos")

always @(*)
	begin
		if(RegWrite)
		begin
			MEM[Dir]=Di;
		end
		DR1=MEM[RA1];
		DR2=MEM[RA2];
	end

endmodule