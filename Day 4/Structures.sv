A structure can contain elements of different data types which can be referenced as a whole or individually by their names. This is quite different from arrays where the elements are of the same data-type.
structure can also be called as an array of different elements

// Normal arrays -> a collection of variables of same data type
int array [10];         // all elements are of int type
bit [7:0] mem [256];    // all elements are of bit type

// Structures -> a collection of variables of different data types
struct {
	byte    val1;
	int     val2;
	string  val3;
} struct_name;

//Syntax
struct {
	[list of variables]
} struct_name;

//By default structure is an unpacked one
//Example
module tb;
  	// Create a structure called "st_fruit"
	// which to store the fruit's name, count and expiry date in days.
  	// Note: this structure declaration can also be placed outside the module
	struct {
  		string fruit;
  		int    count;
  		byte 	 expiry;
	} st_fruit;

  initial begin
    // st_fruit is a structure variable, so let's initialize it
    st_fruit = '{"apple", 4, 15};

    // Display the structure variable
    $display ("st_fruit = %p", st_fruit);

    // Change fruit to pineapple, and expiry to 7
    st_fruit.fruit = "pineapple";
    st_fruit.expiry = 7;
    $display ("st_fruit = %p", st_fruit);
  end
endmodule

//can also be written as

 	// Note: this structure declaration can also be placed outside the module
	struct {
  		string fruit;
  		int    count;
  		byte 	 expiry;
	} st_fruit;
module tb;
  	// Create a structure called "st_fruit"
	// which to store the fruit's name, count and expiry date in days.
  initial begin
    // st_fruit is a structure variable, so let's initialize it
    st_fruit = '{"apple", 4, 15};//Enhanced literals are used to assign structured data based on the target variable’s type, avoiding bit-concatenation and enabling clean, ordered or named initialization of structs and arrays.

    // Display the structure variable
    $display ("st_fruit = %p", st_fruit);

    // Change fruit to pineapple, and expiry to 7
    st_fruit.fruit = "pineapple";
    st_fruit.expiry = 7;
    $display ("st_fruit = %p", st_fruit);
  end
endmodule

//structurew with typedef
typedef struct
{
  	string fruit;
  		int    count;
  		byte 	 expiry;
} st_fruit;//now st_fruit is one datatype with different values

st_fruit fruit1;
st_fruit fruit2;

//Example

module tb;
  	// Create a structure called "st_fruit"
	// which to store the fruit's name, count and expiry date in days.
  	// Note: this structure declaration can also be placed outside the module
	typedef struct {
  		string fruit;
  		int    count;
  		byte 	 expiry;
	} st_fruit;

  initial begin
    // st_fruit is a data type, so we need to declare a variable of this data type
    st_fruit fruit1 = '{"apple", 4, 15};
    st_fruit fruit2;

    // Display the structure variable
    $display ("fruit1 = %p fruit2 = %p", fruit1, fruit2);

    // Assign one structure variable to another and print
    // Note that contents of this variable is copied into the other
   	fruit2 = fruit1;
    $display ("fruit1 = %p fruit2 = %p", fruit1, fruit2);

    // Change fruit1 to see if fruit2 is affected
    fruit1.fruit = "orange";
    $display ("fruit1 = %p fruit2 = %p", fruit1, fruit2);
  end
endmodule

//Packed Structures
/*What is a Packed Structure in SystemVerilog?

A packed structure is a structure where all the members are packed together into a single contiguous vector of bits*/
struct packed {
    logic [3:0] id;
    logic       valid;
    logic [7:0] data;
} packet_t;
//Treating Packed Struct as a Vector

//Since it is packed, you can do this 👇

logic [12:0] bus;

bus = pkt;      // struct → vector
pkt = bus;      // vector → struct


//✅ This is NOT possible with unpacked structures

//Another example

typedef struct packed {
  bit [3:0] mode;
  bit [2:0] cfg;
  bit       en;
} st_ctrl;

module tb;
  st_ctrl    ctrl_reg;

  initial begin
    // Initialize packed structure variable
    ctrl_reg = '{4'ha, 3'h5, 1};
    $display ("ctrl_reg = %p", ctrl_reg);

    // Change packed structure member to something else
    ctrl_reg.mode = 4'h3;
    $display ("ctrl_reg = %p", ctrl_reg);

    // Assign a packed value to the structure variable
    ctrl_reg = 8'hfa;
    $display ("ctrl_reg = %p", ctrl_reg);
  end
endmodule

//Array of Structures
// Define the structure
typedef struct {
  int data;
  string name;
} MyStruct;

module array_examples;

  // 1. Fixed Array
  MyStruct fixed_array[5];

  // 2. Dynamic Array
  MyStruct dynamic_array[];

  // 3. Associative Array
  MyStruct associative_array[int];

  initial begin
    $display("--- Fixed Array Example ---");
    // Populate the fixed array
    for (int i = 0; i < 5; i++) begin
      fixed_array[i].data = i * 10;
      fixed_array[i].name = $sformatf("Fixed_%0d", i);//$sformatf creates a formatted string at runtime, allowing dynamic string assignment to structure members, unlike $display which only prints output.
      $display("fixed_array[%0d]: data=%0d, name=%s", i, fixed_array[i].data, fixed_array[i].name);
    end

    $display("
--- Dynamic Array Example ---");
    // Initialize and populate the dynamic array
    dynamic_array = new[3]; // Allocate space for 3 elements

    dynamic_array[0].data = 100;
    dynamic_array[0].name = "Dynamic_A";

    dynamic_array[1].data = 200;
    dynamic_array[1].name = "Dynamic_B";

    dynamic_array[2].data = 300;
    dynamic_array[2].name = "Dynamic_C";


    for (int i = 0; i < dynamic_array.size(); i++) begin
      $display("dynamic_array[%0d]: data=%0d, name=%s", i, dynamic_array[i].data, dynamic_array[i].name);
    end

    $display("
--- Associative Array Example ---");
    // Populate the associative array using keys
    associative_array[10] = '{101, "Assoc_X"};
    associative_array[25] = '{202, "Assoc_Y"};
	associative_array[5]  = '{303, "Assoc_Z"}; // Keys don't need to be in order


    // Iterating through associative array (keys are returned in sorted order)
    $display("Iterating through associative_array:");
    foreach (associative_array[key]) begin
      $display("associative_array[%0d]: data=%0d, name=%s", key, associative_array[key].data, associative_array[key].name);
    end
  end

endmodule
