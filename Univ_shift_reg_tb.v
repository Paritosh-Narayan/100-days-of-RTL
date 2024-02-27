`timescale 1ns / 1ps

module testbench;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns
    
    // Signals
    reg clk;
    reg reset;
    reg shift_left;
    reg shift_right;
    reg parallel_load;
    reg [7:0] data_in;
    reg enable;
    wire [7:0] data_out;
    
    // Instantiate the DUT
    universal_shift_register dut (
        .clk(clk),
        .reset(reset),
        .shift_left(shift_left),
        .shift_right(shift_right),
        .parallel_load(parallel_load),
        .data_in(data_in),
        .enable(enable),
        .data_out(data_out)
    );
    
    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;
    
    // Initial values
    initial begin
        clk = 0;
        reset = 1;
        shift_left = 0;
        shift_right = 0;
        parallel_load = 0;
        data_in = 8'b0;
        enable = 0;
        
        // Reset
        #20 reset = 0;
        
        // Test case 1: Parallel load
        #10 parallel_load = 1;
        #10 data_in = 8'b10101010; // Load data 10101010
        #10 enable = 1; // Enable shifting
        #50 enable = 0; // Disable shifting
        
        // Test case 2: Shift left
        #10 shift_left = 1;
        #50 shift_left = 0;
        
        // Test case 3: Shift right
        #10 shift_right = 1;
        #50 shift_right = 0;
        
        // End simulation
        #10 $finish;
    end
    
    // Display simulation results
    initial begin
        $monitor("Time=%0t, Data Out=%b", $time, data_out);
    end

endmodule
