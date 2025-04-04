`include "REG_FILE.v"

module stimulus ();
    reg [4:0] read_reg_num1;
    reg [4:0] read_reg_num2;
    reg [4:0] write_reg;
    reg [63:0] write_data;              // Changed to 64-bit
    wire [63:0] read_data1;             // Changed to 64-bit
    wire [63:0] read_data2;             // Changed to 64-bit
    reg regwrite;
    reg clock;
    reg reset;
    
    // Instantiating register file module
    REG_FILE REG_FILE_module(
        read_reg_num1,
        read_reg_num2,
        write_reg,
        write_data,
        read_data1,
        read_data2,
        regwrite,
        clock,
        reset
    );

    // Setting up output waveform
    initial begin
        $dumpfile("output_wave.vcd");
        $dumpvars(0, stimulus);
    end

    // Initializing the registers with reset
    initial begin
        reset = 1;
        #10 reset = 0;
    end

    // Writing values to different registers
    initial begin
        regwrite = 0;
        #10
        regwrite = 1; write_data = 64'd100; write_reg = 0;  // x0 always stays 0, will ignore write
        #10
        regwrite = 1; write_data = 64'd200; write_reg = 1;
        #10
        regwrite = 1; write_data = 64'd300; write_reg = 2;
        #10;
    end

    // Reading values of different registers
    initial begin
        #10 read_reg_num1 = 0; read_reg_num2 = 0;
        #10 read_reg_num1 = 0; read_reg_num2 = 1;
        #10 read_reg_num1 = 0; read_reg_num2 = 2;
        #10 read_reg_num1 = 1; read_reg_num2 = 2;
    end

    // Clock generation
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

    // End simulation after 200 time units
    initial begin
        #200 $finish;
    end

endmodule
