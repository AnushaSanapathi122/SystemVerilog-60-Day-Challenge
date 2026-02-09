/*
this  → current object
super → parent object
*/
/*You use this when:
Method arguments have the same name as class variables
You want clarity that you are accessing object data*/
//simple example
class packet;
  int obj;
  function new (int obj)
    this.obj=obj;//Method arguments have the same name as class variables
  endfunction
endclass
  //another simple example
  class Packet;
  int id;
  function new(int id);
    this.id = id;   // left: object variable, right: argument
  endfunction
endclass


//for super keyword
/*super refers to the parent (base) class.
You use super to:
Call the parent class constructor
Call the parent class method
*/

class Base;
  int a;

  function new(int x);
    a = x;// argument of method is different from the class varaible hence no need to use this
  endfunction
endclass
class Child extends Base;
  int b;
  function new(int x, int y);
    super.new(x);   // call Base constructor,super is only used in the derived class
    b = y;
    $display("x=%d and y=%d", a, b);
  endfunction
endclass

//usage

module tb;
  initial begin
    Child d = new(2,3);
  end
endmodule

//Another example
class Base;
  function void show();
    $display("Base show");
  endfunction
endclass
class Child extends Base;
  function void show();
    super.show();   // call Base method
    $display("Child show");
  endfunction
endclass

//usage
module tb;
  initial begin
    Child x;
    x= new();
    x.show();
  end
endmodule

//use of virtual method
