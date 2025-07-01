`timescale 1ns / 1ps

module Top_tb;

    reg CLK;
    integer i;

    // Instantiate Top module
    Top uut (
        .CLK(CLK)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #50 CLK = ~CLK; // 60ns clock period (16.7 MHz)
    end

    // Stimulus
    initial begin
        // ==== Register File Init ====
        for (i = 0; i < 32; i = i + 1)
            uut.D.RF.regfile[i] = i;  // Access through Decode stage

        // ==== Instruction Memory Load (No hazards) ====
        // ADD x5, x1, x2       // x5 = 1 + 2 = 3
        uut.F.IM.memory[0] = 32'b0000000_00010_00001_000_00101_0110011;

        // SUB x6, x3, x4       // x6 = 3 - 4 = -1
        uut.F.IM.memory[1] = 32'b0100000_00100_00011_000_00110_0110011;

        // AND x7, x9, x8       // x7 = 9 & 8 = 8 (no dependency on x5/x6)
        uut.F.IM.memory[2] = 32'b0000000_01000_01001_111_00111_0110011;

        // OR x10, x13, x12     // x10 = 13 | 12 = 13
        uut.F.IM.memory[3] = 32'b0000000_01100_01101_110_01010_0110011;

        // SLT x11, x15, x14    // x11 = (15 < 14) = 0
        uut.F.IM.memory[4] = 32'b0000000_01110_01111_010_01011_0110011;

        // ADDI x16, x0, 20     // x16 = 20
        uut.F.IM.memory[5] = {12'd20, 5'd0, 3'b000, 5'd16, 7'b0010011};

        // ANDI x17, x0, 15     // x17 = 0 & 15 = 0
        uut.F.IM.memory[6] = {12'd15, 5'd0, 3'b111, 5'd17, 7'b0010011};

        // ORI x18, x0, 31      // x18 = 0 | 31 = 31
        uut.F.IM.memory[7] = {12'd31, 5'd0, 3'b110, 5'd18, 7'b0010011};

        // SLTI x19, x0, 1      // x19 = (0 < 1) = 1
        uut.F.IM.memory[8] = {12'd1, 5'd0, 3'b010, 5'd19, 7'b0010011};

        // SW x2, 0(x20)        // MEM[x20] = x2 = 2
        uut.F.IM.memory[9] = {7'd0, 5'd2, 5'd20, 3'b010, 5'd0, 7'b0100011};

        // LW x21, 0(x20)       // x21 = MEM[x20] = 2
        uut.F.IM.memory[10] = {12'd0, 5'd20, 3'b010, 5'd21, 7'b0000011};

        // ADDI x22, x0, 99
        uut.F.IM.memory[11] = {12'd99, 5'd0, 3'b000, 5'd22, 7'b0010011};

        // ADDI x23, x0, 123
        uut.F.IM.memory[12] = {12'd123, 5'd0, 3'b000, 5'd23, 7'b0010011};

        // ==== Wait Enough Time for All Instructions ====
        #2000;

        // ==== Register File Dump ====
        $display("\n==== Register File Dump ====");
        for (i = 0; i < 32; i = i + 1)
            $display("x%0d = %0d", i, uut.D.RF.regfile[i]);

        // ==== Data Memory Check ====
        $display("\n==== Data Memory Check ====");
        $display("MEM[%0d] = %0d", uut.D.RF.regfile[20], uut.M.DM.memory[uut.D.RF.regfile[20] >> 2]);

        $finish;
    end

    // Waveform Dump for GTKWave
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, Top_tb);
    end

endmodule
