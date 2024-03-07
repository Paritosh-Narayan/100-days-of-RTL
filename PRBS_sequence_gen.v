module prbs_generator(
    input clk,
    input reset,
    output reg prbs_out
);

reg [7:0] lfsr_reg;

always @(posedge clk or posedge reset) begin
    if (reset)
        lfsr_reg <= 8'b00000001; // Initial value of LFSR
    else begin
        // LFSR taps for maximal-length sequence
        lfsr_reg <= {lfsr_reg[6]^lfsr_reg[5], lfsr_reg[7:1]};
    end
end

always @(posedge clk) begin
    if (reset)
        prbs_out <= 1'b0; // Reset output when reset is asserted
    else
        prbs_out <= lfsr_reg[7]; // Output the MSB of the LFSR
end

endmodule
