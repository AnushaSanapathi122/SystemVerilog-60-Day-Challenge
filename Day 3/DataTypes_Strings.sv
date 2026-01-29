//Data types can be of 2 types builtin datatypes and the user defined datatypes
// first let me tell you about the enhanced literal(')
//Verilog allowed a vector to be easily left padded with 0, Z or X, but not for 1. This can be a limitation as shown in the example below when WIDTH parameter is scaled up.
parameter   n = 8;

reg [n-1:0]   m_var;

m_var = 'h0;     // Fills all bits of m_var with 0
m_var = 'hZ;     // Fills all bits of m_var with Z
m_var = 'hX;     // Fills all bits of m_var with X
m_var = 'h1;     // Only LSB is 1 making the value of m_var = 8'b0000_0001

m_var = {n{1'b1}};   // Workaround - Use concatenation operator to club together as many 1s required
initial begin
    m_var = '1;// fill all the ones
    $display("m_var1=0x%0h  m_var2=0x%0h", m_var);
//SystemVerilog allows the fill value to be specified without needing to indicate a binary, octal, or hexadecimal radix. Additionally, the fill value can now also be set to a logic 1.
  //Real data type is used to represent the floating point numbers or the exponential numbers(64 bit)
  module tb;
    real pi;
    real freq;
    initial begin
      pi= 3.14;
      freg=10e6;
      $display("value of the pi=%f",pi);
      $display("value of the pi=%0.f",pi);// gives values upto 3 values after decimal point
      $display("value of the pi=%d",freq);// it will write in its decimal form like 100000

//Strings: Each character in the string need 8 bits or byte to store as an integer
  // To store a string literal in an integral type, each character will require 8 bits
byte 		myLetter 	= "D";
bit [7:0] 	myletter1 	= "n";

      //General string Syntax[string <variable_name> = value] and "%s" is the format specifier
      string myname="Anusha";
      $display("My name is %s", myname);
      //we can also use looping here it is also like array of characters
      foreach(myname[i]) begin
        $display("%s", myname[i]);
      end

//Another example
reg  [16*8-1:0] 	my_string;           // Can store 16 characters
my_string = "How are you";              // 5 zeros are padded from MSB, and 11 char are stored
my_string = "How are you doing?";       // 18 characters; my_string will get "w are you doing?"

      //String operations(using operators)
      module tb;
  string firstname = "Anusha";
  string lastname  = "Poornima";

  initial begin
    // String Equality : Check if firstname equals or not equals lastname
    if (firstname == lastname)
      $display ("firstname=%s is EQUAL to lastname=%s", firstname, lastname);

    if (firstname != lastname)
      $display ("firstname=%s is NOT EQUAL to lastname=%s", firstname, lastname);

    // String comparison : Check if length of firstname < length of lastname
    if (firstname < lastname)
      $display ("firstname=%s is LESS THAN lastname=%s", firstname, lastname);

    // String comparison : Check if length of firstname > length of lastname
    if (firstname > lastname)
      $display ("firstname=%s is GREATER THAN lastname=%s", firstname, lastname);

    // String concatenation : Join first and last names into a single string
    $display ("Full Name = %s", {firstname, " ", lastname});

    // String Replication
    $display ("%s", {3{firstname}});

    // String Indexing : Get the ASCII character at index number 2 of both first and last names
    $display ("firstname[2]=%s lastname[2]=%s", firstname[2], lastname[2]);

  end
endmodule
      //String methods using(.) function     
      module tb;
   string str = "Hello World!";

   initial begin
   	  string tmp;

	  // Print length of string "str"
      $display ("str.len() = %0d", str.len());

      // Assign to tmp variable and put char "d" at index 3
      tmp = str;
      tmp.putc (3,"d");
      $display ("str.putc(3, d) = %s", tmp);

      // Get the character at index 2
      $display ("str.getc(2) = %s (%0d)", str.getc(2), str.getc(2));

      // Convert all characters to lower case
      $display ("str.tolower() = %s", str.tolower());

      // Comparison
      tmp = "Hello World!";
     $display ("[tmp,str are same] str.compare(tmp) = %0d", str.compare(tmp));//Strings are exactly equal compare() returns 0
      tmp = "How are you ?";
     $display ("[tmp,str are diff] str.compare(tmp) = %0d", str.compare(tmp));//Just remember: non-zero means NOT equal

      // Ignore case comparison
      tmp = "hello world!";
      $display ("[tmp is in lowercase] str.compare(tmp) = %0d", str.compare(tmp));
      tmp = "Hello World!";
      $display ("[tmp,str are same] str.compare(tmp) = %0d", str.compare(tmp));

      // Extract new string from i to j
      $display ("str.substr(4,8) = %s", str.substr (4,8));

   end
endmodule
// strings are mutable instead of changing the original string to perform the methods on it just store the original string in the temporary string so that we can perform every operation on that string
//string conversion methods also there 
