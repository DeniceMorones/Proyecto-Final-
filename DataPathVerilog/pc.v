module PC (
    input wire clk,           // para el reloj
    input wire reset,         // un reset
    output reg [7:0] direccion  // Direcci�n de la memoria de instrucciones
);

    // contador para la direcci�n de la instrucci�n
    reg [7:0] contador;

    // actualizar la direcci�n
    always @(clk, reset) begin
        if (reset) begin
            contador <= 8'd0;  // restablecer el contador a cero en caso de reset
        end else begin
            if (clk) begin
                contador <= contador + 1;  // incrementar el contador en cada ciclo de reloj
            end
        end
    end

    // la direcci�n de la instrucci�n es la salida del contador
    assign direccion = contador;

endmodule

