module adder_subtractor (
    input [15:0] A, // 16-bit input A
    input [15:0] B, // 16-bit input B
    input cin,       // Carry-in for addition
    input subtract,  // Control input to select subtraction
    output reg [15:0] sum, // 16-bit output sum
    output reg cout      // Carry-out from addition
);

always @(*) begin
    if (subtract) begin
        sum = A - B;
        cout = (A >= B) ? 1 : 0; // Carry-out is 1 if A is greater than or equal to B in subtraction
    end else begin
        sum = A + B + cin;
        cout = (sum[16] == 1) ? 1 : 0; // Carry-out is the 17th bit of sum
    end
end

endmodule
