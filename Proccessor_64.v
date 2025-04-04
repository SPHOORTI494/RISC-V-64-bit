`include "CONTROL.v"
`include "DATAPATH.v"
`include "IFU.v"

module PROCESSOR( 
    input clock, 
    input reset,
    output zero
);

    wire [31:0] instruction_code;   // RISC-V instructions are 32-bit
    wire [3:0] alu_control;
    wire regwrite;

    // Instruction Fetch
    IFU IFU_module(
        clock, 
        reset, 
        instruction_code
    );

    // Instruction Decode / Control
    CONTROL control_module(
        instruction_code[31:25], 
        instruction_code[14:12],
        instruction_code[6:0], 
        alu_control, 
        regwrite
    );

    // Execute / Datapath (64-bit)
    DATAPATH datapath_module(
        instruction_code[19:15],   // rs1
        instruction_code[24:20],   // rs2
        instruction_code[11:7],    // rd
        alu_control, 
        regwrite, 
        clock, 
        reset, 
        zero
    );

endmodule
