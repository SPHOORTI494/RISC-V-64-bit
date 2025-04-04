`include "PROCESSOR.v"

module stimulus;

    reg clock;
    reg reset;
    wire zero;

    // Instantiate the processor
    PROCESSOR test_processor (
        .clock(clock),
        .reset(reset),
        .zero(zero)
    );

    // Clock generation: Toggle every 20 time units (period = 40)
    initial begin
        clock = 0;
        forever #20 clock = ~clock;
    end

    // Reset logic
    initial begin
        reset = 1;
        #50 reset = 0;
    end

    // Dump waveforms for GTKWave viewing
    initial begin
        $dumpfile("output_wave.vcd");
        $dumpvars(0, stimulus);
    end

    // Run simulation for 300 time units
    initial #300 $finish;

endmodule
