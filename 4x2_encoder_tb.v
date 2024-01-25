module tb_encoder_4to2;

  // Parameters
  parameter CLK_PERIOD = 10;  // Clock period in simulation time units

  // Signals
  reg [3:0] data_in;
  wire [1:0] encoded_output;

  // Instantiate the encoder module
  encoder_4to2 uut (
    .data_in(data_in),
    .encoded_output(encoded_output)
  );

  // Clock generation
  reg clk = 0;
  always #((CLK_PERIOD)/2) clk = ~clk;

  // Test stimulus
  initial begin
    // Initialize inputs
    data_in = 4'b0000;

    // Apply test vectors
    #10 data_in = 4'b0001;
    #10 data_in = 4'b0010;
    #10 data_in = 4'b0100;
    #10 data_in = 4'b1000;
    #10 data_in = 4'b1100;

    // Add more test vectors as needed

    // Finish simulation
    #10 $finish;
  end

endmodule
