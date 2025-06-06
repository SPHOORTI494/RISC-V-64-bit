/*
Instruction memory for RV64:
- Takes a 64-bit Program Counter (PC) and 1-bit reset signal.
- Outputs 32-bit RISC-V instruction corresponding to current PC.
- Initializes memory when reset = 1.
*/

module INST_MEM(
    input [63:0] PC,               // 64-bit PC input for RV64
    input reset,
    output [31:0] Instruction_Code
);

    reg [7:0] Memory [0:31];       // 8-bit memory cells (byte-addressable), 32 locations

    // Assign 32-bit instruction using little-endian format
    assign Instruction_Code = {Memory[PC+3], Memory[PC+2], Memory[PC+1], Memory[PC]};

    // Initialize memory on reset
    always @(reset) begin
        if (reset == 1) begin
            // add t1, s0, s1 => 0x00940333
            Memory[3]  = 8'h00;
            Memory[2]  = 8'h94;
            Memory[1]  = 8'h03;
            Memory[0]  = 8'h33;

            // sub t2, s2, s3 => 0x413903b3
            Memory[7]  = 8'h41;
            Memory[6]  = 8'h39;
            Memory[5]  = 8'h03;
            Memory[4]  = 8'hb3;

            // mul t0, s4, s5 => 0x035a02b3
            Memory[11] = 8'h03;
            Memory[10] = 8'h5a;
            Memory[9]  = 8'h02;
            Memory[8]  = 8'hb3;

            // xor t3, s6, s7 => 0x017b4e33
            Memory[15] = 8'h01;
            Memory[14] = 8'h7b;
            Memory[13] = 8'h4e;
            Memory[12] = 8'h33;

            // sll t4, s8, s9
            Memory[19] = 8'h01;
            Memory[18] = 8'h9c;
            Memory[17] = 8'h1e;
            Memory[16] = 8'hb3;

            // srl t5, s10, s11
            Memory[23] = 8'h01;
            Memory[22] = 8'hbd;
            Memory[21] = 8'h5f;
            Memory[20] = 8'h33;

            // and t6, a2, a3
            Memory[27] = 8'h00;
            Memory[26] = 8'hd6;
            Memory[25] = 8'h7f;
            Memory[24] = 8'hb3;

            // or a7, a4, a5
            Memory[31] = 8'h00;
            Memory[30] = 8'hf7;
            Memory[29] = 8'h68;
            Memory[28] = 8'hb3;
        end
    end

endmodule
