module testbench;

// Parameters
parameter CLK_PERIOD = 10;

// Signals
reg [3:0] data_in;
wire [7:0] encoded_data;

// Instantiate the Hamming encoder
hamming_encoder encoder (
    .data_in(data_in),
    .encoded_data(encoded_data)
);

// Clock generation
reg clk = 0;
always #((CLK_PERIOD / 2)) clk = ~clk;

// Test stimulus
integer i;
initial begin
    $monitor("Time=%0t, Input=%b, Encoded=%b", $time, data_in, encoded_data);
    
    // Test all possible input combinations
    for (i = 0; i < 16; i = i + 1) begin
        data_in = i;
        #10; // Delay for one clock cycle
    end
    
    // End simulation after all input combinations are tested
    $finish;
end

// Clock driver
always #((CLK_PERIOD)) clk <= ~clk;

endmodule
