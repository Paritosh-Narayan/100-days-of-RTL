module testbench;

reg clk;
reg rst;
reg load;
reg [3:0] data;
wire [3:0] count;

// Instantiate the counter
synchronous_counter counter_inst (
    .clk(clk),
    .rst(rst),
    .load(load),
    .data(data),
    .count(count)
);

// Clock generation
always #5 clk = ~clk;

// Stimulus
initial begin
    clk = 0;
    rst = 1; load = 0; data = 4'b0000; #10;
    rst = 0; #10;

    // Test normal counting
    load = 0; #10;  // Count up
    load = 0; #10;
    load = 0; #10;
    load = 0; #10;
    
    // Test loading
    load = 1; data = 4'b1010; #10;  // Load 10
    load = 0; #10;  // Count up from 10
    load = 0; #10;
    load = 0; #10;
    load = 0; #10;

    // Test reset
    rst = 1; #10;
    rst = 0; #10;  // Reset to 0
    rst = 0; #10;

    $stop;
end

endmodule
