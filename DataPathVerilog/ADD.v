module ADD(
    input [31:0] op1,
    input [31:0] op2,   
    output reg [31:0] res  
);

    always @(*) begin
        res = op1 + op2;  
    end

endmodule

