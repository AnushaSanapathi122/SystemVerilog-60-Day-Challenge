//Dynamic cast safely converts a base class handle to a derived class handle at runtime to access child-specific members.
class Base;
endclass

class Child extends Base;
  int x;
endclass

module tb;
  initial begin
    Base  b;
    Child c;

    b = new Child();          // Base handle → Child object

    if ($cast(c, b)) begin   // dynamic cast
      c.x = 10;
      $display("x = %0d", c.x);
    end
  end
endmodule

//Static cast is a SystemVerilog feature that allows converting an expression from one data type to another at compile time.
//Syntax
'(value or variable or expression)

//examples converts from one data type to another compatible data type
module tb;

	initial begin
    $display("data=%0d", int'("Hello World"));
 	end
endmodule
//Output
	data=1869769828

//example 2
module tb;
  	initial begin
      $display("data=%0.3f", int'(3.4 + 2 * 1.5));
end
  endmodule
//Output
	data=6.000

//example 3 When casting from a larger data type to a smaller one, static cast truncates the least significant bits of the source value.
module tb;
	int 	data;
	initial begin
		data = int'(3.145);
		$display("data=%0.3f", data);
 	end
endmodule
//Output
	data=3.000
