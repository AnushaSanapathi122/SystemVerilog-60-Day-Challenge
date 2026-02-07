//Inheritance means one class can reuse another class’s properties and methods.
//one class can be derived from another class inorder to access all the methods and functions from it using extend keyword

//example
class Packet;
   int addr;
  
   function new (int addr);
      this.addr = addr;
   endfunction
  
	function void display ();
		$display ("[Base] addr=0x%0h", addr);
	endfunction
endclass

// A subclass called 'ExtPacket' is derived from the base class 'Packet' using
// 'extends' keyword which makes 'EthPacket' a child of the parent class 'Packet'
// The child class inherits all variables and methods from the parent class
class ExtPacket extends Packet;

	// This is a new variable only available in child class
	int data;

   function new (int addr, data);
      super.new (addr); 	// Calls 'new' method of parent class
      this.data = data;
   endfunction

	function void display ();
		$display ("[Child] addr=0x%0h data=0x%0h", addr, data);
	endfunction
endclass

module tb;
	Packet      bc; 	// bc stands for BaseClass
	ExtPacket   sc; 	// sc stands for SubClass

	initial begin
		bc = new (32'hface_cafe);
		bc.display ();

        sc = new (32'hfeed_feed, 32'h1234_5678);
		sc.display ();
	end
endmodule

/*output:
[Base] addr=0xfacecafe
[Child] addr=0xfeedfeed data=0x12345678
*/

//simple examples for inheritance
class Vehicle;
  function new();
    $display("Vehicle started");
  endfunction
endclass

class Car extends Vehicle;

  function new()
    super.new();
    $display("vehicle started");
  endfunction
endclass
//Usage
Car c = new();

// Adding new members in child
//Parent
class Packet;
  int id;
endclass

//Child
class DataPacket extends Packet;
  int data;
endclass

//Usage
DataPacket dp;
dp = new();
dp.id = 10;
dp.data = 255;

$display("id=%0d data=%0d", dp.id, dp.data);


