`timescale 1ns / 1ps

module ALU_tb;

   // Parameters
   parameter CLK_PERIOD = 10; // Clock period in nanoseconds

   // Signals
   reg [3:0] operand1;  // Input operand 1
   reg [3:0] operand2;  // Input operand 2
   reg [2:0] opcode;    // Operation code
   reg cin;             // Carry in for addition
   wire [3:0] result;   // Output result
   wire cout;           // Carry out for addition
   reg clk = 0;         // Clock signal (initialize to 0)

   // Instantiate the ALU module
   ALU ALU_inst(
      .operand1(operand1),
      .operand2(operand2),
      .opcode(opcode),
      .cin(cin),
      .result(result),
      .cout(cout)
   );

   // Clock generation
   always #((CLK_PERIOD)/2) clk = ~clk;

   // Test stimulus
   initial begin
      // Initialize inputs
      operand1 = 4'b0101;
      operand2 = 4'b0011;
      opcode = 3'b000; // Addition
      cin = 1'b0;

      // Apply inputs and clock
      #10;
      $display("Operand1 = %b, Operand2 = %b, Opcode = %b", operand1, operand2, opcode);
      $display("Performing addition:");
      $display("Expected Result = %b, Expected Carry Out = %b", operand1 + operand2, ((operand1[3] & operand2[3]) | (operand2[3] & ~result[3]) | (operand1[3] & ~result[3])));
      $display("Actual Result   = %b, Actual Carry Out   = %b", result, cout);
      
      // Change inputs for other operations
      opcode = 3'b001; // Subtraction
      $display("Performing subtraction:");
      $display("Expected Result = %b", operand1 - operand2);
      $display("Actual Result   = %b", result);
      
      opcode = 3'b010; // Bitwise AND
      $display("Performing bitwise AND:");
      $display("Expected Result = %b", operand1 & operand2);
      $display("Actual Result   = %b", result);
      
      opcode = 3'b011; // Bitwise OR
      $display("Performing bitwise OR:");
      $display("Expected Result = %b", operand1 | operand2);
      $display("Actual Result   = %b", result);
      
      opcode = 3'b100; // Bitwise XOR
      $display("Performing bitwise XOR:");
      $display("Expected Result = %b", operand1 ^ operand2);
      $display("Actual Result   = %b", result);
      
      // Finish simulation
      $finish;
   end

endmodule
