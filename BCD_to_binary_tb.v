// Testbench for BCD to Binary Converter
module testbench;

    reg [3:0] bcd_input;        // 4-bit BCD input
    wire [7:0] binary_output;   // 8-bit binary output

    // Instantiate BCD to Binary Converter module
    BCD_to_Binary_Converter uut (
        .bcd_input(bcd_input),
        .binary_output(binary_output)
    );

    // Stimulus generation
    initial begin
        $monitor("Time=%0t \t BCD Input=%b \t Binary Output=%b", $time, bcd_input, binary_output);

        // Test case 1
        bcd_input = 4'b0000;
        #10;

        // Test case 2
        bcd_input = 4'b0101;
        #10;

        // Test case 3
        bcd_input = 4'b1001;
        #10;

        // Add more test cases as needed

        $finish;
    end

endmodule
