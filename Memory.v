`include "DataMemory.v"

module Memory (
    input wire CLK,
    input wire RegWriteM,
    input wire ResultSrcM,
    input wire MemWriteM,
    input wire [31:0] ALUResultM,
    input wire [31:0] WriteDataM,
    input wire [4:0] RdM,
    input wire [31:0] PCPlus4M,
    output wire Pass_RegWriteM,
    output wire Pass_ResultSrcM,
    output wire [31:0] Pass_ALUResultM,
    output wire [31:0] RD,
    output wire [4:0] Pass_RdM,
    output wire [31:0] Pass_PCPlus4M
);

    DataMemory DM(
        .CLK(CLK),
        .WE(MemWriteM),
        .A(ALUResultM),
        .WD(WriteDataM),
        .RD(RD)
    );


    assign Pass_RegWriteM = RegWriteM; 
    assign Pass_ResultSrcM = ResultSrcM;
    assign Pass_ALUResultM = ALUResultM;
    assign Pass_RdM = RdM;
    assign Pass_PCPlus4M =  PCPlus4M;

endmodule