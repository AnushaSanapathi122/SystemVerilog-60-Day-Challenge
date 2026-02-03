/*When size of a collection is unknown or the data space is sparse, an associative array is a better option. 
Associative arrays do not have any storage allocated until it is used, and the index expression is not restricted to integral expressions, but can be of any type.*/

data_type    array_identifier    [ index_type ];
//In an associative array, the value can be any data type, but once you declare the key datatype, all keys must be of that datatype only
//Example
module tb;

	int   	array1 [int]; 			// An integer array with integer index
	int   	array2 [string]; 		// An integer array with string index
	string  array3 [string]; 		// A string array with string index

  	initial begin
      	// Initialize each dynamic array with some values
    	array1 = '{ 1 : 22,
	            	6 : 34 };

		array2 = '{ "Ross" : 100,
	            	"Joey" : 60 };

		array3 = '{ "Apples" : "Oranges",
	            	"Pears" : "44" };

      	// Print each array
      $display ("array1 = %p", array1);
      $display ("array2 = %p", array2);
      $display ("array3 = %p", array3);
    end
endmodule

/*
Associative arrays internally sort keys.
string → alphabetical order
int → numerical order
bit/logic → binary order*/

//Assoxiative array methods
// example with next and prev
module tb;
  int aa_array [int];

  initial begin
    int idx;

    aa_array[5] = 20;
    aa_array[8] = 10;
    aa_array[1] = 50;
    aa_array[2] = 100;
    // Current index is 0, the next smallest value out of 1,2,5,8 is 1
    aa_array.next(idx);
    $display("aa_array[%0d]=%0d", idx, aa_array[idx]);

    // Current index is 1, the next smallest value out of 2,5,8 is 2
    aa_array.next(idx);
    $display("aa_array[%0d]=%0d", idx, aa_array[idx]);

    // Finds the largest index whose value is smaller than the given index
    // Current index is 5, the next largest value out of 1,2 is 2
    idx = 5;
    aa_array.prev(idx);
    $display("aa_array[%0d]=%0d", idx, aa_array[idx]);
  end
endmodule



//example using all methods
module tb;
    int      fruits_l0 [string];

    initial begin
      fruits_l0 = '{ "apple"  : 4,
                     "orange" : 10,
                     "plum"   : 9,
                     "guava"  : 1 };


      // size() : Print the number of items in the given dynamic array
      $display ("fruits_l0.size() = %0d", fruits_l0.size());


      // num() : Another function to print number of items in given array
      $display ("fruits_l0.num() = %0d", fruits_l0.num());


      // exists() : Check if a particular key exists in this dynamic array
      if (fruits_l0.exists ("orange"))
        $display ("Found %0d orange !", fruits_l0["orange"]);

      if (!fruits_l0.exists ("apricots"))
        $display ("Sorry, season for apricots is over ...");

      // Note: String indices are taken in alphabetical order
      // Correct order: apple, guava, orange, plum
      // first() : Get the first element in the array
      begin
      	string f;
        // This function returns true if it succeeded and first key is stored
        // in the provided string "f"
        if (fruits_l0.first (f))
          $display ("fruits_l0.first [%s] = %0d", f, fruits_l0[f]);
      end

      // last() : Get the last element in the array
      begin
        string f;
        if (fruits_l0.last (f))
          $display ("fruits_l0.last [%s] = %0d", f, fruits_l0[f]);
      end

      // prev() : Get the previous element in the array
      begin
        string f = "orange";
        if (fruits_l0.prev (f))
          $display ("fruits_l0.prev [%s] = %0d", f, fruits_l0[f]);
      end

      // next() : Get the next item in the array
      begin
        string f = "orange";
        if (fruits_l0.next (f))
          $display ("fruits_l0.next [%s] = %0d", f, fruits_l0[f]);
      end
    end
endmodule
