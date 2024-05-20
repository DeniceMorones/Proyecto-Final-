module Memory(
	input clk,
	input Ewr,
	input [31:0] Dir,
	input [31:0] Din,
	output reg [31:0] Dout
);

reg [31:0] MEM [0:255];

always @(posedge clk) begin
    if (Ewr) begin
        MEM[Dir] <= Din;
    end
end

always @(*) begin
    Dout = MEM[Dir];
end
endmodule
