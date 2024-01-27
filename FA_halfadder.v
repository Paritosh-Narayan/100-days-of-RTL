module half_adder(input a, b, output sum, carry);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module full_adder(input a, b, cin, output sum, cout);
    wire sum1, carry1, carry2;

    // First half adder
    half_adder HA1 (.a(a), .b(b), .sum(sum1), .carry(carry1));

    // Second half adder
    half_adder HA2 (.a(sum1), .b(cin), .sum(sum), .carry(carry2));

    // OR gate for the final carry out
    assign cout = carry1 | carry2;
endmodule
