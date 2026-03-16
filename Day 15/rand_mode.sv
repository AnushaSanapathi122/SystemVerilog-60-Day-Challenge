/*
Randomization of variables in a class can be disabled using rand_mode method call.

This is very similar to the constraint_mode() method used to Disable Constraints. So a disabled random variable is treated the same as if they had not been declared rand or randc.

rand_mode can be called both as a function and task. Current state of the variable will be returned if it is called as a function.
*/
//By default, variables declared as rand and randc are enabled as visible in the example shown below.

Syntax:
[class_object].[variable_name].rand_mode (0);
[class_object].[variable_name].rand_mode (1);

//exampl(both are enabled)

class Fruits;
  rand bit [3:0] var1;
  rand bit [1:0] var2;
endclass

module tb;
  initial begin
    Fruits f = new();
    $display ("Before randomization var1=%0d var2=%0d", f.var1, f.var2);
    if (f.var1.rand_mode())
    	if (f.var2.rand_mode())
      		$display ("Randomization of all variables enabled");

    f.randomize();

    // Print the value of these variables after randomization
    $display ("After randomization var1=%0d var2=%0d", f.var1, f.var2);
  end
endmodule

//var 1 is disabled
class Fruits;
  rand bit [3:0] var1;
  rand bit [1:0] var2;
endclass

module tb;
  initial begin
    Fruits f = new();
    $display ("Before randomization var1=%0d var2=%0d", f.var1, f.var2);
    f.var1.rand_mode(0);
    	if (f.var2.rand_mode())
      		$display ("Randomization of all variables enabled");

    f.randomize();

    // Print the value of these variables after randomization
    $display ("After randomization var1=%0d var2=%0d", f.var1, f.var2);
  end
endmodule

//disbling var 2
class Fruits;
  rand bit [3:0] var1;
  rand bit [1:0] var2;
endclass

module tb;
  initial begin
    Fruits f = new();
    $display ("Before randomization var1=%0d var2=%0d", f.var1, f.var2);
    f.var2.rand_mode(0);
    if (f.var1.rand_mode())
      		$display ("Randomization of all variables enabled");

    f.randomize();

    // Print the value of these variables after randomization
    $display ("After randomization var1=%0d var2=%0d", f.var1, f.var2);
  end
endmodule

//disabling both

class Fruits;
  rand bit [3:0] var1;
  rand bit [1:0] var2;
endclass

module tb;
  initial begin
    Fruits f = new();
    $display ("Before randomization var1=%0d var2=%0d", f.var1, f.var2);
    f.var2.rand_mode(0);
     f.var1.rand_mode(0);
    if (! f.var1.rand_mode())
      if (! f.var2.rand_mode()) begin
        $display ("Randomization disabled");
      end
    else 
    f.randomize();

    // Print the value of these variables after randomization
    $display ("After randomization var1=%0d var2=%0d", f.var1, f.var2);
  end
endmodule
