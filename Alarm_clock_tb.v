`timescale 1ns / 1ps

module testbench;

// Clock period parameters
parameter CLK_PERIOD = 10; // 10 ns for a 100 MHz clock

// Testbench signals
reg clk;
reg reset;
reg set_time;
reg set_alarm;
reg [5:0] hours;
reg [5:0] minutes;
reg [5:0] seconds;
wire [5:0] cur_hours;
wire [5:0] cur_minutes;
wire [5:0] cur_seconds;
wire alarm;

// Instantiate the digital alarm clock module
digital_alarm_clock uut (
    .clk(clk),
    .reset(reset),
    .set_time(set_time),
    .set_alarm(set_alarm),
    .hours(hours),
    .minutes(minutes),
    .seconds(seconds),
    .cur_hours(cur_hours),
    .cur_minutes(cur_minutes),
    .cur_seconds(cur_seconds),
    .alarm(alarm)
);

// Clock generation
always #(CLK_PERIOD / 2) clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    set_time = 0;
    set_alarm = 0;
    hours = 0;
    minutes = 0;
    seconds = 0;

    // Reset the clock
    reset = 1;
    #10;
    reset = 0;

    // Set the initial time to 12:00:00
    set_time = 1;
    hours = 12;
    minutes = 0;
    seconds = 0;
    #10;
    set_time = 0;

    // Wait for a few clock cycles to observe time increment
    #100;

    // Set the alarm to 12:00:05
    set_alarm = 1;
    hours = 12;
    minutes = 0;
    seconds = 5;
    #10;
    set_alarm = 0;

    // Wait and observe the alarm trigger
    #100;

    // Finish the simulation
    $finish;
end

initial begin
    $monitor("Time: %02d:%02d:%02d, Alarm: %b", cur_hours, cur_minutes, cur_seconds, alarm);
end

endmodule
