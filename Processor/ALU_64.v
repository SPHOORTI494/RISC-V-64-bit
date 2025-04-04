module ALU (
    input [63:0] in1,
    input [63:0] in2,
    input [3:0] alu_control,
    output reg [63:0] alu_result,
    output reg zero_flag
);
    always @(*) begin
        case (alu_control)
            4'b0000: alu_result = in1 & in2;                         // Bitwise AND
            4'b0001: alu_result = in1 | in2;                         // Bitwise OR
            4'b0010: alu_result = in1 + in2;                         // Add
            4'b0100: alu_result = in1 - in2;                         // Subtract
            4'b1000: alu_result = (in1 < in2) ? 64'd1 : 64'd0;       // Set on less than
            4'b0011: alu_result = in1 << in2[5:0];                   // Shift left logical
            4'b0101: alu_result = in1 >> in2[5:0];                   // Shift right logical
            4'b0110: alu_result = in1 * in2;                         // Multiply
            4'b0111: alu_result = in1 ^ in2;                         // Bitwise XOR
            default: alu_result = 64'd0;
        endcase

        zero_flag = (alu_result == 64'd0) ? 1'b1 : 1'b0;
    end
endmodule
