
module Modulo_Counter(
    input clk,
    input rst,
    output reg [3:0] mod_3,
    output reg [4:0] mod_5,
    output reg [2:0] mod_7,
    output reg [2:0] mod_8,
    output reg [3:0] mod_16
);

reg [1:0] counter_3;
reg [2:0] counter_5;
reg [2:0] counter_7;
reg [2:0] counter_8;
reg [3:0] counter_16;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter_3 <= 0;
        counter_5 <= 0;
        counter_7 <= 0;
        counter_8 <= 0;
        counter_16 <= 0;
    end else begin
        // Modulo 3 counter
        if (counter_3 == 2) begin
            counter_3 <= 0;
            mod_3 <= counter_3;
        end else begin
            counter_3 <= counter_3 + 1;
            mod_3 <= counter_3;
        end

        // Modulo 5 counter
        if (counter_5 == 4) begin
            counter_5 <= 0;
            mod_5 <= counter_5;
        end else begin
            counter_5 <= counter_5 + 1;
            mod_5 <= counter_5;
        end

        // Modulo 7 counter
        if (counter_7 == 6) begin
            counter_7 <= 0;
            mod_7 <= counter_7;
        end else begin
            counter_7 <= counter_7 + 1;
            mod_7 <= counter_7;
        end

        // Modulo 8 counter
        if (counter_8 == 7) begin
            counter_8 <= 0;
            mod_8 <= counter_8;
        end else begin
            counter_8 <= counter_8 + 1;
            mod_8 <= counter_8;
        end

        // Modulo 16 counter
        if (counter_16 == 15) begin
            counter_16 <= 0;
            mod_16 <= counter_16;
        end else begin
            counter_16 <= counter_16 + 1;
            mod_16 <= counter_16;
        end
    end
end
