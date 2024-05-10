module PC(
    input wire ZF,
    output reg [7:0] sel 
);

    
    // señales que va recibir del multiplexor
    wire [7:0] cero_value;
    wire [7:0] uno_value;

    // Multiplexor para seleccionar entre cero y uno
    multiplexor mux(.ZF(ZF), .cero(cero_value), .uno(uno_value), .salida(sel));

endmodule
