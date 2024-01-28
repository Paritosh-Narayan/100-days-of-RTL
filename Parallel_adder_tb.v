`timescale 1ns/1ps  // Set timescale for simulation

module tb_ParallelAdder;

  // Inputs
  reg [7:0] A, B;
  reg Cin;

  // Outputs
  wire [7:0] Sum;
  wire Cout;

  // Instantiate the parallel adder
  ParallelAdder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Clock generation
  reg clk;
  always begin
    #5 clk = ~clk;
  end

  // Testbench stimulus
  initial begin
    // Initialize inputs
    A = 8'b01101010;
    B = 8'b11011011;
    Cin = 0;
    clk = 0;

    // Apply inputs and clock
    #10 A = 8'b10101010;
    #10 B = 8'b00110011;
    #10 Cin = 1;

    // Display results
    $display("Input A = %b", A);
    $display("Input B = %b", B);
    $display("Input Cin = %b", Cin);
    $display("Expected Sum = %b", A + B + Cin);
    $display("Actual Sum = %b", Sum);
    $display("Expected Cout = %b", (A + B + Cin) > 255);
    $display("Actual Cout = %b", Cout);

    // End simulation
    #10 $finish;
  end

endmodule
