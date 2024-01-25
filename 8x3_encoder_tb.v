module tb_encoder_8to3;

  reg [7:0] in_data;
  wire [2:0] out_data;

  // Instantiate the encoder module
  encoder_8to3 uut (
    .in_data(in_data),
    .out_data(out_data)
  );

  // Stimulus generation
  initial begin
    $monitor("Time=%0t in_data=%b out_data=%b", $time, in_data, out_data);

    // Test case 1: input with '1' at position 2
    in_data = 8'b00000100;
    #10;

    // Test case 2: input with '1' at position 5
    in_data = 8'b00100000;
    #10;

    // Test case 3: input with '1' at position 0
    in_data = 8'b00000001;
    #10;

    // Test case 4: input with '1' at position 7
    in_data = 8'b10000000;
    #10;

    // Test case 5: input with no '1'
    in_data = 8'b00000000;
    #10;

    // Add more test cases as needed

    $stop;
  end

endmodule
