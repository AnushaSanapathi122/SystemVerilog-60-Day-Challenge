//Design code using SystemVerilog
module and_gate (
  input  logic a, b,
  output logic y
);
  assign y = a & b;
endmodule


//testbench using verilog for AND gate
module tb;

  logic a, b, y;

  // DUT
  and_gate dut (.a(a), .b(b), .y(y));

  initial begin
    // Generator + Driver
    a = 0; b = 0; #1;
    a = 0; b = 1; #1;
    a = 1; b = 0; #1;
    a = 1; b = 1; #1;

    // Monitor + Scoreboard
    $display("a=%0b b=%0b y=%0b", a, b, y);

    $finish;
  end
endmodule
//Testbench using system verilog for AND gate using different classes
Generator → Driver → Monitor → Scoreboard
️ SYSTEMVERILOG CLASS-BASED VERSION
//Ofcourse This much is not necessary for AND Gate because we can simple write using the verilog as shown above but let you know the testbench Syntax in System verilog

//transaction.sv(it is like the container of all the values)
class transaction;
  logic a;
  logic b;
  logic y;
endclass

//generator.sv
class generator;
  task generate(transaction tr);
    tr.a = $urandom_range(0,1);
    tr.b = $urandom_range(0,1);
  endtask
endclass

//driver.sv
class driver;
  task drive(transaction tr, ref logic a, ref logic b);
    a = tr.a;
    b = tr.b;
    #1;
  endtask
endclass

//monitor.sv
class monitor;
  task collect(transaction tr, logic y);
    tr.y = y;
  endtask
endclass

// scoreboard.sv
class scoreboard;
  task check(transaction tr);
    if (tr.y == (tr.a & tr.b))
      $display("PASS : a=%0b b=%0b y=%0b", tr.a, tr.b, tr.y);
    else
      $display("FAIL : a=%0b b=%0b y=%0b", tr.a, tr.b, tr.y);
  endtask
endclass

// tb_and_gate_class_based.sv
module tb_and_gate_class_based;

  logic a, b, y;

  // DUT
  and_gate dut (
    .a(a),
    .b(b),
    .y(y)
  );

  generator  gen;
  driver     drv;
  monitor    mon;
  scoreboard sb;
  transaction tr;

  initial begin
    gen = new();
    drv = new();
    mon = new();
    sb  = new();
    tr  = new();

    repeat (5) begin
      gen.generate(tr);       // generate inputs
      drv.drive(tr, a, b);    // drive DUT
      mon.collect(tr, y);     // observe output
      sb.check(tr);           // check result
    end
    $finish;
  end
endmodule
