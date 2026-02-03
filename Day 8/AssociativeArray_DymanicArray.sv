//Dynamic array of Associative arrays
module tb;
  // Create an associative array with key of type string and value of type int
  // for each index in a dynamic array
  int fruits [] [string];

  initial begin
    // Create a dynamic array with size 2
    fruits = new [2];

    // Initialize the associative array inside each dynamic array index
    fruits [0] = '{ "apple" : 1, "grape" : 2 };
    fruits [1] = '{ "melon" : 3, "cherry" : 4 };

    // Iterate through each index of dynamic array
    foreach (fruits[i])
      // Iterate through each key of the current index in dynamic array
      foreach (fruits[i][fruit])//any key name can be used to get the values in place of fruit we can use key
        $display ("fruits[%0d][%s] = %0d", i, fruit, fruits[i][fruit]);

  end
endmodule
/*output:
fruits[0][apple] = 1
fruits[0][grape] = 2
fruits[1][cherry] = 4
fruits[1][melon] = 3*/

//Dynamic Array with an associated Array
// Create a new typedef that represents a dynamic array
typedef int int_da [];

module tb;
  // Create an associative array where key is a string
  // and value is a dynamic array
  int_da fruits [string];

  initial begin
    // For key "apple", create a dynamic array that can hold 2 items
    fruits ["apple"] = new [2];

    // Initialize the dynamic array with some values
    fruits ["apple"] = '{ 4, 5};

    // Iterate through each key, where key represented by str1
    foreach (fruits[str1])
      // Iterate through each item inside the current dynamic array ie.fruits[str1]
      foreach (fruits[str1][i])
        $display ("fruits[%s][%0d] = %0d", str1, i, fruits[str1][i]);

  end
endmodule

/*output:
fruits[apple][0] = 4
fruits[apple][1] = 5*/
