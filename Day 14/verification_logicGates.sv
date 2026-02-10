//it contains verification of logic gates using system verilog

//AND Gate Design module
module AndGate(
  input logic a,
  input logic b,
  output logic y
);
  assign y = a & b;
endmodule

//verification using system verilog(contains interface, driver,transaction, main module)
interface and_if;
  logic a;
  logic b;
  logic y;
endinterface

class and_trans;
  logic a;
  logic b;
  function new(logic a, logic b);
    this.a = a;
    this.b = b;
  endfunction
endclass

class and_driver;
  virtual and_if vif;
  function new(virtual and_if vif);
    this.vif=vif;
  endfunction

  task drive(and_trans t);
    logic exp_y;
    vif.a= t.a;
    vif.b= t.b;
    #1;
    exp_y = t.a & t.b;
    if(vif.y == exp_y)
      $display("pass: a=%0b b=%0b", vif.a,vif.b);
    else
      $display("fail: a=%0b b=%0b", vif.a,vif.b);
  endtask
endclass

//top module
module tb;
  and_if if1();

  AndGate dut(
    .a(if1.a),
    .b(if1.b),
    .y(if1.y)
  );
  and_driver drv;

  initial begin
      drv= new(if1);
    drv.drive(new(0,0));
    drv.drive(new(0,1));
    drv.drive(new(1,0));
    drv.drive(new(1,1));
    $finish;
  end
  
endmodule

//OR Gate in System verilog
module or_gate(
  input logic a,
  input logic b,
  output logic y
);
  assign y = a | b;
endmodule


//verification using system verilog(contains interface, driver,transaction, main module)
interface and_if;
  logic a;
  logic b;
  logic y;
endinterface

class and_trans;
  logic a;
  logic b;
  function new(logic a, logic b);
    this.a = a;
    this.b = b;
  endfunction
endclass

class and_driver;
  virtual and_if vif;
  function new(virtual and_if vif);
    this.vif=vif;
  endfunction

  task drive(and_trans t);
    logic exp_y;
    vif.a= t.a;
    vif.b= t.b;
    #1;
    exp_y = t.a | t.b;
    if(vif.y == exp_y)
      $display("pass: a=%0b b=%0b", vif.a,vif.b);
    else
      $display("fail: a=%0b b=%0b", vif.a,vif.b);
  endtask
endclass

//top module
module tb;
  and_if if1();

  or_gate dut(
    .a(if1.a),
    .b(if1.b),
    .y(if1.y)
  );
  and_driver drv;

  initial begin
    dr                                                                                                                                                                                                                                      v= new(if1);
    drv.drive(new(0,0));
    drv.drive(new(0,1));
    drv.drive(new(1,0));
    drv.drive(new(1,1));
    $finish;
  end
  
endmodule


