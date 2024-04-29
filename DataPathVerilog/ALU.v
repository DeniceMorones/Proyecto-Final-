 // 1. Declarar el modulo y sus I/O
module _ALU(
	input [31:0]  operador1,
	input [31:0]  operador2,
	input [3:0]   selector,
	output reg [31:0] resultado,
	output ZF
);
//2. Definir Elementos /Componentes Internos (Cables, Registros).
wire AND;
wire OR;
wire [31:0] add;
wire [31:0] substract;
wire setOnLessThan;
wire NOR;


//3. Elementos de Procesamiento (Lógicos y aritméticos)
assign AND= operador1 & operador2;
assign OR= operador1 | operador2;
assign add= operador1+operador2;
assign substract= operador1-operador2;
assign setOnLessThan= ((operador1 < operador2)? 31'b1:31'b0);
assign NOR= ~(operador1 | operador2);
always @(*) begin
    case(selector)
        4'b0000: resultado = AND;
        4'b0001: resultado = OR;
        4'b0010: resultado = add;
        4'b0110: resultado = substract;
        4'b0111: resultado = setOnLessThan;
        4'b1100: resultado = NOR;
        default: resultado = 31'd0;
    endcase
end
assign ZF= ~(resultado!=31'd0);
endmodule
