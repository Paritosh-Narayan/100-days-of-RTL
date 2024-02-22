module johnson_counter(
    input wire clk,    // Clock input
    output reg [3:0] out // Output
);

// Johnson counter states
reg [3:0] counter;

// Always block to update counter on positive edge of clock
always @(posedge clk) begin
    // Shift left
    counter <= {counter[2:0], counter[3]};
end

// Assign output
always @*
begin
    case(counter)
        4'b0000: out = 4'b0001;
        4'b0001: out = 4'b0010;
        4'b0010: out = 4'b0100;
        4'b0100: out = 4'b1000;
        4'b1000: out = 4'b0001;
        default: out = 4'bxxxx; // Handle any other state (should not occur)
    endcase
end

endmodule
