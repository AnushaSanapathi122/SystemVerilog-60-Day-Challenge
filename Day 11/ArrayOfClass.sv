// Create a new class with a single member called
// count that stores integer values
//If we assign pkt to a new variable called pkt2, the new variable will also point to the contents in pkt.
class Packet;
	int count;
endclass

module tb;
  	// Create two "handles" for the class Packet
  	// Note: These "handles" now point to NULL
	Packet pkt, pkt2;

  	initial begin
      // Call the new() function of this class and
      // assign the member some value
      pkt = new();
      pkt.count = 16'habcd;
      // Display the class member using the "pkt" handle
      $display ("[pkt] count = 0x%0h", pkt.count);
      // Make pkt2 handle to point to pkt and print member variable
      pkt2 = pkt;
      $display ("[pkt2] count = 0x%0h", pkt2.count);
  	end
endmodule

/*output:
[pkt] count = 0xabcd
[pkt2] count = 0xabcd
*/

//Array of Class objects

//fixed array or static array

class Packet;
    int count;
    function new(int c = 0);
        count = c;
    endfunction
endclass

module tb;
    Packet fixed_array[5];
    initial begin
        $display("--- Fixed Array Example ---");
        for (int i = 0; i < 5; i++) begin
            fixed_array[i] = new(i * 10); // Create a new Packet object and assign it
            $display("fixed_array[%0d].count = %0d", i, fixed_array[i].count);
        end
endmodule


//Dynamic Array of class objects
module tb;

    // Declare a dynamic array of Packet objects
    Packet dynamic_array[];

    initial begin
     
        // Initialize the dynamic array with a specific size
        dynamic_array = new[3]; // Creates space for 3 Packet references

        // Initialize each element of the dynamic array
        for (int i = 0; i < dynamic_array.size(); i++) begin
            dynamic_array[i] = new(i + 1); // Create new Packet objects
            $display("dynamic_array[%0d].count = %0d", i, dynamic_array[i].count);
        end
endmodule


//Associative array of class objects
module tb;

    // Declare an associative array where the key is a string and the value is a Packet object
    Packet assoc_array[string];

    initial begin
        // Assign Packet objects to the associative array using string keys
        assoc_array["packet_A"] = new(50);
        assoc_array["packet_B"] = new(75);
        assoc_array["packet_C"] = new(100);

        // Access and display data using keys
        $display("assoc_array["packet_A"].count = %0d", assoc_array["packet_A"].count);
        $display("assoc_array["packet_C"].count = %0d", assoc_array["packet_C"].count);

        // Iterate through the associative array (order is not guaranteed unless specified)
      foreach (assoc_array[k]) begin
            $display("Key: %s, Count: %0d", k, assoc_array[k].count);
        end
        if (assoc_array.exists("packet_B")) begin
            $display("Packet_B exists in the associative array.");
        end
    end
endmodule
