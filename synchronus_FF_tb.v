
`timescale 1ns / 1ps

module Sync_FIFO_tb;

    // Parameters
    parameter CLK_PERIOD = 10;  // Clock period in ns
    parameter DEPTH = 16;       // Depth of the FIFO

    // Signals
    reg clk = 0;               // Clock signal
    reg reset = 1;             // Reset signal
    reg write_en = 0;          // Write enable signal
    reg read_en = 0;           // Read enable signal
    reg [7:0] data_in = 0;     // Input data
    wire [7:0] data_out_tb;    // Output data from FIFO
    wire empty_tb;             // Empty flag from FIFO
    wire full_tb;              // Full flag from FIFO

    // Instantiate the synchronous FIFO module
    Sync_FIFO uut (
        .clk(clk),
        .reset(reset),
        .write_en(write_en),
        .read_en(read_en),
        .data_in(data_in),
        .data_out(data_out_tb),
        .empty(empty_tb),
        .full(full_tb)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Test stimulus
    initial begin
        // Reset the FIFO
        #20 reset = 0;

        // Write data into the FIFO
        #30;
        write_en = 1;
        data_in = 8'hAA;
        #10;
        write_en = 0;

        // Read data from the FIFO
        #50;
        read_en = 1;
        #10;
        read_en = 0;

        // End simulation
        #10 $finish;
    end

    // Monitor output
    always @(posedge clk) begin
        if (~empty_tb) begin
            $display("Data Out: %h", data_out_tb);
        end
    end

endmodule
