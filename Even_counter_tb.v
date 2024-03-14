`timescale 1ns / 1ps

module even_counter_tb;

reg clk, reset;
wire [3:0] count;

// Instantiate even_counter module
even_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Clock generation
always begin
    clk = 0;
    #5;  // Half clock period
    clk = 1;
    #5;  // Half clock period
end

initial begin
    // Reset assertion
    reset = 1;
    #10;  // Assert reset for 10 time units
    reset = 0;

    // Simulation time
    #50;  // Simulate for 50 time units

    // End simulation
    $finish;
end

endmodule
