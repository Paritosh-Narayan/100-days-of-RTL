`timescale 1ns/1ps

module siso_testbench;

  // Inputs
  reg clk;
  reg rst;
  reg a;

  // Outputs
  wire q;

  // Instantiate the siso module
  siso my_siso (
    .clk(clk),
    .rst(rst),
    .a(a),
    .q(q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initial block for stimulus generation
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    a = 0;

    // Apply reset
    #10 rst = 0;

    // Test case 1
    #10 a = 1;
    #10 a = 0;
    #10 a = 1;

    // Test case 2
    #10 rst = 1;
    #10 a = 0;
    #10 a = 1;
    #10 a = 0;

    // Add more test cases as needed

    // Finish simulation
    #10 $finish;
  end

endmodule
