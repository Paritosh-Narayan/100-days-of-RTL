module ALU(input [3:0] operand1, // 4-bit input operand 1
           input [3:0] operand2, // 4-bit input operand 2
           input [2:0] opcode,   // 3-bit operation code
           input cin,            // Carry in for addition operation
           output reg [3:0] result, // 4-bit output result
           output reg cout);       // Carry out for addition operation

   always @(*) begin
      case(opcode)
         3'b000: result = operand1 + operand2; // Addition
         3'b001: result = operand1 - operand2; // Subtraction
         3'b010: result = operand1 & operand2; // Bitwise AND
         3'b011: result = operand1 | operand2; // Bitwise OR
         3'b100: result = operand1 ^ operand2; // Bitwise XOR
         default: result = 4'bxxxx; // Undefined operation
      endcase
      
      if (opcode == 3'b000) // Addition operation
         cout = (operand1[3] & operand2[3]) | (operand2[3] & ~result[3]) | (operand1[3] & ~result[3]);
      else
         cout = 1'b0; // Clear carry out for other operations
   end
endmodule
