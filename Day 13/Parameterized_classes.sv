//A parameterized class is a class where data types or values are decided when the class is used, not when it is written.
//Without parameterized class ❌
//You must write multiple classes:

class Packet8;
  bit [7:0] data;
endclass

class Packet16;
  bit [15:0] data;
endclass

//with parameterized classes
//Basic Syntax
class ClassName #(parameter TYPE_OR_VALUE = default);
  // class body
endclass

//example
class Packet #(parameter int WIDTH = 8);
  bit [WIDTH-1:0] data;

  function void display();
    $display("WIDTH=%0d data=0x%0h", WIDTH, data);
  endfunction
endclass
//5️⃣ Using the parameterized class
module tb;
  initial begin
    Packet #(8)  p8  = new();
    Packet #(16) p16 = new();

    p8.data  = 8'hAA;
    p16.data = 16'hBEEF;

    p8.display();
    p16.display();
  end
endmodule
//6️⃣ Output
WIDTH=8 data=0xaa
WIDTH=16 data=0xbeef

//Parameterized class with type parameter
class Box #(type T = int);
  T value;

  function void display();
    $display("value = %p", value);
  endfunction
endclass
//Usage
Box #(int)    b1 = new();
Box #(string) b2 = new();

b1.value = 10;
b2.value = "Hello";

b1.display();
b2.display();
//Output
value = 10
value = Hello

//Simple example (SIZE + TYPE together)
class Packet #(parameter int WIDTH = 8,
               type T = bit);
  T [WIDTH-1:0] data;

  function void display();
    $display("WIDTH=%0d data=%b", WIDTH, data);
  endfunction
endclass

//🔹 Usage examples
module tb;
  initial begin
    Packet #(8,  bit)   p1 = new();   // 8-bit bit vector
    Packet #(16, logic) p2 = new();   // 16-bit logic vector

    p1.data = 8'hAA;
    p2.data = 16'hBEEF;

    p1.display();
    p2.display();
  end
endmodule

//✅ Output
WIDTH=8 data=10101010
WIDTH=16 data=1011111011101111
