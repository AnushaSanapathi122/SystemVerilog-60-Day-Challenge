//This file consists of information about 1)static arrays 2)dynamic arrays 3)associative arrays 4) queues
//A static arrayis one whose size is known before compilation time. In the example shown below, a static array of 8-bit wide is declared, assigned some value and iterated over to print its value.
//example
module tb;
	bit [7:0] 	m_data;
//Static arrays are further categorized into packed and unpacked arrays.
  bit [2:0][7:0] 	m_data; 			// Packed
bit [15:0] 		m_mem [10:0]; 		// Unpacked

  //Unpacked arrays may be fixed-size arrays, dynamic arrays, associative arrays or queues.
  //Packed arrays can only be static arrays

  //Dynamic Array
  //A dynamic array in SystemVerilog is an array whose size is decided and can be changed at runtime using the new[] operator.
  //Dymanic Array dimensions are specified by empty square brackets.
  [data_type] [identifier_name]  [];

bit [7:0] 	stack []; 		// A dynamic array of 8-bit vector
string 		names []; 		// A dynamic array that can contain strings

  //The new() function is used to allocate a size for the array and initialize its elements if required.
  
  
  //example
  module tb;
	// Create a dynamic array that can hold elements of type int
	int 	array [];

	initial begin
		// Create a size for the dynamic array -> size here is 5
		// so that it can hold 5 values
		array = new [5];

		// Initialize the array with five values
		array = '{31, 67, 10, 4, 99};

		// Loop through the array and print their values
		foreach (array[i])
			$display ("array[%0d] = %0d", i, array[i]);
	end
endmodule

//Methods in Dynamic Array
  1.size()//returns the size of the array , i.e no of elements present in that array
  2.delete()// deletes all the elements(empties) and size returns as 0

  //example
  module tb;
	// Create a dynamic array that can hold elements of type string
	string 	fruits [];

	initial begin
		// Create a size for the dynamic array -> size here is 5
		// so that it can hold 5 values
      	fruits = new [3];

		// Initialize the array with five values
      	fruits = '{"apple", "orange", "mango"};

      	// Print size of the dynamic array
    $display ("fruits.size() = %0d", fruits.size());//Even without assigning any elements, fruits.size() returns 3.

		// Empty the dynamic array by deleting all items
		fruits.delete();
		$display ("fruits.size() = %0d", fruits.size());
	end
endmodule

//resize the dynamic array
  fruits = new [4];
  /*In the above syntax, fruits will get allotted with 4 new memory locations and old values of fruits will get deleted. 
  old values of d_array1 elements can be retained by extending the current array by using the below syntax.*/
  fruits = new[4](fruits);
  //example
  int array [];
  fruits = new [3];

// This creates one more slot in the array, while keeping old contents
  fruits = new [array.size() + 1] (array);// it will add the last element(4th) element

//Another Example 
  module tb;
	// Create two dynamic arrays of type int
	int array [];
	int id [];

	initial begin
		// Allocate 5 memory locations to "array" and initialize with values
		array = new [5];
		array = '{1, 2, 3, 4, 5};

		// Point "id" to "array"
		id = array;

		// Display contents of "id"
		$display ("id = %p", id);

		// Grow size by 1 and copy existing elements to the new dyn.Array "id"
		id = new [id.size() + 1] (id);

		// Assign value 6 to the newly added location [index 5]
		id [id.size() - 1] = 6;

		// Display contents of new "id"
		$display ("New id = %p", id);

		// Display size of both arrays
		$display ("array.size() = %0d, id.size() = %0d", array.size(), id.size());
	end
endmodule
/*
output:
id = '{1, 2, 3, 4, 5}
New id = '{1, 2, 3, 4, 5, 6}
array.size() = 5, id.size() = 6*/
