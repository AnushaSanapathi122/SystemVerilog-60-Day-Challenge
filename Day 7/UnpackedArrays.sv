//An unpacked array is used to refer to dimensions declared after the variable name.
//Unpacked arrays may be fixed-size arrays, dynamic arrays, associative arrays or queues.
//Unpacked arrays are called “memory” because they represent multiple independent storage locations, just like real hardware memory cells.
//Unpacked arrays are non contigious

//small example
module tb;
  int arr[4];   // unpacked array consisting of 4 elements of 32 bits(int)

  initial begin
    arr[0] = 10;
    arr[1] = 20;
    arr[2] = 30;
    arr[3] = 40;

    for (int i = 0; i < 4; i++)
      $display("arr[%0d] = %0d", i, arr[i]);
  end
endmodule
//example 2
module tb;
	byte 	stack [8]; 		// depth = 8, 1 byte wide variable

	initial begin
		// Assign random values to each slot of the stack
		foreach (stack[i]) begin
      stack[i] = $random;// this function Generate a 32-bit random number,Truncate it to 8 bits, Store only the least significant 8 bits (LSBs) into stack[i]
			$display ("Assign 0x%0h to index %0d", stack[i], i);
		end

		// Print contents of the stack
		$display ("stack = %p", stack);
	end
endmodule

//Multidimensional Unpacked Array
module tb;
  byte 	stack [2][4]; 		// 2 rows, 4 cols

	initial begin
		// Assign random values to each slot of the stack
		foreach (stack[i])
          foreach (stack[i][j]) begin
            stack[i][j] = $random;
            $display ("stack[%0d][%0d] = 0x%0h", i, j, stack[i][j]);
			end

		// Print contents of the stack
		$display ("stack = %p", stack);
	end
endmodule

//Packed + Unpacked Array
module tb;
  bit [3:0][7:0] 	stack [2][4]; 		// 2 rows, 4 cols

	initial begin
		// Assign random values to each slot of the stack
		foreach (stack[i])
          foreach (stack[i][j]) begin
            stack[i][j] = $random;
            $display ("stack[%0d][%0d] = 0x%0h", i, j, stack[i][j]);
			end

		// Print contents of the stack
		$display ("stack = %p", stack);

		// Print content of a given index
    $display("stack[0][0][2] = 0x%0h", stack[0][0][2]);//stack[row][column][byte]

	end
endmodule
