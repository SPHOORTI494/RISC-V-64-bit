module CONTROL(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [3:0] alu_control,
    output reg regwrite_control
);
    always @(funct3 or funct7 or opcode)
    begin
        if (opcode == 7'b0110011) begin // R-type instructions for 64-bit

            regwrite_control = 1;

            case (funct3)
                3'b000: begin
                    if (funct7 == 7'b0000000)
                        alu_control = 4'b0010; // ADD
                    else if (funct7 == 7'b0100000)
                        alu_control = 4'b0100; // SUB
                end
                3'b110: alu_control = 4'b0001; // OR
                3'b111: alu_control = 4'b0000; // AND
                3'b001: alu_control = 4'b0011; // SLL (Shift Left Logical)
                3'b101: alu_control = 4'b0101; // SRL (Shift Right Logical)
                3'b010: alu_control = 4'b0110; // MUL
                3'b100: alu_control = 4'b0111; // XOR

                default: alu_control = 4'b0000; // Default to AND for safety
            endcase
        end
        else begin
            regwrite_control = 0;
            alu_control = 4'b0000; // Default to AND when no valid opcode
        end
    end
endmodule
