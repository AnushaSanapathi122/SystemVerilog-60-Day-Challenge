/*What is const in SystemVerilog?
const is used to declare a variable whose value cannot be changed after initialization.
Think of const as read-only after it is set once.*/

//Basic Syntax
const data_type variable_name = value;
//📌 A const variable must be initialized at declaration.

/*👉 Rule of thumb
RTL → parameter
Testbench / classes → const*/

class Jumbo_Packet;
  // max_size is a global constant, same for all Jumbo_Packet instances
  const int max_size = 5 * 10;
  byte payload [];

  function new(int size);
    // payload size is limited by the global constant max_size
    payload = new[ size > max_size ? max_size : size ];
  endfunction
endclass
module tb;
  Jumbo_Packet 	m_pkt;
  initial begin
    m_pkt = new(100);

    $display("size=%d", m_pkt.payload.size());
  end
endmodule



//Another example
class Big_Packet;
  // size is an instance constant, determined at object creation
  const int size;

  byte payload [];

  function new();
    // The instance constant 'size' is assigned its value once in the constructor
    size = $urandom % 10;
    payload = new[ size ];
  endfunction
endclass

module tb;
  Big_Packet 	m_pkt;

  initial begin
    m_pkt = new();
    $display("size=%d", m_pkt.payload.size());
  end
endmodule
