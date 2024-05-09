
module multiplexor (
    input wire ZF,              
    input wire [31:0] cero,    
    input wire [31:0] uno,    
    output reg [31:0] salida    
);

    always @(*) begin
        if (ZF) begin
            salida = uno; 
        end else begin
            salida = cero;  
        end
    end

endmodule