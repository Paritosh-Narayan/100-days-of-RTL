module tb_mux_4to1;

  // Parameters
  parameter CLK_PERIOD = 10;  // Clock period in time units

  // Inputs
  reg [3:0] data_in;
  reg [1:0] sel;
  reg clk;

  // Outputs
  wire out_mux;

  // Instantiate the mux_4to1 module
  mux_4to1 uut (
    .data_in(data_in),
    .sel(sel),
    .out_mux(out_mux)
  );

  // Clock generation
  always begin
    #CLK_PERIOD/2 clk = ~clk;  // Generate a square wave with half the clock period
  end

  // Test stimulus
  initial begin
    // Initialize inputs
    data_in = 4'b0000;
    sel = 2'b00;

    // Apply inputs and observe outputs for a few clock cycles
    $display("Time \t Data In \t Select \t Output");
    for (int i = 0; i < 8; i = i + 1) begin
      $display("%0t \t %b \t\t %b \t\t %b", $time, data_in, sel, out_mux);
      #CLK_PERIOD data_in = data_in + 1;  // Increment data_in
    end

    // Finish simulation
    $stop;
  end

endmodule
