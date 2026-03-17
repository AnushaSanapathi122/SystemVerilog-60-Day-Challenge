/*
The inside keyword in SystemVerilog allows to check if a given value lies within the range specified using the inside phrase. 
This can also be used inside if and other conditional statements in addition to being used as a constraint
*/

//Syntax

<variable> inside {<values or range>}
// Inverted "inside"
!(<variable> inside {<values or range>})

//example
m_var inside {4, 7, 9} 		// Check if m_var is either 4,7 or 9
m_var inside {[10:100]} 	// Check if m_var is between 10 and 100 inclusive

// inside in conditional statements

module tb;
	bit [3:0] 	m_data;
	bit 		flag;

	initial begin
		for (int i = 0; i < 10; i++) begin
			m_data = $random;

			// Used in a ternary operator
			flag = m_data inside {[4:9]} ? 1 : 0;

			// Used with "if-else" operators
			if (m_data inside {[4:9]})
				$display ("m_data=%0d INSIDE [4:9], flag=%0d", m_data, flag);
			else
				$display ("m_data=%0d outside [4:9], flag=%0d", m_data, flag);

		end
	end
endmodule


//inside used in constraints

class ABC;
	rand bit [3:0] 	m_var;

	// Constrain m_var to be either 3,4,5,6 or 7
	constraint c_var { m_var inside {[3:7]}; }
endclass

module tb;
	initial begin
		ABC abc = new();
		repeat (5) begin
			abc.randomize();
			$display("abc.m_var = %0d", abc.m_var);
		end

	end
endmodule

//inverted inside

class ABC;
	rand bit [3:0] 	m_var;

	// Inverted inside: Constrain m_var to be outside 3 to 7
	constraint c_var { !(m_var inside {[3:7]}); }
endclass

module tb;
	initial begin
		ABC abc = new();
		repeat (5) begin
			abc.randomize();
			$display("abc.m_var = %0d", abc.m_var);
		end

	end
endmodule
