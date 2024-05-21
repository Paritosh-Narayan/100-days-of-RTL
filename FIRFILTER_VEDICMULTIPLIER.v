module fir_filter_vedic (
    input clk,
    input rst,
    input signed [3:0] x,  // 4-bit input sample
    output signed [7:0] y  // 8-bit output
);

    // FIR filter coefficients
    reg signed [3:0] h0 = 4'b0001; // coefficient 1
    reg signed [3:0] h1 = 4'b0010; // coefficient 2
    reg signed [3:0] h2 = 4'b0011; // coefficient 3
    reg signed [3:0] h3 = 4'b0100; // coefficient 4

    // Input delay line
    reg signed [3:0] x_reg[0:3]; // 4-sample delay line

    // Product wires
    wire signed [7:0] y0, y1, y2, y3;
    wire signed [7:0] sum1, sum2, sum3;

    // Vedic Multiplier
    wire [7:0] vm_product [0:3];

    // Vedic multiplier instances
    vedic_multiplier_4bit vm0(.a(h0), .b(x_reg[0]), .product(vm_product[0]));
    vedic_multiplier_4bit vm1(.a(h1), .b(x_reg[1]), .product(vm_product[1]));
    vedic_multiplier_4bit vm2(.a(h2), .b(x_reg[2]), .product(vm_product[2]));
    vedic_multiplier_4bit vm3(.a(h3), .b(x_reg[3]), .product(vm_product[3]));

    // Assign product outputs
    assign y0 = vm_product[0];
    assign y1 = vm_product[1];
    assign y2 = vm_product[2];
    assign y3 = vm_product[3];

    // Sum of products
    assign sum1 = y0 + y1;
    assign sum2 = sum1 + y2;
    assign sum3 = sum2 + y3;

    assign y = sum3;

    // Input shift register
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x_reg[0] <= 0;
            x_reg[1] <= 0;
            x_reg[2] <= 0;
            x_reg[3] <= 0;
        end else begin
            x_reg[3] <= x_reg[2];
            x_reg[2] <= x_reg[1];
            x_reg[1] <= x_reg[0];
            x_reg[0] <= x;
        end
    end

endmodule

// Vedic multiplier module
module vedic_multiplier_4bit (
    input [3:0] a,
    input [3:0] b,
    output [7:0] product
);

    wire [3:0] p0, p1, p2, p3;
    wire [7:0] pp0, pp1, pp2, pp3, sum0, sum1, sum2;

    assign p0 = a[1:0] * b[1:0];
    assign p1 = a[3:2] * b[1:0];
    assign p2 = a[1:0] * b[3:2];
    assign p3 = a[3:2] * b[3:2];

    assign pp0 = {4'b0000, p0};
    assign pp1 = {2'b00, p1, 2'b00};
    assign pp2 = {2'b00, p2, 2'b00};
    assign pp3 = {p3, 4'b0000};

    assign sum0 = pp0 + pp1;
    assign sum1 = pp2 + pp3;
    assign sum2 = sum0 + sum1;

    assign product = sum2;

endmodule
