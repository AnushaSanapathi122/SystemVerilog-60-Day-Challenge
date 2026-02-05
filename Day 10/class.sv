/*
Class
Object
Handle
Constructor
new()
this
Inheritance
super
Virtual
Polymorphism
*/

//class:A class is a blueprint that describes data + behavior.
class Packet;
  int size;
endclass

//Object:An object is the real thing created from a class
Packet p = new();
//👉 Now memory is allocated.
//👉 p is a real Packet.

//Handle: A handle is a reference (pointer) to an object.
Packet p;
p is only a handle
No memory yet

//constructor:A constructor initializes the object when new() is called.
class Packet;
  int size;

  function new(int s);
    size = s;
  endfunction
endclass

Packet p = new(10);

//new():5️⃣ new():new() creates the object and calls the constructor

//6️ this:this refers to the current object.

class Packet;
  int size;

  function new(int size);
    this.size = size;
  endfunction
endclass

7️⃣ Inheritance
Meaning

//Inheritance: Inheritance means one class reuses another class.
class Packet;
  int size;
endclass

class DataPacket extends Packet;
  int data;
endclass

//super: super refers to the parent class.

Example
class Packet;
  function new();
    $display("Packet constructor");
  endfunction
endclass

class DataPacket extends Packet;
  function new();
    super.new(); // call parent constructor
    $display("DataPacket constructor");
  endfunction
endclass

//Virtual: virtual allows child class to override behavior.
class Packet;
  virtual function void display();
    $display("Packet");
  endfunction
endclass

/*Without virtual → no polymorphism
With virtual → polymorphism works*/

//Polymorphism (BIG WORD, SIMPLE IDEA): One handle, different behavior.
class Packet;
  virtual function void display();
    $display("Packet");
  endfunction
endclass

class DataPacket extends Packet;
  function void display();
    $display("DataPacket");
  endfunction
endclass

Packet p;
p = new DataPacket();
p.display();

//Output
DataPacket

/*
class        → blueprint
object       → real instance
handle       → pointer to object
new()        → creates object
constructor → initializes object
this         → current object
inheritance  → reuse
super        → parent class
virtual      → enable override
polymorphism → one handle, many behaviors
*/
