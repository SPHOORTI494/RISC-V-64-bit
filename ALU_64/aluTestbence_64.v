`include "ALU.v"

module stimulus ();
    reg [63:0] A, B;
    reg [3:0] ALUControl;
    wire ZERO;
    wire [63:0] ALUResult;

    // Instantiating modules
    ALU ALU_module(.in1(A), .in2(B), .alu_control(ALUControl), .zero_flag(ZERO), .alu_result(ALUResult));

    // Setting up waveform
    initial begin
        $dumpfile("output_wave.vcd");
        $dumpvars(0, stimulus);
    end

    // Monitoring changing values
    initial
    $monitor($time, "\nInput_1 = %b, \nInput_2 = %b,\nALU_control = %b,\nALU_result = %b, Zero_flag = %b\n",
             A, B, ALUControl, ALUResult, ZERO);

    // Test conditions
    initial begin
        A = 64'd23; B = 64'd42; ALUControl = 4'b0000;
    #20 A = 64'd23; B = 64'd42; ALUControl = 4'b0001;
    #20 A = 64'd23; B = 64'd42; ALUControl = 4'b0010;
    #20 A = 64'd23; B = 64'd42; ALUControl = 4'b0100;
    #20 A = 64'd23; B = 64'd42; ALUControl = 4'b1000;
    #20 A = 64'd42; B = 64'd23; ALUControl = 4'b1000;
    #20 A = 64'd42; B = 64'd23; ALUControl = 4'b0100;
    end

    // Finish after 150 time units
    initial
    #150 $finish;

endmodule
