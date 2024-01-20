module half_subtractor (
  input A,
  input B,
  output Difference,
  output Borrow
);

  assign Difference = A ^ B;  // XOR operation for Difference
  assign Borrow = ~A & B;    // AND operation with complement for Borrow

endmodule
