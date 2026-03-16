//Variables that are declared as rand or randc inside a class are randomized using the built-in randomize() method. The method returns 1 if randomization was successful, and 0 if it failed. It can fail due to a variety of reasons like conflicting constraints, solver could not come up with a value that meets all constraints and such. Class objects are not randomized automatically, and hence we should always call the randomize() method to do randomization.
// These are built-in functions that will execute before and after randomization

//Example
class Beverage;
  rand bit [7:0]	beer_id;

  constraint c_beer_id { beer_id >= 10;
                       beer_id <= 50; };
  function void pre_randomize ();
  	$display ("This will be called just before randomization");
  endfunction
  function void post_randomize ();
    $display ("This will be called after randomization");
  endfunction

endclass

module tb;
   Beverage b;

    initial begin
      b = new ();
      b.randomize ();
      $display ("After randomization beerId = %0d", b.beer_id);
    end
endmodule
