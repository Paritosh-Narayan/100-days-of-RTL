module Moore_FSM (
    input clk,       // Clock input
    input reset,     // Reset input
    output reg [1:0] out_state  // Output state
);

// Define state enumeration
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

// Define state register
reg [1:0] state;

// Moore FSM logic
always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= S0;  // Reset state
    else begin
        case (state)
            S0: state <= S1;  // Transition from S0 to S1
            S1: state <= S2;  // Transition from S1 to S2
            S2: state <= S0;  // Transition from S2 to S0
            default: state <= S0;
        endcase
    end
end

// Moore output logic
always @(*)
begin
    case (state)
        S0: out_state = 2'b00;  // Output 00 in state S0
        S1: out_state = 2'b01;  // Output 01 in state S1
        S2: out_state = 2'b10;  // Output 10 in state S2
        default: out_state = 2'b00;  // Default output
    endcase
end

endmodule
