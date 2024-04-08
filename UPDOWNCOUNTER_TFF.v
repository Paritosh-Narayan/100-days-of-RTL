
module up_down_counter (
    input clk,
    input rst,
    input up_down,
    output reg [3:0] count
);

reg t1, t2, t3, t4;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000;
        t1 <= 1'b0;
        t2 <= 1'b0;
        t3 <= 1'b0;
        t4 <= 1'b0;
    end
    else begin
        if (up_down) begin // Up counter
            if (t1) begin
                count <= count + 1;
                t1 <= ~t1;
            end
            else if (t2) begin
                t1 <= ~t1;
                t2 <= ~t2;
            end
            else if (t3) begin
                t2 <= ~t2;
                t3 <= ~t3;
            end
            else if (t4) begin
                t3 <= ~t3;
                t4 <= ~t4;
            end
            else begin
                t4 <= ~t4;
            end
        end
        else begin // Down counter
            if (t1) begin
                count <= count - 1;
                t1 <= ~t1;
            end
            else if (t2) begin
                t1 <= ~t1;
                t2 <= ~t2;
            end
            else if (t3) begin
                t2 <= ~t2;
                t3 <= ~t3;
            end
            else if (t4) begin
                t3 <= ~t3;
                t4 <= ~t4;
            end
            else begin
                t4 <= ~t4;
            end
        end
    end
end

endmodule
