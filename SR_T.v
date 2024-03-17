module SR_D_FF (
    input S, R, CLK,
    output reg Q
);

// Internal signal to store the intermediate value
reg intermediate;

// Always block triggered on positive edge of clock
always @(posedge CLK) begin
    // If both Set and Reset are high, retain previous value
    if (S & R)
        intermediate <= Q;
    else if (~S & R)
        intermediate <= 0; // Reset
    else if (S & ~R)
        intermediate <= 1; // Set
    else // S=0, R=0
        intermediate <= intermediate; // No change

    // Assign the intermediate value to the output
    Q <= intermediate;
end

endmodule
