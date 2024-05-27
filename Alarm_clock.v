module digital_alarm_clock (
    input wire clk,          // Clock signal
    input wire reset,        // Asynchronous reset
    input wire set_time,     // Signal to set the time
    input wire set_alarm,    // Signal to set the alarm
    input wire [5:0] hours,  // Hours input for setting time/alarm
    input wire [5:0] minutes,// Minutes input for setting time/alarm
    input wire [5:0] seconds,// Seconds input for setting time
    output reg [5:0] cur_hours,  // Current hours
    output reg [5:0] cur_minutes,// Current minutes
    output reg [5:0] cur_seconds,// Current seconds
    output reg alarm          // Alarm signal
);

reg [5:0] alarm_hours;
reg [5:0] alarm_minutes;
reg [5:0] alarm_seconds;

// Timekeeping process
always @(posedge clk or posedge reset) begin
    if (reset) begin
        cur_hours <= 0;
        cur_minutes <= 0;
        cur_seconds <= 0;
    end else if (set_time) begin
        cur_hours <= hours;
        cur_minutes <= minutes;
        cur_seconds <= seconds;
    end else begin
        // Increment seconds
        if (cur_seconds == 59) begin
            cur_seconds <= 0;
            // Increment minutes
            if (cur_minutes == 59) begin
                cur_minutes <= 0;
                // Increment hours
                if (cur_hours == 23) begin
                    cur_hours <= 0;
                end else begin
                    cur_hours <= cur_hours + 1;
                end
            end else begin
                cur_minutes <= cur_minutes + 1;
            end
        end else begin
            cur_seconds <= cur_seconds + 1;
        end
    end
end

// Alarm setting process
always @(posedge clk or posedge reset) begin
    if (reset) begin
        alarm_hours <= 0;
        alarm_minutes <= 0;
        alarm_seconds <= 0;
        alarm <= 0;
    end else if (set_alarm) begin
        alarm_hours <= hours;
        alarm_minutes <= minutes;
        alarm_seconds <= seconds;
    end else if (cur_hours == alarm_hours && cur_minutes == alarm_minutes && cur_seconds == alarm_seconds) begin
        alarm <= 1;
    end else begin
        alarm <= 0;
    end
end

endmodule
