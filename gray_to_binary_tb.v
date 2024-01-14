// tb_gray_to_binary.v
module tb_gray_to_binary;

    reg [3:0] gray;
    wire [3:0] binary;

    // Instantiate the gray to binary converter
    gray_to_binary uut (
        .gray(gray),
        .binary(binary)
    );

    initial begin
        $monitor("Time=%0t | Gray: %b, Binary: %b", $time, gray, binary);

        // Test cases
        gray = 4'b0000;
        #10;

        gray = 4'b1101;
        #10;

        gray = 4'b1011;
        #10;

        gray = 4'b1111;
        #10;

        // Add more test cases as needed

        // Finish simulation
        #10 $finish;
    end

endmodule
