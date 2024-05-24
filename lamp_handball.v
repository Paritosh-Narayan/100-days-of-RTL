module LampHandball(
    input wire clk,          // Clock signal
    input wire reset,        // Reset button
    input wire [4:0] button, // Buttons for toggling lamps
    output reg [4:0] lamp    // Lamp states (5 lamps)
);

// On the positive edge of the clock or when reset is activated
always @(posedge clk or posedge reset) begin
    if (reset) begin
        lamp <= 5'b00000; // Reset all lamps to off state
    end else begin
        lamp[0] <= button[0] ? ~lamp[0] : lamp[0]; // Toggle lamp 0
        lamp[1] <= button[1] ? ~lamp[1] : lamp[1]; // Toggle lamp 1
        lamp[2] <= button[2] ? ~lamp[2] : lamp[2]; // Toggle lamp 2
        lamp[3] <= button[3] ? ~lamp[3] : lamp[3]; // Toggle lamp 3
        lamp[4] <= button[4] ? ~lamp[4] : lamp[4]; // Toggle lamp 4
    end
end

endmodule
