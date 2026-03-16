//1️⃣ In-class Constraint
//An in-class constraint is written inside the class definition.

//Example
class packet;

  rand int addr;

  constraint addr_c {
    addr inside {[10:20]};
  }

endclass

//2️⃣ External Constraint
//An external constraint is declared inside the class but defined outside the class.

//example

//Step 1: Declare constraint in class
class packet;

  rand int addr;

  extern constraint addr_c;

endclass
//Step 2: Define constraint outside class
constraint packet::addr_c {
  addr inside {[10:20]};
}
//Explanation
extern tells the compiler that the constraint is defined outside the class.
packet:: is the scope resolution operator.


//example
  
class ABC;
	rand bit [3:0] mode;

	constraint c_implicit; 				
	extern constraint c_explicit; 
endclass

constraint ABC::c_implicit { mode > 2; };
constraint ABC::c_explicit { mode <= 6; };

module tb;
	ABC abc;

	initial begin
		abc = new();

		for (int i = 0; i < 5; i++) begin
			abc.randomize();
          $display ("mode = 0x%0h", abc.mode);
		end
	end
endmodule
