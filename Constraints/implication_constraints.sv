//SystemVerilog gives us two constructs to declare conditional relations - implication and if else.
// the following code shows both the styles

// Implication operator "->" tells that len should be greater than 10 when mode is equal to 2
constraint c_mode {  mode == 2 -> len > 10; }

// Same thing can be achieved with "if-else" construct
constraint c_mode { if (mode == 2)
						len > 10;
				  }

//example
class ABC;
  rand bit [2:0] mode;
  rand bit [3:0] len;

  constraint c_mode { mode == 2 -> len > 10; }//Note that mode need not be 2 for all values of len greater than 10. However, the constraint says that len should be greater than 10 if mode is 2.
endclass

module tb;
  initial begin
    ABC abc = new;
    for(int i = 0; i < 10; i++) begin
      abc.randomize();
      $display ("mode=%0d len=%0d", abc.mode, abc.len);
    end
  end
endmodule

//output: The simulation results show that mode need not have a value of 2 when len is greater than 10.
mode=1 len=11
mode=6 len=3
mode=3 len=9
mode=7 len=11
mode=3 len=15
mode=2 len=12
mode=3 len=6
mode=2 len=12
mode=4 len=9
mode=7 len=13


//another example

class ABC;
  rand bit [3:0] mode;
  rand bit 		 mod_en;

  // If 5 <= mode <= 11, mod_en should be 1
  constraint c_mode {	mode inside {[4'h5:4'hB]} -> mod_en == 1; }
//Note that mod_en is 1 whenever the LHS expression for mode is inside 4'h5 and 4'hB. However, mod_en can be randomized to any value if the LHS evaluates to false.
endclass

module tb;
  initial begin
    ABC abc = new;
    for (int i = 0; i < 10; i++) begin
    	abc.randomize();
      $display ("mode=0x%0h mod_en=0x%0h", abc.mode, abc.mod_en);
    end
  end
endmodule

//the difference between if else constraints and implication constraint is ... if else constraint provides else part to execute
/* Nested if-else blocks are allowed and multiple constraint statements require them to be enclosed in curly braces { }.
This is similar to the begin-end used in a procedural block like initial and always.
However, constraints are classified as declarative code and hence require curly braces instead.*/

class ABC;
  rand bit [3:0] mode;
  rand bit 		 mod_en;

  constraint c_mode {
    					if (mode inside {[4'h5:4'hB]})
  							mod_en == 1;
    else { 
                          if ( mode == 4'h1) {
      							mod_en == 1;
    						} else {
      							mod_en == 0;
    						}
  						}
                    }

endclass

module tb;
  initial begin
    ABC abc = new;
    for (int i = 0; i < 10; i++) begin
    	abc.randomize();
      $display ("mode=0x%0h mod_en=0x%0h", abc.mode, abc.mod_en);
    end
  end

endmodule
