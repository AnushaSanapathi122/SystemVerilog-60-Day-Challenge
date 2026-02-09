//Polymorphism means “one name, many behaviors.”
/*In SystemVerilog terms:
A base class handle can point to different child class objects,
and when you call a virtual method, the child’s version runs automatically*/

//Example
class Vehicle;
  virtual function void start();//in parent class function must be virtual
    $display("Vehicle started");
  endfunction
endclass
class Car extends Vehicle;
  function void start();
    $display("Car engine started");
  endfunction
endclass

class Bike extends Vehicle;
  function void start();
    $display("Bike pedaling started");
  endfunction
endclass
module tb;
  initial begin
    Vehicle v;

    v = new Car();
    v.start();

    v = new Bike();
    v.start();
  end
endmodule

/*output:
Car engine started
Bike pedaling started
*/
