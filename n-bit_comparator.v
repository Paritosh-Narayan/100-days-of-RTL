module n_bit_comparator(
    input [N-1:0] A,  // n-bit input A
    input [N-1:0] B,  // n-bit input B
    output equal,     // output indicating A and B are equal
    output greater,   // output indicating A is greater than B
    output less       // output indicating A is less than B
);

parameter N = 8;  // Define N as the number of bits for the inputs

assign equal = (A == B);        // Output equal if A and B are equal
assign greater = (A > B);       // Output greater if A is greater than B
assign less = (A < B);          // Output less if A is less than B

endmodule
