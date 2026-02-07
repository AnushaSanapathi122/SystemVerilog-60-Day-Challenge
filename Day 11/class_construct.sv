/*A class is something you create to represent an object.
It groups variables and functions together so they can work as one unit.*/

//Example
class myPacket;
  bit [2:0] header;     // data
  bit stop;             // data

  function void display(); // action
    $display("header=%0h stop=%0b", header, stop);
  endfunction
endclass

myPacket p1 = new();//prints nothing
myPacket p2 = new(3, 6);//invalid ... class constructor didnt accept arguments

//example
class myPacket;
	bit [2:0]  header;
	bit        encode;
	bit [2:0]  mode;
	bit [7:0]  data;
	bit        stop;
  //class construct and it should be a function with new() only
	function new (bit [2:0] header = 3'h1, bit [2:0] mode = 5);
		this.header = header;
		this.encode = 0;
		this.mode   = mode;
		this.stop   = 1;
		$display ("Header = 0x%0h, Encode = %0b, Mode = 0x%0h, Stop = %0b",
		           this.header, this.encode, this.mode, this.stop);
	endfunction
endclass
//usage in module
myPacket p1,p2;//class handles
 p1 = new();//prints nothing
 p2 = new(3, 6)

//function new () is called the constructor and is automatically called upon object creation.

//An array of classes can be created in a way similar to how you create an int type array.
module tb_top;
	myPacket pkt0 [3];

	initial begin
    	for(int i = 0; i < $size (pkt0); i++) begin
   	   		pkt0[i] = new ();
   		end
   	end
endmodule


//more examples with class construct
class Student;
  int roll_no;
  int marks;

  function new(int r, int m);
    roll_no = r;
    marks   = m;
  endfunction
endclass
//usage
Student s1 = new(3, 75);
$display("Roll=%0d Marks=%0d", s1.roll_no, s1.marks);
