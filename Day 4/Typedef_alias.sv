/*What is typedef?

typedef is used to create a new name for an existing data type.

Think of it as: “Give a meaningful name to a type.”*/

//Basic Syntax
typedef <existing_type> <new_type_name>;

//Simple Example
typedef logic [7:0] byte_t;
byte_t data;


/*👉 Here:

byte_t is now a new type name

data is an 8-bit logic vector*/
//Why typedef is Needed?
//❌ Without typedef (messy)
logic [31:0] addr;
logic [31:0] data;
logic [31:0] reg_out;

//✅ With typedef (clean & readable)
typedef logic [31:0] word_t;
word_t addr, data, reg_out;

/*2️⃣ alias in SystemVerilog
What is alias?

alias creates another name for an existing variable or net, not a type.

Think of it as two names pointing to the same signal.*/

//Basic Syntax
alias new_name = existing_signal;

//Simple Example
logic a;
alias b = a;
a = 1;
$display(b);  // prints 1
b = 0;
$display(a);  // prints 0
