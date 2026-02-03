//Randomization of arrays means filling array elements with random values automatically.
//example for randomization of a packed array , it is going to be used in testbench
class packet;
rand int arr[5];
endclass
module tb;
  packet pkt;
  initial begin
    pkt=new();
    pkt.randomize();
    $display("array=%p",pkt.arr);
  end
endmodule

//examples without rand
module tb;
  int arr[5];
  initial begin
    foreach(arr[i]) begin
      arr[i] = $urandom_range(0,10);
    end
    $display("array=%p", arr);
  end
endmodule
// for dynamic array
module tb;
  int array[];
  initial begin
    array =new[3];
    foreach(array[i]) begin
      array[i] = $urandom_range(0,10);
    end
    $display("array=%p", array);
  end
endmodule

// with rand and constraints
class Packet;
  rand bit [3:0] 	s_array [7]; 	// Declare a static array with "rand"
endclass

module tb;
  Packet pkt;
  // Create a new packet, randomize it and display contents
  initial begin
    pkt = new();
    pkt.randomize();
    $display("queue = %p", pkt.s_array);
  end
endmodule

//Another Example
class packet;
  rand logic [4:0] array[];// size also randomizes

  constraint c_array {array.size()>5;array.size()<10};
  constraint c_val {foreach(array[i])
    array[i]==i;}; //here giving the condition that array[i] should be i only
   function void display();
     foreach (array[i])
      $display ("d_array[%0d] = 0x%0h", i, array[i]);
  endfunction
endclass
module tb;
  packet pkt;
  initial begin
    pkt = new();
    pkt.randomize();
    pkt.display();
  end
endmodule
/* randomize() is needed because constraints are only rules — they do nothing unless the randomization engine is triggered.
No randomize() → constraints are never applied. */   

//Queue Randomization
class Packet;
  rand bit [3:0] 	queue [$]; 	// Declare a queue with "rand"
  constraint c_array { queue.size() == 4; }
endclass

module tb;
  Packet pkt;
  initial begin
    pkt = new();
    pkt.randomize();
    $display("queue = %p", pkt.queue);
  end
endmodule
  
  
