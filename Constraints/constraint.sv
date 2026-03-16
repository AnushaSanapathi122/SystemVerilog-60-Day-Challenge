/*
In verification, we often randomize variables to test many scenarios.
But completely random values may generate invalid or illegal conditions.
So we use constraints to control the random values.
Constraints tell the constraint solver what values are allowed during randomization.
*/

//Simple definition
//Constraints restrict or control the values generated during randomization.

Types of Constraints in SystemVerilog
1️⃣ Basic Constraint: Restricts a variable value.
constraint c1 { a < 10; };

2️⃣ Range Constraint: Limits a variable within a range.
constraint c2 { a inside {[5:20]}; };

3️⃣ Inside Constraint: Allows only specific values.
constraint c3 { a inside {2,4,6}; }

4️⃣ Conditional Constraint (if–else)
constraint c4 {
  if(mode == 1)
     addr < 10;
  else
     addr > 20;
}
  
5️⃣ Implication Constraint (->)
constraint c5 {
  mode == 1 -> addr < 10;
}
  
6️⃣ Distribution Constraint (dist): Used for weighted randomization.
constraint c6 {
  a dist {10 := 5, 20 := 1};
}
  
7️⃣ Unique Constraint: Ensures all values are different.
constraint c7 {
  unique {a,b,c};
}
  
8️⃣ Solve Before Constraint: Specifies solving order.
constraint c8 {
  solve a before b;
}
  
9️⃣ Soft Constraint: Default constraint that can be overridden.
constraint c9 {
  soft addr == 10;
}
  
🔟 Foreach Constraint: Used with arrays.
constraint c10 {
  foreach(arr[i])
     arr[i] inside {[1:10]};
}
  
1️⃣1️⃣ Inline Constraint: Applied during randomization.
obj.randomize() with { addr < 20; };
                            
1️⃣2️⃣ Disable / Enable Constraint: Control constraint execution.
obj.constraint_name.constraint_mode(0);
