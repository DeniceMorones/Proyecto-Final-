module ShiftLeft2_26_28(
    input [25:0] in,
    output [27:0] out
);
    // Desplazar la entrada 2 bits a la izquierda
    assign out = {in, 2'b00};
endmodule