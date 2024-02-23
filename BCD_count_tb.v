
`timescale 1ns / 1ns // Define timescale

module BCD_counter_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns
parameter SIM_TIME = 100;  // Simulation time in ns

// Signals
reg clk;       // Clock signal
reg reset;     // Reset signal
wire [3:0] bcd_out; // BCD output

// Instantiate BCD_counter module
BCD_counter uut(
    .clk(clk),
    .reset(reset),
    .bcd_out(bcd_out)
);

// Clock generation
always #(CLK_PERIOD/2) clk = ~clk;

// Reset generation
initial begin
    reset = 1;
    #10 reset = 0;
end

// Stimulus
initial begin
    $dumpfile("BCD_counter_tb.vcd");
    $dumpvars(0, BCD_counter_tb);

    // Wait for some time to observe
    #20;

    // Start the counter
    reset = 0;

    // Monitor the BCD output
    $monitor("Time: %t, BCD Out: %b", $time, bcd_out);

    // Run for simulation time
    #SIM_TIME $finish;
end

endmodule
