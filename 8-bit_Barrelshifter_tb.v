module testbench;

    // Parameters
    parameter CLOCK_PERIOD = 10; // Time period of clock (in ns)

    // Signals
    reg [7:0] data_in;
    reg [2:0] shift_amount;
    reg direction;
    wire [7:0] data_out;

    // Instantiate the barrel shifter module
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amount(shift_amount),
        .direction(direction),
        .data_out(data_out)
    );

    // Clock generation
    reg clk = 0;
    always #((CLOCK_PERIOD)/2) clk = ~clk;

    // Test stimulus
    initial begin
        $display("Testing Barrel Shifter");

        // Initialize inputs
        data_in = 8'b10101010;
        shift_amount = 3'b001; // Shift by 1
        direction = 1; // Shift right
        #10;
        $display("Shift Amount: %b, Direction: %b, Output: %b", shift_amount, direction, data_out);

        shift_amount = 3'b010; // Shift by 2
        direction = 0; // Shift left
        #10;
        $display("Shift Amount: %b, Direction: %b, Output: %b", shift_amount, direction, data_out);

        shift_amount = 3'b011; // Shift by 3
        direction = 1; // Shift right
        #10;
        $display("Shift Amount: %b, Direction: %b, Output: %b", shift_amount, direction, data_out);

        shift_amount = 3'b100; // Shift by 4
        direction = 0; // Shift left
        #10;
        $display("Shift Amount: %b, Direction: %b, Output: %b", shift_amount, direction, data_out);

        shift_amount = 3'b101; // Shift by 5
        direction = 1; // Shift right
        #10;
        $display("Shift Amount: %b, Direction: %b, Output: %b", shift_amount, direction, data_out);

        shift_amount = 3'b110; // Shift by 6
        direction = 0; // Shift left
        #10;
        $display("Shift Amount: %b, Direction: %b, Output: %b", shift_amount, direction, data_out);

        shift_amount = 3'b111; // Shift by 7
        direction = 1; // Shift right
        #10;
        $display("Shift Amount: %b, Direction: %b, Output: %b", shift_amount, direction, data_out);

        // Wait for simulation to finish
        #100 $finish;
    end

endmodule
