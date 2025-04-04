`include "INST_MEM.v"

module IFU(
    input clock, reset,
    output [31:0] Instruction_Code  // Still 32-bit, as RISC-V instructions are 32-bit even in RV64
);
    reg [63:0] PC = 64'd0;  // 64-bit Program Counter

    // Instantiate instruction memory module
    INST_MEM instr_mem(PC[9:2], reset, Instruction_Code);  // Use 8-bit index for 256-entry memory

    always @(posedge clock or posedge reset) begin
        if (reset)
            PC <= 64'd0;
        else
            PC <= PC + 64'd4;  // Increment by 4 bytes (standard instruction size)
    end
endmodule
