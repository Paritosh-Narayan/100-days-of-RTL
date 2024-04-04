`timescale 1ns / 1ps

module tb_clock_buffer;

  // Inputs
  reg clk_in;

  // Outputs
  wire clk_out;

  // Instantiate the clock buffer module
  clock_buffer dut (
    .clk_in(clk_in),
    .clk_out(clk_out)
  );

  // Clock generation
  always #5 clk_in = ~clk_in; // Inverting the clock every 5 time units

  initial begin
    // Initialize inputs
    clk_in = 0;

    // Monitor the clock output
    $monitor("Time=%t, clk_out=%b", $time, clk_out);

    // Run simulation for 100 time units
    #100 $finish;
  end

endmodule
