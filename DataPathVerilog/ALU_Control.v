// 1. Declarar el modulo y sus I/O
module ALU_Control(
	input [5:0] Func,
	input [2:0] InOp,
	output reg [3:0]outOp
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).


//3. Elementos de Procesamiento (Lógicos y aritméticos)
always @ (*)
	begin
		case(InOp)
			3'b000:
				case(Func)
					6'b100000: outOp=4'b0010;// ADD
					6'b100010: outOp=4'b0110;//SUB
					6'b100100: outOp=4'b0000;//AND
					6'b100101: outOp=4'b0001;//OR
					6'b101010: outOp=4'b0111;//STL
				default: 
					outOp =4'b1111;
				endcase
			default: 
				outOp =4'b1111;
		endcase
	end
endmodule