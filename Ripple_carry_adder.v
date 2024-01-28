module ripple_carry_adder(
  input [3:0] A,  // 4-bit input operand A
  input [3:0] B,  // 4-bit input operand B
  input Cin,      // Carry input
  output [3:0] Sum, // 4-bit output sum
  output Cout     // Carry output
);

  // Internal signals
  wire [3:0] Sum_int; // Intermediate sum bits
  wire [3:0] Cout_int; // Intermediate carry bits

  // Full adder module
  full_adder fa0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum_int[0]), .Cout(Cout_int[0]));
  full_adder fa1 (.A(A[1]), .B(B[1]), .Cin(Cout_int[0]), .Sum(Sum_int[1]), .Cout(Cout_int[1]));
  full_adder fa2 (.A(A[2]), .B(B[2]), .Cin(Cout_int[1]), .Sum(Sum_int[2]), .Cout(Cout_int[2]));
  full_adder fa3 (.A(A[3]), .B(B[3]), .Cin(Cout_int[2]), .Sum(Sum_int[3]), .Cout(Cout_int[3]));

  // Output assignments
  assign Sum = Sum_int;
  assign Cout = Cout_int[3];

endmodule

// Full adder module
module full_adder(
  input A,  // Input bit A
  input B,  // Input bit B
  input Cin,  // Carry input
  output Sum, // Sum output
  output Cout // Carry output
);

  assign Sum = A ^ B ^ Cin;
  assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule
