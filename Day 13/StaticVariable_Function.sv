//example for class instance
class Packet;
	bit [15:0] 	addr;
	bit [7:0] 	data;

  function new (bit [15:0] addr, bit [7:0] data);
		this.addr = addr;
		this.data = data;
		$display ("addr=0x%0h data=0x%0h", addr, data);
	endfunction
endclass

module tb;
	initial begin
    //Each class instance would normally have a copy of each of its internal variables.
		Packet 	p1, p2, p3;//class instance
		p1 = new (16'hdead, 8'h12);
		p2 = new (16'hface, 8'hab);
		p3 = new (16'hcafe, 8'hfc);
	end
endmodule

//using static keyword to variable
//When a variable inside a class is declared as static, that variable will be the only copy in all class instances, i.e, it will be shared between the instances
class Packet;
	bit [15:0] 	addr;
	bit [7:0] 	data;
	static int 	static_ctr = 0;//this will be shared by all instances
		   int 	ctr = 0;

	function new (bit [15:0] ad, bit [7:0] d);
		addr = ad;
		data = d;
		static_ctr++;
		ctr++;
		$display ("static_ctr=%0d ctr=%0d addr=0x%0h data=0x%0h", static_ctr, ctr, addr, data);
	endfunction
endclass

module tb;
	initial begin
		Packet 	p1, p2, p3;
		p1 = new (16'hdead, 8'h12);
		p2 = new (16'hface, 8'hab);
		p3 = new (16'hcafe, 8'hfc);
	end
endmodule

/*output:
static_ctr=1 ctr=1 addr=0xdead data=0x12
static_ctr=2 ctr=1 addr=0xface data=0xab
static_ctr=3 ctr=1 addr=0xcafe data=0xfc
*/
/*You'll see that the static counter is shared between all class objects p1, p2 and p3 and hence will increment to 3 when three packets are created.
On the other hand, the normal counter variable ctr is not declared as static and
hence every class object will have its own copy. This is the reason why ctr is still 1 after all three objects are created*/

//Example for static function

class Packet;
	static int ctr=0;
   function new ();
      ctr++;
   endfunction

	static function get_pkt_ctr ();
		$display ("ctr=%0d", ctr);
	endfunction

endclass

module tb;
	Packet pkt [6];
	initial begin
		for (int i = 0; i < $size(pkt); i++) begin
			pkt[i] = new;
		end
		Packet::get_pkt_ctr(); 	// Static call using :: operator
		pkt[5].get_pkt_ctr(); 	// Normal call using instance
	end
endmodule

	
//output:ctr = 6

//static function cannot access not static members
class Packet;
	static int ctr=0;
  bit [1:0] mode;//non static variable

   function new ();
      ctr++;
   endfunction

	static function get_pkt_ctr ();
		$display ("ctr=%0d mode=%0d", ctr, mode);
	endfunction
endclass
//usage
module tb; 
  initial begin
packet::get_pkt_ctr();
  end
endmodule
//Static functions cannot access non-static variables., hence error will be generated
