`timescale 1ns / 1ns

module pipo_shift_register_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns
    
    // Signals
    reg clk;
    reg reset;
    reg [3:0] parallel_in;
    reg shift;
    wire [3:0] parallel_out;
    
    // Instantiate the PIPO shift register
    pipo_shift_register dut (
        .clk(clk),
        .reset(reset),
        .parallel_in(parallel_in),
        .shift(shift),
        .parallel_out(parallel_out)
    );
    
    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;
    
    // Stimulus
    initial begin
        $dumpfile("pipo_shift_register.vcd");
        $dumpvars(0, pipo_shift_register_tb);
        
        // Initialize inputs
        reset = 1;
        parallel_in = 4'b0000;
        shift = 0;
        #20 reset = 0;
        
        // Test case 1: Parallel input
        parallel_in = 4'b1010;
        shift = 0;
        #20;
        
        // Test case 2: Shift operation
        shift = 1;
        #20;
        
        // Test case 3: Parallel input again
        parallel_in = 4'b0110;
        shift = 0;
        #20;
        
        // End simulation
        $finish;
    end

endmodule
