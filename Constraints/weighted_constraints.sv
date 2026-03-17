/*
The dist operator allows you to create weighted distributions so that some values are chosen more often than others. 
The := operator specifies that the weight is the same for every specified value in the range while the 
:/ operator specifies that the weight is to be equally divided between all the values.
*/

//  := operator
rand bit [2:0] typ;
constraint dist1 	{  typ dist { 0:=20, [1:5]:=50, 6:=40, 7:=10}; }
/*In dist1, the weight of 0 is 20, 6 is 40, and 7 is 10 while 1 through 5 is 50, for a total of 320. 
Hence the probability of choosing 0 is 20/320 and the probability of choosing a value between 1 and 5 is 50/320. Let's look at a simple example.*/

//example
class myClass;
	rand bit [2:0] typ;
	constraint dist1 	{  typ dist { 0:=20, [1:5]:=50, 6:=40, 7:=10}; }
endclass

module tb;
	initial begin
		for (int i = 0; i < 10; i++) begin
			myClass cls = new ();
			cls.randomize();
			$display ("itr=%0d typ=%0d", i, cls.typ);
		end
	end
endmodule

// :/ operator
rand bit [2:0] typ;
constraint dist2  	{  typ dist { 0:/20, [1:5]:/50, 6:/10, 7:/20}; }
/* In dist2, the weight of 0 is 20, 6 is 10 and 7 is 20 while 1 through 5 share a total weight of 50, thus have 10 each. 
Hence the probability of choosing 0 is 20/100, and the probability of choosing a value between 1 and 5 is 10/100. Let's look at a simple example.*/

//Bidirectional constraints
//Constraint blocks are not executed from top to bottom like procedural code, but are all active at the same time. Let's see this with another example.

//example

class myClass;
	rand bit [3:0] val;
	constraint  c1 { val > 3;
	                 val < 12; }

	constraint  c2  {val >= 10; }
endclass

module tb;
	initial begin
		for (int i = 0; i < 10; i++) begin
			myClass cls = new ();
			cls.randomize();
			$display ("itr=%0d typ=%0d", i, cls.val);
		end
	end
endmodule
