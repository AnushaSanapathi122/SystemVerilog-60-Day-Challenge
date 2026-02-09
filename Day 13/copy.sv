// copy in system verilog can be done in 2 ways
1. Shallow copy
2. Deep copy

//Shallow copy = same object, two names
//example
class A;
  int x;
  function new(int x);
    this.x = x;
  endfunction
endclass
module tb;
  initial begin
    A a1 = new(10);
    A a2;
    a2 = a1;     // SHALLOW COPY
    a2.x = 20;

    $display("a1.x = %0d", a1.x);
    $display("a2.x = %0d", a2.x);
  end
endmodule
//Output
a1.x = 20
a2.x = 20

//deep copy
//🔹 Deep copy (simple)
Deep copy = new object with same values

//Example
class A;
  int x;
  function A copy();
    A temp = new();
    temp.x = this.x;
    return temp;
  endfunction
endclass

module tb;
  initial begin
    A a1 = new();
    A a2;
    a1.x = 10;
    a2 = a1.copy();   // DEEP COPY
    a2.x = 20;

    $display("a1.x = %0d", a1.x);
    $display("a2.x = %0d", a2.x);
  end
endmodule

//Output
a1.x = 10
a2.x = 20
