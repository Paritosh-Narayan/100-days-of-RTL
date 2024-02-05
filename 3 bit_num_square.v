module Square_Circuit(
  input [2:0] input_number,
  output reg [5:0] output_square
);

  // ROM for storing square values
  reg [5:0] square_rom [7:0]; // 3-bit input can have 8 combinations (2^3)
  
  // Initialize ROM with square values
  initial begin
    square_rom[0] = 6'b000000;
    square_rom[1] = 6'b000001;
    square_rom[2] = 6'b000100;
    square_rom[3] = 6'b001001;
    square_rom[4] = 6'b010000;
    square_rom[5] = 6'b100001;
    square_rom[6] = 6'b110100;
    square_rom[7] = 6'b111001;
  end

  // Behavioral modeling of the circuit
  always @(input_number) begin
    output_square <= square_rom[input_number];
  end
