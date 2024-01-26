module tb_Decoder_2to4;

  reg [1:0] in;
  wire [3:0] out;

  Decoder_2to4 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: in = 2'b00
    in = 2'b00;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 2: in = 2'b01
    in = 2'b01;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 3: in = 2'b10
    in = 2'b10;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 4: in = 2'b11
    in = 2'b11;
    #10 $display("Input: %b, Output: %b", in, out);

    // Add more test cases as needed

    // Terminate simulation
    #10 $finish;
  end

endmodule
