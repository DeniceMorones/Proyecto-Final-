module ADD(
    input [7:0] operando1,    // Primer operando de 32 bits
    output reg [7:0] resultado  // Resultado de la operación ADD
);

    always @(*) begin
        resultado = operando1 + 8'd4;  // Realiza la operación de suma ADD
    end

endmodule

