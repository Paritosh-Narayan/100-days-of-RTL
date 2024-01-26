module tb_Decoder_3to8;

  reg [2:0] in;
  wire [7:0] out;

  Decoder_3to8 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: in = 3'b000
    in = 3'b000;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 2: in = 3'b001
    in = 3'b001;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 3: in = 3'b010
    in = 3'b010;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 4: in = 3'b011
    in = 3'b011;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 5: in = 3'b100
    in = 3'b100;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 6: in = 3'b101
    in = 3'b101;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 7: in = 3'b110
    in = 3'b110;
    #10 $display("Input: %b, Output: %b", in, out);

    // Test case 8: in = 3'b111
    in = 3'b111;
    #10 $display("Input: %b, Output: %b", in, out);

    // Add more test cases as needed

    // Terminate simulation
    #10 $finish;
  end

endmodule
