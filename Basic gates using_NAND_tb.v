module tb_basic_gates_using_nand;

  reg A, B;
  wire AND_out, OR_out, XOR_out, XNOR_out, NOT_out, Y;

  // Instantiate the basic_gates_using_nand module
  basic_gates_using_nand uut (
    .A(A),
    .B(B),
    .AND_out(AND_out),
    .OR_out(OR_out),
    .XOR_out(XOR_out),
    .XNOR_out(XNOR_out),
    .NOT_out(NOT_out),
    .Y(Y)
  );

  // Testbench stimulus
  initial begin
    $dumpfile("tb_basic_gates_using_nand.vcd");  // VCD file for waveform viewing
    $dumpvars(0, tb_basic_gates_using_nand);

    // Test case 1
    A = 1; B = 0;
    #10;  // Wait for 10 time units
    // Expected AND_out = 0, OR_out = 1, XOR_out = 1, XNOR_out = 0, NOT_out = 0, Y = 0

    // Test case 2
    A = 1; B = 1;
    #10;
    // Expected AND_out = 1, OR_out = 1, XOR_out = 0, XNOR_out = 1, NOT_out = 0, Y = 0

    // Test case 3
    A = 0; B = 1;
    #10;
    // Expected AND_out = 0, OR_out = 1, XOR_out = 1, XNOR_out = 0, NOT_out = 1, Y = 1

    // Add more test cases as needed...

    $finish;  // Finish simulation
  end

endmodule
