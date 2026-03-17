/*
All constraints are by default enabled and will be considered by the SystemVerilog constraint solver during randomization
A disabled constraint is not considered during randomization.
*/

//Constraints can be enabled or disabled by constraint_mode().

//constraint_mode() can be called both as a task and as a function.

// Called as a task
class_obj.const_name.constraint_mode(0); 			// Turn off the constraint
class_obj.const_name.constraint_mode(1); 			// Turn on the constraint

// Called as a function
status = class_obj.const_name.constraint_mode(); 	// status is an int variable to hold return value

//example
class Fruits;
  rand bit[3:0]  num; 				

  constraint c_num { num > 4;  		
                    num < 9; }; 	
endclass

module tb;
  initial begin
    Fruits f = new ();

    $display ("Before randomization num = %0d", f.num);
    if (f.c_num.constraint_mode ())//returns status of contraint_mode() , by default it is enabled means 1
      $display ("Constraint c_num is enabled");
    else
      $display ("Constraint c_num is disabled");

    f.randomize ();
    $display ("After randomization num = %0d", f.num);
  end
endmodule


//another example when constraint mode disabled
 class Fruits;
  rand bit[3:0]  num; 				

  constraint c_num { num > 4;  		
                    num < 9; }; 	
endclass
module tb;
  initial begin
    Fruits f = new ();
    $display ("Before randomization num = %0d", f.num);
    f.c_num.constraint_mode(0);// constraints disabled

    if (f.c_num.constraint_mode ())
      $display ("Constraint c_num is enabled");
    else
      $display ("Constraint c_num is disabled");
    
    f.randomize ();//randomization happens without constraints
    $display ("After randomization num = %0d", f.num);
  end
endmodule
