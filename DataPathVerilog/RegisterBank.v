module RegisterBank(
    input clk,
    input [4:0] RA1,
    input [4:0] RA2,
    input [4:0] Dir,
    input [31:0] Di,
    input RegWrite,
    output reg [31:0] DR1,
    output reg [31:0] DR2 	
);

reg [31:0] MEM [0:31];

always @(posedge clk) begin
    if (RegWrite) begin
        MEM[Dir] <= Di;
    end
end

always @(*) begin
    DR1 = MEM[RA1];
    DR2 = MEM[RA2];
end

endmodule