/*SystemVerilog introduced the following if else constructs for violation checks.
unique-if
unique0-if
priority-if*/
//Unlike unique-if, unique0-if does not report a violation if none of the conditions match
//Using if else statements
if (a == 0)
  $display("A");
else if (a == 1)
  $display("B");
else
  $display("C");
/*
What SystemVerilog does here
Checks conditions top to bottom
Executes the first true one
No checking for mistakes
Overlapping conditions? ❌ No warning
Missing conditions? ❌ No warning*/

/*using unique and priority if
You are telling the simulator:
unique → “Only ONE condition can ever be true”
priority → “Order matters, first match wins”
If your promise is broken → simulator warns you.*/
//with else statement warning will not be generated

//Example using Unique if

module tb;
	int x = 4;
  	initial begin
    	unique if (x == 3)
      		$display ("x is %0d", x);
    	else if (x == 5)
      		$display ("x is %0d", x);
      	else
      		$display ("x is neither 3 nor 5");
    	unique if (x == 3)
      		$display ("x is %0d", x);
    	else if (x == 5)
      		$display ("x is %0d", x);
  	end
endmodule

/*output:
ncsim> run
x is neither 3 nor 5
ncsim: *W,NOCOND: Unique if violation:  Every if clause was false.*/

//Another Example

module tb;
	int x = 4;

  	initial begin
      	unique if (x == 4)
          $display ("1. x is %0d", x);
      	else if (x == 4)
          $display ("2. x is %0d", x);
      	else
          $display ("x is not 4");
  	end
endmodule

/* output:
1. x is 4
ncsim: *W,MCONDE: Unique if violation:  Multiple true if clauses at {line=8:pos=15 and line=10:pos=13}.*/


//Priority If condition
/*priority-if evaluates all conditions in sequential order and a violation is reported when:

None of the conditions are true or if there's no else clause to the final if construct*/
module tb;
	int x = 4;

  	initial begin
      	// This if else if construct is declared to be "unique"
		// Error is not reported here because there is a "else"
      	// clause in the end which will be triggered when none of
      	// the conditions match
    	priority if (x == 3)
      		$display ("x is %0d", x);
    	else if (x == 5)
      		$display ("x is %0d", x);
      	else
      		$display ("x is neither 3 nor 5");

      	// When none of the conditions become true and there
      	// is no "else" clause, then an error is reported
    	priority if (x == 3)
      		$display ("x is %0d", x);
    	else if (x == 5)
      		$display ("x is %0d", x);
  	end
endmodule

//Exit after first match in priority-if
module tb;
	int x = 4;
  	initial begin
      	// Exits if-else block once the first match is found
      	priority if (x == 4)
      		$display ("x is %0d", x);
      else if (x != 5)
      		$display ("x is %0d", x);
  	end
endmodule


//Unique and priority in case statements
/*unique,unique0 case
All case statements can be qualified by unique or unique0 keywords to perform violation checks like we saw in if-else-if construct.
unique and unique0 ensure that there is no overlapping case items and hence can be evaluated in parallel. If there are overlapping case items, then a violation is reported.
If more than one case item is found to match the given expression, then a violation is reported and the first matching expression is executed
If no case item is found to match the given expression, then a violation is reported only for unqiue*/

unique : No items match for given expression //error will be generated
module tb;
  bit [1:0] 	abc;

  initial begin
    abc = 1;
    // A violation is reported here
    unique case (abc)
      0 : $display ("Found to be 0");
      2 : $display ("Found to be 2");
    endcase
  end
endmodule

//unique : More than one case item matches violation occurs
module tb;
  bit [1:0] 	abc;
  initial begin
    abc = 0;
    // A violation is reported here
    unique case (abc)
      0 : $display ("Found to be 0");
      0 : $display ("Again found to be 0");
      2 : $display ("Found to be 2");
    endcase
  end
endmodule

//priority case
module tb;
  bit [1:0] 	abc;

  initial begin
    abc = 0;

    // First match is executed
    priority case (abc)
      0 : $display ("Found to be 0");
      0 : $display ("Again found to be 0");
      2 : $display ("Found to be 2");
    endcase
  end
endmodule
