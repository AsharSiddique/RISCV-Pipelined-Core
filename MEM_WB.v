module MEM_WB(
    input wire CLK,
    input wire Pass_RegWriteM,
    input wire Pass_ResultSrcM,
    input wire [31:0] Pass_ALUResultM,
    input wire [31:0] RD,
    input wire [4:0] Pass_RdM,
    input wire [31:0] Pass_PCPlus4M,
    output reg RegWriteW,
    output reg ResultSrcW,
    output reg [31:0] ALUResultW,
    output reg [31:0] ReadDataW,
    output reg [4:0] RdW,
    output reg [31:0] PCPlus4W
);

    always @(posedge CLK) begin
        RegWriteW <= Pass_RegWriteM;
        ResultSrcW <= Pass_ResultSrcM;
        ALUResultW <= Pass_ALUResultM;
        ReadDataW <= RD;
        RdW <= Pass_RdM;
        PCPlus4W <= Pass_PCPlus4M;
    end

endmodule