// 1. Declarar el modulo y sus I/O
module ALU_Control(
	input [0:5] Func,
	input [2:0] InOp,
	output reg [2:0]outOp
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).


//3. Elementos de Procesamiento (Lógicos y aritméticos)
always @ (*)
	begin
		case(InOp)
			3'b010:
				case(Func)
					6'b100000: outOp=4'b0010;// ADD
					6'b100000: outOp=4'b0010;
				endcase
			default: 
				outOp =4'b1111;
		endcase
	end
endmodule