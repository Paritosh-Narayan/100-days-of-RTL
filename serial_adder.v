module SerialAdder (
    input clk,          // Clock input
    input reset,        // Reset input
    input start,        // Start input
    input [7:0] operand1, // 8-bit input operand1
    input [7:0] operand2, // 8-bit input operand2
    output reg [8:0] sum // 9-bit output sum (8-bit result + carry)
);

reg [8:0] accumulator; // 9-bit accumulator for sum and carry
reg [2:0] state;       // 3-bit state register

parameter IDLE = 3'd0;
parameter SHIFT = 3'd1;
parameter ADD = 3'd2;
parameter DONE = 3'd3;

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        accumulator <= 9'b0; // Reset accumulator
        state <= IDLE;       // Set initial state
    end
    else begin
        case (state)
            IDLE: begin
                if (start) begin
                    accumulator <= {1'b0, operand1}; // Initialize accumulator with operand1
                    state <= SHIFT; // Move to SHIFT state
                end
            end
            SHIFT: begin
                accumulator <= {accumulator[7:0], 1'b0}; // Shift accumulator left
                if (accumulator[8]) // Check if carry out
                    state <= ADD; // Move to ADD state
            end
            ADD: begin
                accumulator <= accumulator + operand2; // Add operand2 to accumulator
                state <= DONE; // Move to DONE state
            end
            DONE: begin
                sum <= accumulator; // Output sum
                state <= IDLE;     // Move back to IDLE state
            end
        endcase
    end
end

endmodule
