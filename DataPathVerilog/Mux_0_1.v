/*module Mux_0_1 (
    input wire selector,    // este selecciona las entradas
    input wire input_0,     // entrada 0
    input wire input_1,     // entrada 1
    output reg salida      // output
);

    
    always @(*) begin
        if (selector == 0) begin
            salida = input_0;  // si es 0 selecciona al 0
        end else begin
            salida = input_1;  // lo contrario
        end
    end

endmodule*/
