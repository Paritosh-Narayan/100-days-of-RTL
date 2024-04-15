`timescale 1ns / 1ps

module dram_tb;

    // Parameters
    parameter MEM_DEPTH = 4096; // Example: 4K depth
    parameter MEM_WIDTH = 8;    // Example: 8-bit data width

    // Signals
    reg clk;
    reg rst_n;
    reg [11:0] address;
    reg [7:0] data_in;
    reg we;
    wire [7:0] data_out;

    // Instantiate DRAM module
    dram dut (
        .clk(clk),
        .rst_n(rst_n),
        .address(address),
        .data_in(data_in),
        .we(we),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        clk = 0;
        rst_n = 0;
        #10;
        rst_n = 1;
        #10;
        // Perform write and read operations
        // Write operation
        address = 12'h000;
        data_in = 8'hAA;
        we = 1;
        #10;
        we = 0;
        // Read operation
        address = 12'h000;
        we = 0;
        #10;
        // Add more test cases as needed
        // Verify the read data
        $display("Data read from address 0: %h", data_out);
        // Add assertions for verification if required
        // $display("Assertion failed at time %t", $time) else $display("Assertion passed");
        // $stop; // Stop simulation after desired test cases
    end

endmodule
