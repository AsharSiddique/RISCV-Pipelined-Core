module IF_ID(
    input wire CLK,
    input wire [31:0] RD,
    input wire [31:0] PCF,
    input wire [31:0] PCPlus4F,
    output reg [31:0] InstrD,
    output reg [31:0] PCD,
    output reg [31:0] PCPlus4D
);

    always @(posedge CLK) begin
        InstrD <= RD;
        PCD <= PCF;
        PCPlus4D <= PCPlus4F;
    end

endmodule