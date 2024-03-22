
`timescale 1ns / 1ps

module Async_FIFO_tb;

    // Parameters
    parameter CLK_PERIOD = 10;  // Clock period in ns

    // Signals
    reg clk = 0;           // Clock signal
    reg reset = 1;         // Reset signal
    reg write_en = 0;      // Write enable signal
    reg read_en = 0;       // Read enable signal
    reg [7:0] data_in;     // Input data
    wire [7:0] data_out;   // Output data
    wire empty;            // Empty flag
    wire full;             // Full flag

    // Instantiate the FIFO module
    Async_FIFO uut (
        .clk(clk),
        .reset(reset),
        .write_en(write_en),
        .read_en(read_en),
        .data_in(data_in),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Stimulus generation
    initial begin
        // Reset
        #20 reset = 0;

        // Write and read operations
        #40 write_en = 1; data_in = 8'hAA; // Write 0xAA
        #50 write_en = 1; data_in = 8'hBB; // Write 0xBB
        #60 write_en = 1; data_in = 8'hCC; // Write 0xCC

        #80 read_en = 1;  // Read
        #90 read_en = 1;  // Read
        #100 read_en = 1; // Read

        // End simulation
        #110 $finish;
    end

    // Monitor output signals
    always @(posedge clk) begin
        $display("Data out: %h, Empty: %b, Full: %b", data_out, empty, full);
    end

endmodule
