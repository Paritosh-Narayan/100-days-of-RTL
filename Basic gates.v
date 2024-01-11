module and_gate (
  input wire a,
  input wire b,
  output reg y
);

  always @(a, b)
    y = a & b;

endmodule
module or_gate (
  input wire a,
  input wire b,
  output reg y
);

  always @(a, b)
    y = a | b;

endmodule
XOR gate:

module xor_gate (
  input wire a,
  input wire b,
  output reg y
);

  always @(a, b)
    y = a ^ b;

endmodule

module not_gate (
  input wire a,
  output reg y
);

  always @(a)
    y = ~a;

endmodule


module xnor_gate (
  input wire a,
  input wire b,
  output reg y
);

  always @(a, b)
    y = ~(a ^ b);

endmodule
