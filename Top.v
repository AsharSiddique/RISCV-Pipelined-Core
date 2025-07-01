`include "Fetch.v"
`include "IF_ID.v"
`include "Decode.v"
`include "ID_EX.v"
`include "Execute.v"
`include "EX_MEM.v"
`include "Memory.v"
`include "MEM_WB.v"
`include "WriteBack.v"

module Top (
    input wire CLK
);

    wire [31:0] RDI, PCF, PCPlus4F, InstrD, PCD, PCPlus4D, Pass_PCD, Pass_PCPlus4D, RD1D, RD2D, ImmExtD, PCE, PCPlus4E, RD1E, RD2E, ImmExtE, WriteDataE, PCTargetE, Pass_PCPlus4E, ALUResultM, WriteDataM, PCPlus4M, RDD, Pass_PCPlus4M, ReadDataW, PCPlus4W, ResultW, ALUResultE, Pass_ALUResultM, ALUResultW;
    wire RegWriteD, ResultSrcD, MemWriteD, BranchD, ALUSrcD, RegWriteE, ResultSrcE, MemWriteE, BranchE, ALUSrcE, Pass_RegWriteE, Pass_ResultSrcE, Pass_MemWriteE, PCSrcE,  RegWriteM, ResultSrcM, MemWriteM, Pass_RegWriteM, Pass_ResultSrcM, RegWriteW, ResultSrcW, Pass_RegWriteW;
    wire [2:0] ALUControlD, ALUControlE;
    wire [4:0] RdD, RdE, Pass_RdE, RdM, Pass_RdM, RdW, Pass_RdW;



    Fetch F (
        .CLK(CLK),
        .PCSrcE(PCSrcE),
        .PCTargetE(PCTargetE),
        .RD(RDI),
        .PCF(PCF),
        .PCPlus4F(PCPlus4F)
    );

    IF_ID R1 (
        .CLK(CLK),
        .RD(RDI),
        .PCF(PCF),
        .PCPlus4F(PCPlus4F),
        .InstrD(InstrD),
        .PCD(PCD),
        .PCPlus4D(PCPlus4D)
    );

    Decode D (
        .CLK(CLK),
        .InstrD(InstrD),
        .PCD(PCD),
        .PCPlus4D(PCPlus4D),
        .RegWriteW(Pass_RegWriteW),
        .RdW(Pass_RdW),
        .ResultW(ResultW),
        .RegWriteD(RegWriteD),
        .ResultSrcD(ResultSrcD),
        .MemWriteD(MemWriteD),
        .BranchD(BranchD),
        .ALUControlD(ALUControlD),
        .ALUSrcD(ALUSrcD),
        .Pass_PCD(Pass_PCD),
        .Pass_PCPlus4D(Pass_PCPlus4D),
        .RD1D(RD1D),
        .RD2D(RD2D),
        .RdD(RdD),
        .ImmExtD(ImmExtD)
    );

    ID_EX R2 (
        .CLK(CLK),
        .RegWriteD(RegWriteD),
        .ResultSrcD(ResultSrcD),
        .MemWriteD(MemWriteD),
        .BranchD(BranchD),
        .ALUControlD(ALUControlD),
        .ALUSrcD(ALUSrcD),
        .Pass_PCD(Pass_PCD),
        .Pass_PCPlus4D(Pass_PCPlus4D),
        .RD1D(RD1D),
        .RD2D(RD2D),
        .RdD(RdD),
        .ImmExtD(ImmExtD),
        .RegWriteE(RegWriteE),
        .ResultSrcE(ResultSrcE),
        .MemWriteE(MemWriteE),
        .BranchE(BranchE),
        .ALUControlE(ALUControlE),
        .ALUSrcE(ALUSrcE),
        .PCE(PCE),
        .PCPlus4E(PCPlus4E),
        .RD1E(RD1E),
        .RD2E(RD2E),
        .RdE(RdE),
        .ImmExtE(ImmExtE)
    );

    Execute E (
        .RegWriteE(RegWriteE),
        .ResultSrcE(ResultSrcE),
        .MemWriteE(MemWriteE),
        .BranchE(BranchE),
        .ALUControlE(ALUControlE),
        .ALUSrcE(ALUSrcE),
        .PCE(PCE),
        .PCPlus4E(PCPlus4E),
        .RD1E(RD1E),
        .RD2E(RD2E),
        .RdE(RdE),
        .ImmExtE(ImmExtE),
        .Pass_RegWriteE(Pass_RegWriteE),
        .Pass_ResultSrcE(Pass_ResultSrcE),
        .Pass_MemWriteE(Pass_MemWriteE),
        .PCSrcE(PCSrcE),
        .ALUResultE(ALUResultE),
        .WriteDataE(WriteDataE),
        .PCTargetE(PCTargetE),
        .Pass_RdE(Pass_RdE),
        .Pass_PCPlus4E(Pass_PCPlus4E)
    );

    EX_MEM R3 (
        .CLK(CLK),
        .Pass_RegWriteE(Pass_RegWriteE),
        .Pass_ResultSrcE(Pass_ResultSrcE),
        .Pass_MemWriteE(Pass_MemWriteE),
        .ALUResultE(ALUResultE),
        .WriteDataE(WriteDataE),
        .Pass_RdE(Pass_RdE),
        .Pass_PCPlus4E(Pass_PCPlus4E),
        .RegWriteM(RegWriteM),
        .ResultSrcM(ResultSrcM),
        .MemWriteM(MemWriteM),
        .ALUResultM(ALUResultM),
        .WriteDataM(WriteDataM),
        .RdM(RdM),
        .PCPlus4M(PCPlus4M)
    );

    Memory M (
        .CLK(CLK),
        .RegWriteM(RegWriteM),
        .ResultSrcM(ResultSrcM),
        .MemWriteM(MemWriteM),
        .ALUResultM(ALUResultM),
        .WriteDataM(WriteDataM),
        .RdM(RdM),
        .PCPlus4M(PCPlus4M),
        .Pass_RegWriteM(Pass_RegWriteM),
        .Pass_ResultSrcM(Pass_ResultSrcM),
        .Pass_ALUResultM(Pass_ALUResultM),
        .RD(RDD),
        .Pass_RdM(Pass_RdM),
        .Pass_PCPlus4M(Pass_PCPlus4M)
    );

    MEM_WB R4 (
        .CLK(CLK),
        .Pass_RegWriteM(Pass_RegWriteM),
        .Pass_ResultSrcM(Pass_ResultSrcM),
        .Pass_ALUResultM(Pass_ALUResultM),
        .RD(RDD),
        .Pass_RdM(Pass_RdM),
        .Pass_PCPlus4M(Pass_PCPlus4M),
        .RegWriteW(RegWriteW),
        .ResultSrcW(ResultSrcW),
        .ALUResultW(ALUResultW),
        .ReadDataW(ReadDataW),
        .RdW(RdW),
        .PCPlus4W(PCPlus4W)
    );

    WriteBack WB(
        .RegWriteW(RegWriteW),
        .ResultSrcW(ResultSrcW),
        .ALUResultW(ALUResultW),
        .ReadDataW(ReadDataW),
        .RdW(RdW),
        .PCPlus4W(PCPlus4W),
        .Pass_RegWriteW(Pass_RegWriteW),
        .Pass_RdW(Pass_RdW),
        .ResultW(ResultW)
    );

endmodule