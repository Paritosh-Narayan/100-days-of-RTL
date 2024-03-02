
`timescale 1ns / 1ps

module testbench;

reg clk;
reg rst;
wire [3:0] sec_tens, sec_ones, min_tens, min_ones;

BCD_TimeCounter dut(
    .clk(clk),
    .rst(rst),
    .sec_tens(sec_tens),
    .sec_ones(sec_ones),
    .min_tens(min_tens),
    .min_ones(min_ones)
);

initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
end

always #5 clk = ~clk;

initial begin
    $dumpfile("BCD_TimeCounter.vcd");
    $dumpvars(0, testbench);
    #1000 $finish;
end

endmodule
