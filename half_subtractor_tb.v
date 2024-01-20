`timescale 1ns/1ns  // Set the simulation timescale

module tb_half_subtractor;

  reg A, B;
  wire Difference, Borrow;

  // Instantiate the half subtractor module
  half_subtractor U1 (
    .A(A),
    .B(B),
    .Difference(Difference),
    .Borrow(Borrow)
  );

  // Stimulus generation
  initial begin
    $monitor("Time=%0t, A=%b, B=%b, Difference=%b, Borrow=%b", $time, A, B, Difference, Borrow);

    // Test case 1
    A = 0; B = 0; #10;

    // Test case 2
    A = 1; B = 0; #10;

    // Test case 3
    A = 0; B = 1; #10;

    // Test case 4
    A = 1; B = 1; #10;

    // End simulation
    $finish;
  end

endmodule
