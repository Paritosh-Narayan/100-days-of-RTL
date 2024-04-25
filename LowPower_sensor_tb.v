
`timescale 1ns/1ns

module low_power_sensor_node_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Signals
reg clk = 0;              // Clock signal
reg reset_n = 1;          // Reset signal (active low)
reg sensor_data = 0;      // Sensor data input
wire tx_data;             // Transmitted data output
wire sleep;               // Sleep mode control signal

// Instantiate the module under test
low_power_sensor_node uut (
    .clk(clk),
    .reset_n(reset_n),
    .sensor_data(sensor_data),
    .tx_data(tx_data),
    .sleep(sleep)
);

// Clock generation
always #(CLK_PERIOD/2) clk = ~clk;

// Reset generation
initial begin
    reset_n = 0;
    #(10);
    reset_n = 1;
    #(10);
end

// Stimulus generation
initial begin
    // Simulate sensor data
    #20 sensor_data = 8'hFF;
    #100 sensor_data = 8'h00;
    #100 sensor_data = 8'hA5;
    #200 $finish; // Finish simulation
end

// Monitor signals
always @* begin
    $display("Time=%t, Sensor Data=%h, Transmitted Data=%h, Sleep Mode=%b", $time, sensor_data, tx_data, sleep);
end

endmodule
