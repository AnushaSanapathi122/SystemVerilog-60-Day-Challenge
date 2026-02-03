//break immediately exits the loop completely.
//continue skips the current iteration and moves to the next one.

module tb;
  	initial begin

      // This for loop increments i from 0 to 9 and exit
      for (int i = 0 ; i < 10; i++) begin

        // Let's create a condition such that the
        // for loop
        if (i == 7)
          continue;

        $display ("Iteration [%0d]", i);
      end
    end
endmodule
/*outout
Iteration [0]
Iteration [1]
Iteration [2]
Iteration [3]
Iteration [4]
Iteration [5]
Iteration [6]
Iteration [8]
Iteration [9]
*/

module tb;
  	initial begin

      // This for loop increments i from 0 to 9 and exit
      for (int i = 0 ; i < 10; i++) begin
        $display ("Iteration [%0d]", i);

        // Let's create a condition such that the
        // for loop exits when i becomes 7
        if (i == 7)
          break;
      end
    end
endmodule

/* output:
Iteration[0]
Iteration[1]
Iteration[2]
Iteration[3]
Iteration[4]
Iteration[5]
Iteration[6]
Iteration[7]
*/
