/*
A 64-bit RISC-V register file with 32 registers, each 64 bits wide.
Supports two reads and one write per clock cycle.
*/

module REG_FILE(
    input [4:0] read_reg_num1,
    input [4:0] read_reg_num2,
    input [4:0] write_reg,
    input [63:0] write_data,
    output [63:0] read_data1,
    output [63:0] read_data2,
    input regwrite,
    input clock,
    input reset
);

    reg [63:0] reg_memory [31:0];  // 32 registers, each 64 bits wide

    // Initialize registers on reset
    always @(posedge reset) begin
        reg_memory[0]  = 64'h0;
        reg_memory[1]  = 64'h1;
        reg_memory[2]  = 64'h2;
        reg_memory[3]  = 64'h3;
        reg_memory[4]  = 64'h4;
        reg_memory[5]  = 64'h5;
        reg_memory[6]  = 64'h6;
        reg_memory[7]  = 64'h7;
        reg_memory[8]  = 64'h8;
        reg_memory[9]  = 64'h9;
        reg_memory[10] = 64'hA;
        reg_memory[11] = 64'hB;
        reg_memory[12] = 64'hC;
        reg_memory[13] = 64'hD;
        reg_memory[14] = 64'hE;
        reg_memory[15] = 64'hF;
        reg_memory[16] = 64'h10;
        reg_memory[17] = 64'h11;
        reg_memory[18] = 64'h12;
        reg_memory[19] = 64'h13;
        reg_memory[20] = 64'h14;
        reg_memory[21] = 64'h15;
        reg_memory[22] = 64'h16;
        reg_memory[23] = 64'h17;
        reg_memory[24] = 64'h18;
        reg_memory[25] = 64'h19;
        reg_memory[26] = 64'h1A;
        reg_memory[27] = 64'h1B;
        reg_memory[28] = 64'h1C;
        reg_memory[29] = 64'h1D;
        reg_memory[30] = 64'h1E;
        reg_memory[31] = 64'h1F;
    end

    // Always read from registers (combinational logic)
    assign read_data1 = reg_memory[read_reg_num1];
    assign read_data2 = reg_memory[read_reg_num2];

    // Register write on positive clock edge if regwrite is high
    always @(posedge clock) begin
        if (regwrite) begin
            reg_memory[write_reg] <= write_data;
        end
    end

endmodule
