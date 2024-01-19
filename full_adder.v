module full_adder(
  input wire a, b, cin,
  output wire sum, cout
);

  assign sum = a ^ b ^ cin;  // XOR operation for sum
  assign cout = (a & b) | (b & cin) | (a & cin);  // OR of AND operations for carry

endmodule
