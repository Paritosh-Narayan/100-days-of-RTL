module MagnitudeComparator(
  input [3:0] A, B,
  output A_greater_than_B,
  output A_less_than_B,
  output A_equal_to_B
);

  assign A_greater_than_B = (A > B);
  assign A_less_than_B = (A < B);
  assign A_equal_to_B = (A == B);

endmodule
