module CONTROL (
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [3:0] alu_control,
    output reg regwrite_control
);
    always @(*) begin
        // Default values
        alu_control = 4'b0000;
        regwrite_control = 0;

        if (opcode == 7'b0110011) begin // R-type instructions
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
                3'b001: alu_control = 4'b0011; // SLL
                3'b101: alu_control = 4'b0101; // SRL
                3'b010: alu_control = 4'b0110; // MUL (assumed custom encoding)
                3'b100: alu_control = 4'b0111; // XOR
                default: alu_control = 4'b0000; // Default safe op
            endcase
        end
    end
endmodule
