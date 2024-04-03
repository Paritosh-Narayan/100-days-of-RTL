module water_level_indicator_tb;

  reg [7:0] water_level_inputs;
  wire [2:0] water_level_output;

  water_level_indicator dut (
    .water_level_inputs(water_level_inputs),
    .water_level_output(water_level_output)
  );

  initial begin
    // Test case 1: No sensors active
    water_level_inputs = 8'b00000000;
    #10;
    // Expected output: water_level_output = 3'b000

    // Test case 2: Only sensor 1 active
    water_level_inputs = 8'b11111110;
    #10;
    // Expected output: water_level_output = 3'b000

    // Test case 3: Sensors 1 and 2 active
    water_level_inputs = 8'b11111101;
    #10;
    // Expected output: water_level_output = 3'b001

    // Test case 4: Sensors 1, 2, and 3 active
    water_level_inputs = 8'b11111011;
    #10;
    // Expected output: water_level_output = 3'b010

    // Test case 5: Sensors 1, 2, 3, and 4 active
    water_level_inputs = 8'b11110111;
    #10;
    // Expected output: water_level_output = 3'b011

    // Add more test cases as needed
  end

endmodule
