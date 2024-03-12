module comparator_mux (
    input wire [3:0] data_input, // 4-bit input data
    input wire [3:0] compare_value, // 4-bit compare value
    input wire control, // Control signal to select between comparing and multiplexing
    output reg [3:0] mux_output // Output of the multiplexer
);

    wire [3:0] equal; // Equality check between data_input and compare_value

    // Equality check
    assign equal = (data_input == compare_value);

    // Multiplexer
    always @(*) begin
        if (control) // If control is high, output compare_value
            mux_output = compare_value;
        else // If control is low, output data_input
            mux_output = data_input;
    end

endmodule
