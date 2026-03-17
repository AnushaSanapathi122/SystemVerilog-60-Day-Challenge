/*Consider that a class already has well written constraints and there is a need to randomize the class variables 
with a set of different constraints decided by the user.By using the with construct, users can declare in-line 
constraints at the point where the randomize() method is called. These additional constraints will be considered 
along with the object's original constraints by the solver.

The takeaway here is that constraints provided should not conflict with each other and in-line method of providing 
constraints does not override but instead is also considered along with the original by the solver.
*/

//example
class Item;
  rand bit [7:0] id;
  constraint c_id { id < 25; }

endclass

module tb;

  initial begin
    Item itm = new ();
    itm.randomize() with { id == 10; }; 		// In-line constraint using with construct
    $display ("Item Id = %0d", itm.id);
  end
endmodule

//another example
class Item;
  rand bit [7:0] id;

  constraint c_id { id == 25; }
endclass

module tb;
  initial begin
    Item itm = new ();
    if (! itm.randomize() with { id < 10; })// conflict will be there and randomization will not occur
    	$display ("Randomization failed");
    $display ("Item Id = %0d", itm.id);
  end
endmodule
