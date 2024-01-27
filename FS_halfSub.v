module half_subtractor(input A, B, output Diff, Borrow);
    assign Diff = A ^ B;
    assign Borrow = ~A & B;
endmodule

module full_subtractor(input A, B, Cin, output Diff, Borrow);
    wire Diff1, Borrow1, Borrow2;

    half_subtractor U1(.A(A), .B(B), .Diff(Diff1), .Borrow(Borrow1));
    half_subtractor U2(.A(Diff1), .B(Cin), .Diff(Diff), .Borrow(Borrow2));

    assign Borrow = Borrow1 | Borrow2;
endmodule
