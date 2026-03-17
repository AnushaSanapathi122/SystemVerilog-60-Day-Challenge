//1️⃣ Static Constraint: A static constraint is shared by all objects of the class.
//2️⃣ Non-Static Constraint (Default) : A non-static constraint belongs to each object separately.

//example
//Constraints are by default non-static and hence a separate copy exists for each class instance
class ABC;
  rand bit [3:0]  a;

  // Both are non-static constraints
  constraint c1 { a > 5; }
  constraint c2 { a < 12; }
endclass

module tb;
  initial begin
    ABC obj1 = new;
    ABC obj2 = new;
    for (int i = 0; i < 5; i++) begin
      obj1.randomize();
      obj2.randomize();
      $display ("obj1.a = %0d, obj2.a = %0d", obj1.a, obj2.a);
    end
  end
endmodule

//Example 2
class ABC;
  rand bit [3:0]  a;

  // "c1" is non-static, but "c2" is static
  constraint c1 { a > 5; }
  static constraint c2 { a < 12; }
endclass

module tb;
  initial begin
    ABC obj1 = new;
    ABC obj2 = new;

    // Turn off non-static constraint, here static contraint will be shared by all the objects so that the value assigned to a below 12 only
    obj1.c1.constraint_mode(0);//even for constraint is off for obj1 

    for (int i = 0; i < 5; i++) begin
      obj1.randomize();
      obj2.randomize();
      $display ("obj1.a = %0d, obj2.a = %0d", obj1.a, obj2.a);
    end
  end
endmodule

//another example
class ABC;
  rand bit [3:0]  a;

  // "c1" is non-static, but "c2" is static
  constraint c1 { a > 5; }
  static constraint c2 { a < 12; }
endclass

module tb;
  initial begin
    ABC obj1 = new;
    ABC obj2 = new;

    // Turn off static constraint
    obj1.c2.constraint_mode(0);
    obj1.c1.constraint_mode(0);

    /*\For obj1

c1 → ❌ disabled
c2 → ❌ disabled (static, so disabled globally)
👉 No constraints remain
a = 0 to 15   (full range of 4 bits)
🔸 For obj2
c1 → ✅ active
c2 → ❌ disabled (because static) Even when c2 is disabled for obj1 only it disables for object 2 also as it is shared
*/
    for (int i = 0; i < 5; i++) begin
      obj1.randomize();
      obj2.randomize();
      $display ("obj1.a = %0d, obj2.a = %0d", obj1.a, obj2.a);
    end
  end
endmodule
