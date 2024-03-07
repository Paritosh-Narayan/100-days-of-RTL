

module tb_prbs_generator;

reg clk, reset;
wire prbs_out;

// Instantiate the PRBS generator module
prbs_generator prbs_gen (
    .clk(clk),
    .reset(reset),
    .prbs_out(prbs_out)
);

// Clock generation
always #5 clk = ~clk;

// Initial reset
initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
end

// Stimulus
initial begin
    $monitor("Time=%t, PRBS Output=%b", $time, prbs_out);
    #100 $finish; // Stop simulation after 100 time units
end

endmodule
