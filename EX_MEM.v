module EX_MEM (
    input wire CLK,
    input wire Pass_RegWriteE,
    input wire Pass_ResultSrcE,
    input wire Pass_MemWriteE,
    input wire [31:0] ALUResultE,
    input wire [31:0] WriteDataE,
    input wire [4:0] Pass_RdE,
    input wire [31:0] Pass_PCPlus4E,
    output reg RegWriteM,
    output reg ResultSrcM,
    output reg MemWriteM,
    output reg [31:0] ALUResultM,
    output reg [31:0] WriteDataM,
    output reg [4:0] RdM,
    output reg [31:0] PCPlus4M
);

    always @(posedge CLK) begin
        RegWriteM <= Pass_RegWriteE;
        ResultSrcM <= Pass_ResultSrcE;
        MemWriteM <= Pass_MemWriteE;
        ALUResultM <= ALUResultE;
        WriteDataM <= WriteDataE;
        RdM <= Pass_RdE;
        PCPlus4M <= Pass_PCPlus4E;
    end
    
endmodule