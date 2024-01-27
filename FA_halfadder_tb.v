// Testbench for the full adder
module testbench;
    reg a, b, cin;
    wire sum, cout;

    // Instantiate the full adder
    full_adder FA1 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    // Apply input values
    initial begin
        a = 1;
        b = 1;
        cin = 0;

        // Display input values
        $display("Inputs: a = %b, b = %b, cin = %b", a, b, cin);

        // Display output values
        $display("Sum = %b, Cout = %b", sum, cout);

        // Change input values and display results
        #5 a = 0; b = 1; cin = 1;
        $display("Inputs: a = %b, b = %b, cin = %b", a, b, cin);
        $display("Sum = %b, Cout = %b", sum, cout);

        // Add more test cases as needed
        // ...

        // Stop simulation
        #10 $finish;
    end
endmodule
