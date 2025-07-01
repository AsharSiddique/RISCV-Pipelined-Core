`include "ALU.v"
`include "ALUSrcMux.v"
`include "PCTargetAdder.v"

module Execute(
    input wire RegWriteE,
    input wire ResultSrcE,
    input wire MemWriteE,
    input wire BranchE,
    input wire [2:0] ALUControlE,
    input wire ALUSrcE,
    input wire [31:0] PCE,
    input wire [31:0] PCPlus4E,
    input wire [31:0] RD1E,
    input wire [31:0] RD2E,
    input wire [4:0] RdE,
    input wire [31:0] ImmExtE,
    output wire Pass_RegWriteE,
    output wire Pass_ResultSrcE,
    output wire Pass_MemWriteE,
    output wire PCSrcE,
    output wire [31:0] ALUResultE,
    output wire [31:0] WriteDataE,
    output wire [31:0] PCTargetE,
    output wire [4:0] Pass_RdE,
    output wire [31:0] Pass_PCPlus4E
);

    wire ZeroE;
    wire [31:0] SrcBE;

    ALU ALU (
        .SrcA(RD1E),
        .SrcB(SrcBE),
        .ALUControl(ALUControlE),
        .ALUResult(ALUResultE),
        .Zero(ZeroE)
    );

    ALUSrcMux M2 (
        .ALUSrc(ALUSrcE),
        .RD2(RD2E),
        .ImmExt(ImmExtE),
        .SrcB(SrcBE)
    );

    PCTargetAdder A2 (
        .PC(PCE),
        .ImmExt(ImmExtE),
        .PCTarget(PCTargetE)
    );

    assign PCSrcE = BranchE & ZeroE;
    assign WriteDataE = RD2E;
    assign Pass_RdE = RdE;
    assign Pass_PCPlus4E = PCPlus4E;
    assign Pass_RegWriteE = RegWriteE;
    assign Pass_ResultSrcE = ResultSrcE;
    assign Pass_MemWriteE = MemWriteE;


endmodule