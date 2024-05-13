module PC (
    input wire clk,           // para el reloj
    input wire [7:0] addressIn;
    input wire reset,         // un reset
    output reg [7:0] addresOut;  // Direccion de la memoria de instrucciones
);

    // contador para la direccion de la instruccion
    reg [7:0] contador;

    // actualizar la direcci�n
    always @(clk, reset) begin
        if (reset) begin
            contador <= 8'd0;  // restablecer el contador a cero en caso de reset
        end else begin
            if (clk) begin
                addresOut <= addressIn;
            end
        end
    end

    // la direcci�n de la instrucci�n es la salida del contador

endmodule

