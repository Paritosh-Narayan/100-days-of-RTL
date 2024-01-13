module basic_gates_using_nand (
  input wire A,
  input wire B,
  output wire AND_out,
  output wire OR_out,
  output wire XOR_out,
  output wire XNOR_out,
  output wire NOT_out,
  output wire Y
);

  wire NAND_AB, NAND_ABN, NAND_ABB, NAND_ABNB;

  // Implementing AND gate using NAND gates
  assign NAND_AB = ~(A & B);
  assign AND_out = ~(NAND_AB & NAND_AB);

  // Implementing OR gate using NAND gates
  assign NAND_ABN = ~(A & ~B);
  assign OR_out = ~(NAND_ABN & NAND_ABN);

  // Implementing XOR gate using NAND gates
  assign NAND_ABB = ~(A & B);
  assign XOR_out = ~(NAND_ABB & NAND_ABB);

  // Implementing XNOR gate using NAND gates
  assign NAND_ABNB = ~(A & ~B & ~A & B);
  assign XNOR_out = ~(NAND_ABNB & NAND_ABNB);

  // Implementing NOT gate using NAND gates
  assign NOT_out = ~(A & A);

  // Output Y is the result of NAND gate on XOR_out and XNOR_out
  assign Y = ~(XOR_out & XNOR_out);

endmodule
