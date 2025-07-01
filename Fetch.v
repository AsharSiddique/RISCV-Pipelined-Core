`include "PCSrcMux.v"
`include "ProgramCounter.v"
`include "InstructionMemory.v"
`include "PCPlus4Adder.v"

module Fetch(
    input wire CLK,
    input wire PCSrcE,
    input wire [31:0] PCTargetE,
    output wire [31:0] RD,
    output wire [31:0] PCF,
    output wire [31:0] PCPlus4F
);

    wire [31:0] M1_PC, internal_PCPlus4F;

    ProgramCounter PC(
        .CLK(CLK),
        .PCNext(M1_PC),
        .PC(PCF)
    );

    PCSrcMux M1(
        .PCSrc(PCSrcE),
        .PCPlus4(internal_PCPlus4F),
        .PCTarget(PCTargetE),
        .PCNext(M1_PC)
    );

    InstructionMemory IM(
        .A(PCF),
        .RD(RD)
    );

    PCPlus4Adder A1(
        .PC(PCF),
        .PCPlus4(internal_PCPlus4F)
    );

    assign PCPlus4F  = internal_PCPlus4F;

endmodule