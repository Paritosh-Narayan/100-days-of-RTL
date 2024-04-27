module wallace_multiplier(
    input [15:0] a,
    input [15:0] b,
    output [31:0] result
);

// Internal wires
wire [15:0] partial_products [0:15];
wire [31:0] final_sum;

// Generate partial products
genvar i, j;
generate
    for (i = 0; i < 16; i = i + 1) begin : gen_pp
        for (j = 0; j < 16; j = j + 1) begin : gen_and
            assign partial_products[i][j] = a[i] & b[j];
        end
    end
endgenerate

// Generate tree structure
genvar k;
generate
    for (k = 0; k < 15; k = k + 1) begin : gen_tree
        wire [31:0] carry;
        wire [15:0] sum;
        assign carry[0] = partial_products[k][0];
        assign sum[0] = partial_products[k][0];

        for (i = 1; i < 16; i = i + 1) begin : ripple_adder
            full_adder fa(
                .a(partial_products[k][i]),
                .b(sum[i - 1]),
                .cin(carry[i - 1]),
                .sum(sum[i]),
                .cout(carry[i])
            );
        end

        assign final_sum[k+1] = {carry[15], sum};
    end
endgenerate

// Final carry propagation
assign final_sum[0] = {16'b0, partial_products[15]};
assign result = final_sum;

endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

assign sum = a ^ b ^ cin;
assign cout = (a & b) | (a & cin) | (b & cin);

endmodule
