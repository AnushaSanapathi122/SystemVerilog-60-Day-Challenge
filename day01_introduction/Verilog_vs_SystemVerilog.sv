// Verilog example
// Simple AND operation
module verilog_example;
  reg a, b;
  reg y;

  initial begin
    a = 1'b0;
    b = 1'b1;
    y = a & b;
    $display("Verilog Output y = %b", y);
  end
endmodule

//  SystemVerilog example
// Same AND operation using SystemVerilog
module systemverilog_example;
  logic a, b;
  logic y;

  initial begin
    a = 0;
    b = 1;
    y = a & b;
    $display("SystemVerilog Output y = %0b", y);
  end
endmodule

//verilog example combinational circuit
module combCkt(
  input a,b,
  output reg y1,y2
);
  always@(a or b)//or we can use always@(*)
    begin
      y1 = a & b;
      y2 = a | b;
    end
endmodule
//Systemverilog example combinational circuit
module combCkt(
  input logic a,b,
  output logic y1,y2
);
  always_comb
    begin
      y1 = a & b;
      y2 = a | b;
    end
endmodule
      
