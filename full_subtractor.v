module full_subtractor (
  input A,  // Minuend
  input B,  // Subtrahend
  input Bin,  // Borrow input
  output D,  // Difference
  output Bout  // Borrow output
);

  assign D = A ^ B ^ Bin;    // Difference
  assign Bout = (~A & B) | (~A & Bin) | (B & Bin);  // Borrow output

endmodule
