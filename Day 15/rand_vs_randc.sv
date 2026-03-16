// inorder to randomize the variables in the procedural block, Variables are declared random using the rand or randc keyword. They can be used on normal variables, arrays, dynamic arrays or queues.
//using rand
class Packet;
	rand bit [2:0] data;
endclass

module tb;
	initial begin
		Packet pkt = new ();
		for (int i = 0 ; i < 10; i++) begin
			pkt.randomize ();
			$display ("itr=%0d data=0x%0h", i, pkt.data);
		end
	end
endmodule
//using radc
class Packet;
	randc bit [2:0] data;
endclass

module tb;
	initial begin
		Packet pkt = new ();
		for (int i = 0 ; i < 10; i++) begin
			pkt.randomize ();
			$display ("itr=%0d data=0x%0h", i, pkt.data);
		end
	end
endmodule

/*
rand  → random values (may repeat anytime)
randc → random cyclic (no repetition until cycle completes)
*/
