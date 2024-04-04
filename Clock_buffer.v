
module clock_buffer (
    input wire clk_in, // Input clock signal
    output wire clk_out // Output buffered clock signal
);

assign clk_out = clk_in;

endmodule
