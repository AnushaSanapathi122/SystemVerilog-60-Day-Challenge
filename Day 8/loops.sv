// different loops are there
/*
for loop
while loop
foreach
do while
repeat
*/
/*
A loop is a piece of code that keeps executing over and over.
A conditional statement is typically included in a loop so that it can terminate once the condition becomes true.
If the loop runs forever, then the simulation will hang indefinitely.*/
/*
forever:	Runs the given set of statements forever
repeat:	Repeats the given set of statements for a given number of times
while:	Repeats the given set of statments as long as given condition is true
for	:Similar to while loop, but more condense and popular form
do while:	Repeats the given set of statements atleast once, and then loops as long as condition is true
foreach:	Used mainly to iterate through all elements in an array
*/

//examples
//forever: This is an infinite loop, just like while (1).
module tb;
  initial begin
    forever begin
      #5 $display ("Hello World !");
    end
    end
    initial begin
      #50 $finish;
    end
endmodule
//Yes — both initial blocks start executing at the same simulation time (time = 0).


//example for repeat
module tb;
  initial begin
    repeat(5) begin
      #5 $display ("Hello World !");
    end
    end
endmodule

// example for while loop
module tb;
  logic clk;
  initial clk = 0;
  always #10 clk = ~clk;
  initial begin
  	bit [3:0] counter;
  	while (counter < 10) begin
    	@(posedge clk);
        $display ("Counter = %0d", counter);
      counter++;// Counter increments
  	end
  	$display ("Counter = %0d", counter);      // Counter = 10
    $finish;
end
endmodule

// example using foreach loop

module tb_top;
   bit [7:0] array [8];   // Create a fixed size array

   initial begin
      foreach (array [index]) begin
         array[index] = index;
      end
     $display ("array = %p", array);
   end
endmodule

//example using forloop
module tb;
  logic clk;//If clk is declared as bit, it is a 2-state variable and defaults to 0, so it will work even without explicit initialization
  initial clk=0;
  always #10 clk = ~clk;
  initial begin
  	bit [3:0] counter;
    $display ("Counter = %0d", counter);      // Counter = 0
  	for (counter = 2; counter < 14; counter = counter + 2) begin
    	@(posedge clk);
    	$display ("Counter = %0d", counter);      // Counter increments
  	end
    $display ("Counter = %0d", counter);      // Counter = 14
    $finish;
  end
endmodule

//Example using do while loop
module tb;
 bit clk;
  always #10 clk = ~clk;
  initial begin
  	bit [3:0] counter;
    $display ("Counter = %0d", counter);      // Counter = 0
		do begin
			@ (posedge clk);
			counter ++;
          $display ("Counter = %0d", counter);      // Counter increments
        end while (counter < 5); 
    $finish;
  end
endmodule
/* output:
Counter = 0
Counter = 1
Counter = 2
Counter = 3
Counter = 4
Counter = 5*/


//Syntax
//For loop
for ( [initialization]; <condition>; [modifier])
	// Single statement

for ( [initialization]; <condition>; [modifier]) begin
	// Multiple statements
end

//Foreach
foreach(<variable>[<iterator>])
	// Single statement

foreach(<variable>[<iterator>]) begin
	// Multiple statements
end

//foreach is equal to
for (int i = 0; i < $size(array); i++) begin
	// Statements inside the for loop
end

//repeat
repeat (<number>)
	// Single Statement

repeat (<number>) begin
	// Multiple Statements
end

//while and wo while loop

while (<condition>) begin
	// Multiple statements
end

do begin
	// Multiple statements
end while (<condition>);
