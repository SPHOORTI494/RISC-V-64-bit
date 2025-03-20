module ALU (
    input [63:0] in1, in2, 
    input [3:0] alu_control,
    output reg [63:0] alu_result,
    output reg zero_flag
);
    always @(*)
    begin
        // Operating based on control input
        case(alu_control)

        4'b0000: alu_result = in1 & in2;  // Bitwise-AND
        4'b0001: alu_result = in1 | in2;  // Bitwise-OR
        4'b0010: alu_result = in1 + in2;  // Add (A+B)
        4'b0100: alu_result = in1 - in2;  // Subtract (A-B)
        4'b1000: begin                     // Set on less than
            if (in1 < in2)
                alu_result = 1;
            else
                alu_result = 0;
        end
        4'b0011: alu_result = in1 << in2;  // Shift left logical
        4'b0101: alu_result = in1 >> in2;  // Shift right logical
        4'b0110: alu_result = in1 * in2;   // Multiply
        4'b0111: alu_result = in1 ^ in2;   // Bitwise-XOR

        default: alu_result = 64'b0;       // Default to zero on undefined control
        endcase

        // Setting Zero_flag if ALU_result is zero
        zero_flag = (alu_result == 0) ? 1'b1 : 1'b0;
    end
endmodule
