module ShiftLeft2_32(
    input [32:0] in,
    output [32:0] out
);
    // Desplazar la entrada 2 bits a la izquierda
    assign out = in << 2;
endmodule