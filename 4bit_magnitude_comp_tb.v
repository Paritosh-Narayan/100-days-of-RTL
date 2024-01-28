module tb_MagnitudeComparator;

  // Inputs
  reg [3:0] A, B;

  // Outputs
  wire A_greater_than_B, A_less_than_B, A_equal_to_B;

  // Instantiate the Magnitude Comparator
  MagnitudeComparator uut (
    .A(A),
    .B(B),
    .A_greater_than_B(A_greater_than_B),
    .A_less_than_B(A_less_than_B),
    .A_equal_to_B(A_equal_to_B)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    $dumpfile("tb_MagnitudeComparator.vcd");
    $dumpvars(0, tb_MagnitudeComparator);

    // Test case 1
    A = 4'b0110;
    B = 4'b0011;
    #10;

    // Test case 2
    A = 4'b1101;
    B = 4'b1010;
    #10;

    // Test case 3
    A = 4'b0011;
    B = 4'b1100;
    #10;

    // Add more test cases as needed

    $finish;
  end

endmodule
