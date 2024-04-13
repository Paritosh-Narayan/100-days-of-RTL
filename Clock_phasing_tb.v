`timescale 1ns / 1ps

module ClockPhasing_tb;
    // Clock and reset signals
    reg clk;
    reg reset;

    // DUT instantiation
    ClockPhasing dut (
        .clk(clk),
        .delayed_clk(delayed_clk)
    );

    // Output to monitor
    wire delayed_clk;

    // Generate the clock
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Generate the reset
    initial begin
        reset = 1'b1;
        #10 reset = 1'b0;
    end

    // Test stimulus
    initial begin
        // Use the monitor task to display the output
        $monitor("At time %t, delayed_clk=%b", $time, delayed_clk);

        // Wait for the reset to complete
        #20;

        // Apply test inputs and monitor the output
        #100; // Wait for 100 clock cycles
    end

endmodule 
