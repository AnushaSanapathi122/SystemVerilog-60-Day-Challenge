/*
The normal constraints are called hard constraints because it is mandatory for the solver to always satisfy them. If the solver fails to find a solution, 
then the randomization will fail.
*/
//However, a constraint declared as soft gives the solver some flexibility

//example
class ABC;
  rand bit [3:0] data;

  // This constraint is defined as "soft"
  constraint c_data { soft data >= 4;
                     data <= 12; }
endclass

module tb;
  ABC abc;

  initial begin
    abc = new;
    for (int i = 0; i < 5; i++) begin
      abc.randomize();
      $display ("abc = 0x%0h", abc.data);
    end
  end
endmodule

//another example
class ABC;
  rand bit [3:0] data;

  // This constraint is defined as "soft"
  constraint c_data { soft data >= 4;
                     data <= 12; }
endclass

module tb;
  ABC abc;

  initial begin
    abc = new;
    for (int i = 0; i < 5; i++) begin
      abc.randomize() with { data == 2;}; //here contraint is modified as 2 .. random values that it can take is 2 only
      $display ("abc = 0x%0h", abc.data);
    end
  end
endmodule

//without soft keyword
class ABC;
  rand bit [3:0] data;

  // This constraint is defined as "soft"
  constraint c_data { data >= 4;
                     data <= 12; }
endclass

module tb;
  ABC abc;

  initial begin
    abc = new;
    for (int i = 0; i < 5; i++) begin
      abc.randomize() with {soft ==2;} ;// here inline contraint has conflict with hard constraints mentioned inside the class
      $display ("abc = 0x%0h", abc.data);
    end
  end
endmodule
