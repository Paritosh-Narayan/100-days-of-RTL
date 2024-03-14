
module event_simulation (
    input wire a,
    input wire b,
    output reg c
);

// Combinational logic
always @(*) begin
    c = a & b; // AND gate
end

endmodule
