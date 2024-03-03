module testbench;

parameter N = 8; // Number of bits for inputs A and B
reg [N-1:0] A;   // Declare input A
reg [N-1:0] B;   // Declare input B
wire equal;      // Declare output equal
wire greater;    // Declare output greater
wire less;       // Declare output less

// Instantiate the n-bit comparator module
n_bit_comparator dut(
    .A(A),
    .B(B),
    .equal(equal),
    .greater(greater),
    .less(less)
);

// Stimulus
initial begin
    $monitor("A = %b, B = %b, equal = %b, greater = %b, less = %b", A, B, equal, greater, less);

    // Test case 1: A = B
    A = 8'b01010101;
    B = 8'b01010101;
    #10;

    // Test case 2: A > B
    A = 8'b11110000;
    B = 8'b00110000;
    #10;

    // Test case 3: A < B
    A = 8'b00001111;
    B = 8'b11110000;
    #10;

    // Add more test cases as needed
    // ...

    // End simulation
    $finish;
end

endmodule
