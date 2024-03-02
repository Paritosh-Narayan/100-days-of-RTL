module BCD_TimeCounter(
    input clk,         // Clock input
    input rst,         // Reset input
    output reg [3:0] sec_tens,  // Second tens place
    output reg [3:0] sec_ones,  // Second ones place
    output reg [3:0] min_tens,  // Minute tens place
    output reg [3:0] min_ones   // Minute ones place
);

reg [3:0] count;   // 4-bit counter to keep track of time
reg [3:0] sec_tens_next, sec_ones_next, min_tens_next, min_ones_next;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        count <= 0;
        sec_tens <= 4'b0;
        sec_ones <= 4'b0;
        min_tens <= 4'b0;
        min_ones <= 4'b0;
    end
    else begin
        if(count == 10) begin
            count <= 0;
            sec_ones_next <= sec_ones + 1;
            if(sec_ones_next == 10) begin
                sec_ones_next <= 0;
                sec_tens_next <= sec_tens + 1;
                if(sec_tens_next == 6) begin
                    sec_tens_next <= 0;
                    min_ones_next <= min_ones + 1;
                    if(min_ones_next == 10) begin
                        min_ones_next <= 0;
                        min_tens_next <= min_tens + 1;
                        if(min_tens_next == 6) begin
                            min_tens_next <= 0;
                        end
                    end
                end
            end
        end
        else begin
            count <= count + 1;
        end
    end
end

always @(posedge clk) begin
    sec_ones <= sec_ones_next;
    sec_tens <= sec_tens_next;
    min_ones <= min_ones_next;
    min_tens <= min_tens_next;
end

endmodule
