module tb_bcd_to_excess3;

reg clk, rst;
reg [3:0] bcd_input;
wire [3:0] excess3_output;

// Instantiate the module
bcd_to_excess3 uut (
    .bcd_input(bcd_input),
    .excess3_output(excess3_output)
);

// Clock generation
always begin
    #5 clk = ~clk;
end

// Stimulus generation
initial begin
    clk = 0;
    rst = 1;
    bcd_input = 4'b0000;

    // Apply reset
    #10 rst = 0;

    // Test case 1: BCD input 0
    #10 bcd_input = 4'b0000;

    // Test case 2: BCD input 5
    #10 bcd_input = 4'b0101;

    // Test case 3: BCD input 9
    #10 bcd_input = 4'b1001;

    // Add more test cases as needed

    #100 $finish; // Finish simulation after 100 time units
end

// Display results
always @(posedge clk) begin
    $display("Time=%0t bcd_input=%b excess3_output=%b", $time, bcd_input, excess3_output);
end

endmodule
