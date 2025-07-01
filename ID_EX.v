module ID_EX(
    input wire CLK,
    input wire RegWriteD,
    input wire ResultSrcD,
    input wire MemWriteD,
    input wire BranchD,
    input wire [2:0] ALUControlD,
    input wire ALUSrcD,
    input wire [31:0] Pass_PCD,
    input wire [31:0] Pass_PCPlus4D,
    input wire [31:0] RD1D,
    input wire [31:0] RD2D,
    input wire [4:0] RdD,
    input wire [31:0] ImmExtD,
    output reg RegWriteE,
    output reg ResultSrcE,
    output reg MemWriteE,
    output reg BranchE,
    output reg [2:0] ALUControlE,
    output reg ALUSrcE,
    output reg [31:0] PCE,
    output reg [31:0] PCPlus4E,
    output reg [31:0] RD1E,
    output reg [31:0] RD2E,
    output reg [4:0] RdE,
    output reg [31:0] ImmExtE
);

    always @(posedge CLK) begin
        RegWriteE <= RegWriteD;
        ResultSrcE <= ResultSrcD;
        MemWriteE <= MemWriteD;
        BranchE <= BranchD;
        ALUControlE <= ALUControlD;
        ALUSrcE <= ALUSrcD;
        PCE <= Pass_PCD;
        PCPlus4E <= Pass_PCPlus4D;
        RD1E <= RD1D;
        RD2E <= RD2D;
        RdE <= RdD;
        ImmExtE <= ImmExtD;
    end

endmodule