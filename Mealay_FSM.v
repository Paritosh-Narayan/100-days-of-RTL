module MealyFSM(
    input wire clk,
    input wire reset,
    input wire x,
    output reg y1,
    output reg y2
);

// Define states
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

// Define state register
reg [1:0] state, next_state;

// Define output functions
always @ (posedge clk, posedge reset) begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

always @ (*) begin
    case(state)
        S0: begin
            if (x)
                next_state = S1;
            else
                next_state = S2;
            y1 = 1'b0;
            y2 = 1'b0;
        end
        S1: begin
            if (x)
                next_state = S2;
            else
                next_state = S0;
            y1 = 1'b1;
            y2 = 1'b0;
        end
        S2: begin
            if (x)
                next_state = S0;
            else
                next_state = S1;
            y1 = 1'b0;
            y2 = 1'b1;
        end
        default: begin
            next_state = S0;
            y1 = 1'b0;
            y2 = 1'b0;
        end
    endcase
end

endmodule
