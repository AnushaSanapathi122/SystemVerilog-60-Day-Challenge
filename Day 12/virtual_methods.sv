/*
A virtual method ensures that the child class method is called, even when you use a parent class handle.
Without virtual → parent method runs
With virtual → child method runs*/

//without virtual method

class Base;
  function void show();
    $display("Base show");
  endfunction
endclass

class Child extends Base;
  function void show();
    $display("Child show");
  endfunction
endclass

module tb;
  initial begin
    Base b;
    b = new Child();
    b.show();
  end
endmodule

//output: Base show

//with virtual
class Base;
  virtual function void show();
    $display("Base show");
  endfunction
endclass

class Child extends Base;
  function void show();
    $display("Child show");
  endfunction
endclass

module tb;
  initial begin
    Base b;
    b = new Child();
    b.show();
  end
endmodule

//output: Child show

//Virtual using in tasks

class Base;
  task run();
    $display("Base run");
  endtask
endclass

class Child extends Base;
  task run();
    $display("Child run");
  endtask
endclass

module tb;
  initial begin
    Base b;
    b = new Child();
    b.run();
  end
endmodule
//output= Base run

class Base;
 virtual task run();
    $display("Base run");
  endtask
endclass

class Child extends Base;
  task run();
    $display("Child run");
  endtask
endclass

module tb;
  initial begin
    Base b;
    b = new Child();
    b.run();
  end
endmodule
//output: Child run
//functions are for calculations and tasks are for actions
