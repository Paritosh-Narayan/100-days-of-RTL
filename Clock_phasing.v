
module ClockPhasing (
    input wire clk, // Input clock signal
    output wire delayed_clk // Delayed clock signal
);

    // Define the delay in terms of clock cycles
    parameter DELAY = 3; // Delay of 3 clock cycles

    // Internal signal to hold the delayed clock
    reg [DELAY-1:0] clk_delay_reg;

    // Delay the clock signal
    always @(posedge clk) begin
        clk_delay_reg <= {clk_delay_reg[DELAY-2:0], 1'b0}; // Shift the register and insert a 0 at the end
    end

    // Output the delayed clock signal
    assign delayed_clk = clk_delay_reg[DELAY-1];

endmodule
