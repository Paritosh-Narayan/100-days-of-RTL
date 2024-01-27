`timescale 1ns / 1ps

module tb_full_subtractor;

  // Inputs
  reg A, B, Cin;
  
  // Outputs
  wire Diff, Borrow;
  
  // Instantiate the full subtractor
  full_subtractor uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Diff(Diff),
    .Borrow(Borrow)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Test vectors
  initial begin
    // Test case 1
    A = 0; B = 0; Cin = 0;
    #10 $display("Test Case 1: A=%b, B=%b, Cin=%b, Diff=%b, Borrow=%b", A, B, Cin, Diff, Borrow);
    
    // Test case 2
    A = 1; B = 0; Cin = 0;
    #10 $display("Test Case 2: A=%b, B=%b, Cin=%b, Diff=%b, Borrow=%b", A, B, Cin, Diff, Borrow);
    
    // Test case 3
    A = 0; B = 1; Cin = 0;
    #10 $display("Test Case 3: A=%b, B=%b, Cin=%b, Diff=%b, Borrow=%b", A, B, Cin, Diff, Borrow);
    
    // Test case 4
    A = 1; B = 1; Cin = 0;
    #10 $display("Test Case 4: A=%b, B=%b, Cin=%b, Diff=%b, Borrow=%b", A, B, Cin, Diff, Borrow);
    
    // Test case 5
    A = 0; B = 0; Cin = 1;
    #10 $display("Test Case 5: A=%b, B=%b, Cin=%b, Diff=%b, Borrow=%b", A, B, Cin, Diff, Borrow);
    
    // Test case 6
    A = 1; B = 0; Cin = 1;
    #10 $display("Test Case 6: A=%b, B=%b, Cin=%b, Diff=%b, Borrow=%b", A, B, Cin, Diff, Borrow);
    
    // Test case 7
    A = 0; B = 1; Cin = 1;
    #10 $display("Test Case 7: A=%b, B=%b, Cin=%b, Diff=%b, Borrow=%b", A, B, Cin, Diff, Borrow);
    
    // Test case 8
    A = 1; B = 1; Cin = 1;
    #10 $display("Test Case 8: A=%b, B=%b, Cin=%b, Diff=%b, Borrow=%b", A, B, Cin, Diff, Borrow);
    
    // Add more test cases as needed

    // Stop simulation
    #10 $finish;
  end

endmodule
