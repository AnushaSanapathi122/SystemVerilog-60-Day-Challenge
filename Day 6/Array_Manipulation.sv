//Array Locator Methods
//The with clause and expresison is mandatory for some of these methods and for some others its optional.
/*
Method name	Description
find() :	Returns all elements satisfying the given expression
find_index():	Returns the indices of all elements satisfying the given expression
find_first():	Returns the first element satisfying the given expression
find_first_index():	Returns the index of the first element satisfying the given expression
find_last():	Returns the last element satisfying the given expression
find_last_index():	Returns the index of the last element satisfying the given expression*/

module tb;
  int array[9] = '{4, 7, 2, 5, 7, 1, 6, 3, 1};
  int res[$];

  initial begin
    res = array.find(x) with (x > 3);
    $display ("find(x)         : %p", res);

    res = array.find_index with (item == 4);
    $display ("find_index      : res[%0d] = 4", res[0]);

    res = array.find_first with (item < 5 & item >= 3);
    $display ("find_first      : %p", res);

    res = array.find_first_index(x) with (x > 5);
    $display ("find_first_index: %p", res);

    res = array.find_last with (item <= 7 & item > 3);
    $display ("find_last       : %p", res);

    res = array.find_last_index(x) with (x < 3);
    $display ("find_last_index : %p", res);
  end
endmodule


/*Methods	Description
min()	Returns the element with minimum value or whose expression evaluates to a minimum
max()	Returns the element with maximum value or whose expression evaluates to a maximum
unique()	Returns all elements with unique values or whose expression evaluates to a unique value
unique_index()	Returns the indices of all elements with unique values or whose expression evaluates to a unique value*/
module tb;
  int array[9] = '{4, 7, 2, 5, 7, 1, 6, 3, 1};
  int res[$];

  initial begin
    res = array.min();
    $display ("min          : %p", res);

    res = array.max();
    $display ("max          : %p", res);

    res = array.unique();
    $display ("unique       : %p", res);

    res = array.unique(x) with (x < 3);
    $display ("unique       : %p", res);

    res = array.unique_index;
    $display ("unique_index : %p", res);
  end
endmodule

//Array Ordering Methods
These methods operate and alter the array directly.

/*Method	Description
reverse()	Reverses the order of elements in the array
sort()	Sorts the array in ascending order, optionally using with clause
rsort()	Sorts the array in descending order, optionally using with clause
shuffle()	Randomizes the order of the elements in the array. with clause is not allowed here.*/

module tb;
  int array[9] = '{4, 7, 2, 5, 7, 1, 6, 3, 1};

  initial begin
    array.reverse();
    $display ("reverse  : %p", array);

    array.sort();
    $display ("sort     : %p", array);

    array.rsort();
    $display ("rsort    : %p", array);

    for (int i = 0; i < 5; i++) begin
    	array.shuffle();
      $display ("shuffle Iter:%0d  = %p", i, array);
    end
  end
endmodule
