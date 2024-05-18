module ADD(
    input [7:0] op1,
    input [7:0] op2,   
    output reg [7:0] res  
);

    always @(*) begin
        res = op1 + op2;  
    end

endmodule

