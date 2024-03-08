
module priority_arbiter(
    input wire [N-1:0] request,
    output wire grant
);

parameter N = 4; // Number of request inputs

// Internal signals
wire [N-1:0] grant_priority;
wire [N-1:0] grant_valid;
wire [N-1:0] req_priority;

// Priority encoder to determine request priorities
assign req_priority = ~|request;

// Logic to grant the request based on priority
assign grant_priority = req_priority & request;
assign grant = |grant_priority;

endmodule
