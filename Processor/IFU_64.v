`include "INST_MEM.v"

module IFU (
    input clock,
    input reset,
    output [31:0] Instruction_Code
);

    reg [63:0] PC = 64'b0;  // 64-bit Program Counter initialized to 0

    // Instruction memory module expects 64-bit PC as address, returns 32-bit instruction
    INST_MEM instr_mem (
        .address(PC),
        .reset(reset),
        .instruction(Instruction_Code)
    );

    always @(posedge clock or posedge reset) begin
        if (reset)
            PC <= 64'b0;
        else
            PC <= PC + 64'd4;  // Increment by 4 (size of instruction)
    end

endmodule
