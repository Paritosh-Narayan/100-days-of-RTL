module ParallelAdder(
  input [7:0] A, B,  // 8-bit inputs
  input Cin,         // Carry-in
  output [7:0] Sum,   // 8-bit sum
  output Cout         // Carry-out
);

  // Internal signals
  wire [7:0] Sum_intermediate;  // Intermediate sum
  wire Cout_intermediate;       // Intermediate carry-out

  // Ripple Carry Adder logic
  assign {Cout_intermediate, Sum_intermediate} = A + B + Cin;

  // Output signals
  assign Sum = Sum_intermediate;
  assign Cout = Cout_intermediate;

endmodule
