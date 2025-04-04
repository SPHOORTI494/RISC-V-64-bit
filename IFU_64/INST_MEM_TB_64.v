`include "INST_MEM.v"

module stimulus ();
    reg [63:0] PC;               // 64-bit PC for RV64
    reg RESET;
    wire [31:0] INST_CODE;       // Instructions still 32-bit

    // Instantiating instruction memory module
    INST_MEM INST_MEM_module(PC, RESET, INST_CODE);

    // Setting up waveform
    initial begin
        $dumpfile("INST_MEM_output_wave.vcd");
        $dumpvars(0, stimulus);
    end

    // Monitoring signal values
    initial
    $monitor($time, " Instruction code = %h, PC = %d", INST_CODE, PC);

    // Test sequence
    initial begin
        RESET = 1'b0;
        #20 RESET = 1'b1;     // Trigger memory initialization
        #20 PC = 64'd0;
        #20 PC = 64'd4;
        #20 PC = 64'd8;
        #20 PC = 64'd12;
        #20 PC = 64'd16;
        #20 PC = 64'd20;
        #20 PC = 64'd24;
        #20 PC = 64'd28;
    end

    // End simulation
    initial
    #200 $finish;

endmodule
