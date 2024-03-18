module EdgeDetector (
    input wire clk,           // Clock input
    input wire reset_n,       // Active low reset input
    input wire data_in,       // Input data signal
    output reg edge_detected // Output edge_detected signal
);

// Internal signals
reg prev_data;

// Edge detection logic
always @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        prev_data <= 1'b0;
        edge_detected <= 1'b0;
    end
    else begin
        if (data_in && !prev_data) begin
            edge_detected <= 1'b1;
        end
        else begin
            edge_detected <= 1'b0;
        end
    end
    prev_data <= data_in;
end

endmodule
