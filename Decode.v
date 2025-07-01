`include "CU.v"
`include "RegisterFile.v"
`include "Extend.v"

module Decode(
    input wire CLK,
    input wire [31:0] InstrD,
    input wire [31:0] PCD,
    input wire [31:0] PCPlus4D,
    input wire RegWriteW,
    input wire [4:0] RdW,
    input wire [31:0] ResultW,
    output wire RegWriteD,
    output wire ResultSrcD,
    output wire MemWriteD,
    output wire BranchD,
    output wire [2:0] ALUControlD,
    output wire ALUSrcD,
    output wire [31:0] Pass_PCD,
    output wire [31:0] Pass_PCPlus4D,
    output wire [31:0] RD1D,
    output wire [31:0] RD2D,
    output wire [4:0] RdD,
    output wire [31:0] ImmExtD
);

    wire [1:0] ImmSrcD;

    CU CU (
        .op(InstrD[6:0]),
        .funct3(InstrD[14:12]),
        .funct7b5(InstrD[30]),
        .ResultSrc(ResultSrcD),
        .MemWrite(MemWriteD),
        .ALUSrc(ALUSrcD),
        .ImmSrc(ImmSrcD),
        .RegWrite(RegWriteD),
        .ALUControl(ALUControlD),
        .Branch(BranchD)
    );

    RegisterFile RF(
        .CLK(CLK),
        .A1(InstrD[19:15]), 
        .A2(InstrD[24:20]),
        .A3(RdW),
        .WD3(ResultW),
        .WE3(RegWriteW),
        .RD1(RD1D),
        .RD2(RD2D)
    );

    Extend E(
        .Instr(InstrD[31:7]),
        .ImmSrc(ImmSrcD),
        .ImmExt(ImmExtD)
    );

    assign RdD = InstrD[11:7];
    assign Pass_PCD = PCD;
    assign Pass_PCPlus4D = PCPlus4D;

endmodule