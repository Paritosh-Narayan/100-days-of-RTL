`timescale 1ns / 1ps // Define timescale

module SRAM_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Signals
reg CLK;       // Clock signal
reg [9:0] ADDR; // Address signal
reg WE;        // Write Enable signal
reg [7:0] DIN; // Data input signal
wire [7:0] DOUT; // Data output signal

// Instantiate the SRAM module
SRAM uut (
    .CLK(CLK),
    .ADDR(ADDR),
    .WE(WE),
    .DIN(DIN),
    .DOUT(DOUT)
);

// Clock generation
always #((CLK_PERIOD)/2) CLK = ~CLK;

// Test stimulus
initial begin
    $dumpfile("SRAM_tb.vcd"); // Dump VCD file
    $dumpvars(0, SRAM_tb); // Dump variables

    // Initialize signals
    CLK = 0;
    ADDR = 0;
    WE = 0;
    DIN = 0;

    // Write operation
    #20 ADDR = 5;   // Address to write
    #20 WE = 1;     // Enable write
    #20 DIN = 8'hAA; // Data to write
    #20 WE = 0;     // Disable write

    // Read operation
    #20 ADDR = 5;   // Address to read
    #20 WE = 0;     // Disable write
    #20;            // Wait some time for read operation

    // End simulation
    $finish;
end

endmodule
