
`timescale 1ns / 1ps

module tb_convolutional_encoder;

reg clk;
reg reset;
reg [7:0] data_in;
wire [15:0] data_out;

convolutional_encoder encoder (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .data_out(data_out)
);

initial begin
    clk = 0;
    reset = 1;
    data_in = 8'b00000000;
    #10 reset = 0;
    #10 data_in = 8'b10101010;
    #10 data_in = 8'b11001100;
    #10 data_in = 8'b11110000;
    #10 $finish;
end

always #5 clk = ~clk;

initial begin
    $dumpfile("tb_convolutional_encoder.vcd");
    $dumpvars(0, tb_convolutional_encoder);
    #50 $finish;
end

endmodule
