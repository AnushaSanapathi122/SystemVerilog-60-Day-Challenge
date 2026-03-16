module tb;
  int a;
	initial begin
      for (int i = 0; i < 10; i++)
      	randcase
            1 	: 	$display ("a=%0d",5);
            5 	: 	$display ("a=%0d",0);
            3 	: 	$display ("a=%0d",2);
      	endcase
    end
endmodule

/*
The sum of all weights is 9, and hence the probability of taking the first branch is 1/9 or 11.11%,
the probability of taking the second branch is 5/9 or 55.56% and the probability of taking the last branch is 3/9 or 33.33%.
*/

/*
randcase in SystemVerilog is used to randomly select and execute one block of code based on specified probabilities (weights). 
Each branch in the randcase statement is assigned a weight, and the probability of executing that branch is proportional to its weight.
Unlike constraint randomization, randcase does not require the rand keyword or the randomize() method because it directly performs random selection among different procedural statements.
It is mainly used in verification testbenches to generate different scenarios such as read, write, reset, or error operations with controlled probabilities.
This mechanism helps verification engineers create varied test conditions and improves the effectiveness of testing by exploring different operational scenarios automatically.
*/
