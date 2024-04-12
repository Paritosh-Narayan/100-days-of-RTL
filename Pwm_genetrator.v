module pwm_generator(
    input clk,         // Clock input
    input rst,         // Reset input
    input [7:0] duty_cycle,  // Duty cycle input (0-255)
    output reg pwm_out      // PWM output
);

reg [7:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 8'b0;  // Reset counter
        pwm_out <= 1'b0;  // Set initial output to low
    end
    else begin
        counter <= counter + 1;  // Increment counter on each clock cycle
        if (counter >= 8'hFF) begin  // Check if counter reached its maximum value
            counter <= 8'b0;  // Reset counter
            pwm_out <= (counter < duty_cycle); // Toggle PWM output based on duty cycle
        end
    end
end

endmodule
