/*## SystemVerilog Randomization (CRV)

This example demonstrates **randomization in SystemVerilog using Constraint Random Verification (CRV)**.
Randomization is used in verification to automatically generate different input combinations to test the design thoroughly.

In this code, random variables are declared using `rand` and `randc`.

* `rand` generates completely random values and values may repeat anytime.
* `randc` (random cyclic) generates all possible values once before repeating.

Constraints are used to control the range of randomized values so that only valid scenarios are generated. This technique helps verification engineers explore multiple test cases efficiently and improves functional coverage.
You can write constraints in a variety of ways. Constraints should not contradict each other, else randomization will fail at run-time.
This example is useful for understanding the basics of **SystemVerilog randomization, constraints, and the difference between `rand` and `randc`** used in verification environments.
*/
class myPacket;

	rand   bit [1:0]    mode;
	randc  bit [2:0]    key;

    function display ();
       $display ("Mode : 0x%0h Key : 0x%0h", mode, key);
    endfunction
endclass

module tb_top;
	myPacket pkt;

	initial begin
		pkt = new ();
		for (int i = 0; i < 15; i++) begin
          if (pkt.randomize ())
            pkt.display ();
		end
	end
endmodule

//example 2
class myPacket;
	rand   bit [7:0] mode;
	randc  bit [7:0] key;
	int  low, high;

	constraint c_simple {  mode > 2;
	                       key == 3; }

    constraint c_range  { key inside {[low:high]};
    					mode inside {[21:50]};
                         mode inside {23, 24, 50}; }// if the 2 constraints are given to a same variable, It will be ANDed and randomised as it is satisfying 2 constraints 

  constraint c_invert { !(key inside {[2:5]}); }// key should be other than 2,3,4,5

constraint c_weight { mode inside {10, 10, 10, 22, 22};

 constraint c_key_dist  { key  dist {4:=50, 43:=10, [45:90]:=70 };//accoring to probability

 constraint c_mode_dist { mode dist {4:/10, 43:/30, [45:47]:/60 };// shared probabitlity will be there

 function void pre_randomize (); 
       this.low = 1;
       this.high = 2;
    endfunction
endclass
