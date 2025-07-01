`include "ResultSrcMux.v"

module WriteBack(
    input wire RegWriteW,
    input wire ResultSrcW,
    input wire [31:0] ALUResultW,
    input wire [31:0] ReadDataW,
    input wire [4:0] RdW,
    input wire [31:0] PCPlus4W,
    output wire Pass_RegWriteW,
    output wire [4:0] Pass_RdW,
    output wire [31:0] ResultW
);

    ResultSrcMux M3 (
        .ResultSrc(ResultSrcW),
        .ALUResult(ALUResultW),
        .RD(ReadDataW),
        .Result(ResultW)
    );

    assign Pass_RegWriteW = RegWriteW;
    assign Pass_RdW = RdW;

endmodule