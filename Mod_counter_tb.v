`timescale 1ns / 1ps

module Modulo_Counter_TB;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg rst;
    wire [3:0] mod_3;
    wire [4:0] mod_5;
    wire [2:0] mod_7;
    wire [2:0] mod_8;
    wire [3:0] mod_16;

    // Instantiate the module under test
    Modulo_Counter uut (
        .clk(clk),
        .rst(rst),
        .mod_3(mod_3),
        .mod_5(mod_5),
        .mod_7(mod_7),
        .mod_8(mod_8),
        .mod_16(mod_16)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        rst = 1; // Assert reset initially
        #20; // Wait for some time
        rst = 0; // Deassert reset
        #100; // Run the simulation for some time
        $finish; // End the simulation
    end

    // Display results
    always @(posedge clk) begin
        $display("Time=%0t, Mod_3=%b, Mod_5=%b, Mod_7=%b, Mod_8=%b, Mod_16=%b",
                 $time, mod_3, mod_5, mod_7, mod_8, mod_16);
    end

endmodule
