/*✅ What is the use of Function and Task in SystemVerilog?
Both are used to reuse code, but they are used for different purposes.*/

/*🔹 1️⃣ Function — used for calculations
To calculate something and return a value to the caller.
Key points:
Returns one value
Used in expressions
No delays allowed (#, @ not allowed)*/

//example
function int add(int a, int b);
  return a + b;
endfunction
//in module
result = add(5, 3);
$display("result = %0d", result);


/*🔹 2️⃣ Task — used to perform actions
To perform an operation or action. It does not return a value.
Key pointsL:
No return value
Delays allowed
Can have multiple outputs*/

//example
task show_message();
  #5;
  $display("Hello from task");
endtask

//🔹 3️⃣ void Function — action without return : Used when you don’t want a return value but want function-style behavior. and even it will allow multiple outputs

//❌ Function: CANNOT return more than one value
function int calc(int a, int b);
  // cannot return sum AND diff
endfunction

//✅ Task: CAN return more than one value (using output arguments)
task calc_values(
  input  int a,
  input  int b,
  output int sum,
  output int diff
);
  sum  = a + b;
  diff = a - b;
endtask

//usage in module
calc_values(10,20, s,d);
$display("sum = %0d, diff = %0d", s, d);

//example with void
//Same thing using a void function (also valid)
function void calc_values(
  input  int a,
  input  int b,
  output int sum,
  output int diff
);
  sum  = a + b;
  diff = a - b;
endfunction


//Usage is the same:
calc_values(10, 4, s, d);
