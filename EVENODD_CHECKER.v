module even_odd_checker(
    input wire [7:0] num,
    output reg even,
    output reg odd
);

always @(*) begin
    if (num[0] == 1'b0) begin
        even = 1'b1;
        odd = 1'b0;
    end
    else begin
        even = 1'b0;
        odd = 1'b1;
    end
end

endmodule
