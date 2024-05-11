module ADD(
    input [31:0] operando1,    // Primer operando de 32 bits
    input [31:0] operando2,    // Segundo operando de 32 bits
    output reg [31:0] resultado  // Resultado de la operaci�n ADD
);

    always @(*) begin
        resultado = operando1 + operando2;  // Realiza la operaci�n de suma ADD
    end

endmodule

