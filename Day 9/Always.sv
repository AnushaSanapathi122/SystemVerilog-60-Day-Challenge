/*
Verilog always:
A general-purpose procedural block used for both combinational and sequential logic.

SystemVerilog always_comb / always_ff
Specialized procedural blocks that enforce correct modeling of combinational and sequential logic.
*/
//SystemVerilog introduces three specialized procedural blocks - always_comb, always_latch, and always_ff - to eliminate the ambiguity of Verilog’s general-purpose always block when modeling hardware.
//if you see the below example

module my_design (
    input  logic clk,
    input  logic reset_n, // Active-low reset
    input  logic d1,
    input  logic d2,
    output logic  q
);
    logic temp;
    always @(posedge clk) begin
      if (!reset_n)
        q <= 0;
      else begin
        // Blocking assignment (combinational style) mixed inside sequential block
        temp = d1 & d2;
        q <= temp | (q << 1);
        // Incrementing q again creates ambiguity in synthesis
        q = q + 1;
      end
    end
//The syntax and semantics are correct and hence there are no compiler or run time errors in simulation. However synthesis tools report errors and warnings
//SystemVerilog introduces three specialized procedural blocks - always_comb, always_latch, and always_ff - to eliminate the ambiguity of Verilog’s general-purpose always block when modeling hardware.

//example 1
  module alu_4_bit (
  input  logic  [3:0] a,
  input  logic  [3:0] b,
  input  logic  [1:0] op_code,
  output logic  [3:0] result
);

  // This is a combinational always block
  always_comb begin
    case (op_code)
      2'b00: begin
        result = a + b;  // Addition
      end
      2'b01: begin
        result = a - b;  // Subtraction
      end
      2'b10: begin
        result = a & b;  // Bitwise AND
      end
      2'b11: begin
        result = a | b;  // Bitwise OR
      end
    endcase
  end

endmodule

//example 2
always_ff @(posedge clk) begin
  count <= count + 1;
end

//example with always_latch
  always_latch begin
  if (en)
    q <= d;
end



endmodule
