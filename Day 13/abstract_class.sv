//Any class which is defined with virtual keyword is called abstract class we cannot make objects fromit
//let's start with an example
virtual class Shape;
  pure virtual function void draw();//pure virtual means it doesnot contain anything inside it
endclass

class Circle extends Shape;
  function void draw();
    $display("Drawing Circle");
  endfunction
endclass

    class Square extends Shape;
      function void draw();
        $display("Drawing square");
      endfunction
    endclass

module tb;
  initial begin
    Shape s, p;
    s = new Circle();
    p = new Square();
    s.draw();
    p.draw();
  end
endmodule
//output:
    Drawing Circle
    Drawing square

    
/*
Here, Shape is declared as a virtual class, which means it is an abstract class.
Abstract class means you cannot create an object of it, so writing new Shape() is illegal.

Inside Shape, there is a pure virtual function called draw().
Pure virtual means this function has no body here, and every child class must implement it.
*/


//Typedef 
    typedef class B; is a forward declaration
/*It tells SystemVerilog:
“Class B exists, I will define it later”
Because of this, class A can safely use a handle of class B
Later, class B is fully defined
program runs without error*/

//example
      class ABC;
	DEF 	def; 	// Error: DEF has not been declared yet
endclass

class DEF;
	ABC 	abc;
endclass

//with typedef
typedef class DEF;  // Inform compiler that DEF might be
                    // used before actual class definition

class ABC;
	DEF 	def;      // Okay: Compiler knows that DEF
	                // declaration will come later
endclass

class DEF;
	ABC 	abc;
endclass


//Another example
typedef class B;   // tell compiler: class B will come later

class A;
  B b;             // use class B before it is defined

  function void showA();
    $display("Inside A");
  endfunction
endclass

class B;
  function void showB();
    $display("Inside B");
  endfunction
endclass

module tb;
  initial begin
    A a = new();
    B b = new();

    a.showA();
    b.showB();
  end
endmodule

