//Example for fixed Size array and packed array

module fixedsize_array;
  //declaration of array’s
  int array1[6];               //single dimension array contains 6 elements of 32 bit
  int array2[5:0];             //single dimension array
  int array3[2:0][3:0];        //multi dimension array 3 arrays containing 4 elements in total 12 elements of int(32 bits)
  int array4[4:0];

  initial begin
    //array initialization
    array1 = '{0,1,2,3,4,5};
    array2 = '{0,1,2,3,4,5};
    array3 = '{'{0,1,2,3},'{4,5,6,7},'{8,9,10,11}};
    foreach(array1[i]) begin
      $display("\t array1[%0d] = %0d",i,array1[i]);
    end
   
    for(int i=0;i<6;i++) begin
       $display("\t array2[%0d] = %0d",i,array2[i]);
    end
    foreach(array3[i,j]) begin
      $display("\t array3[%0d][%0d] = %0d",i,j,array3[i][j]);
    end
   
    for(int i=0;i<5;i++) begin
      $display("\t array4[%0d] = %0d",i,array4[i]);
    end
  end
endmodule

//Packed Array vs Unpacked array
//The term packed array is used to refer to the dimensions declared before the data identifier name
//The term unpacked array is used to refer to the dimensions declared after the data identifier name
bit [7:0] temp_var; // packed array
bit temp_var [7:0]; // unpacked array 

//Packed arrays
//single dimension packed arraysmodule tb;
	bit [7:0] 	m_data; 	// A vector or 1D packed array

	initial begin
		// 1. Assign a value to the vector
		m_data = 8'hA2;

		// 2. Iterate through each bit of the vector and print value
		for (int i = 0; i < $size(m_data); i++) begin
			$display ("m_data[%0d] = %b", i, m_data[i]);
		end
	end
endmodule


//2 dimentional packed arrays
module tb;
  bit [3:0][7:0] 	m_data; 	// A MDA, 4 bytes

	initial begin
		// 1. Assign a value to the MDA
		m_data = 32'hface_cafe;

      $display ("m_data = 0x%0h", m_data);

		// 2. Iterate through each segment of the MDA and print value
      for (int i = 0; i < $size(m_data); i++) begin
        $display ("m_data[%0d] = %b (0x%0h)", i, m_data[i], m_data[i]);
		end
	end
endmodule
//for a packd array, $size() returns the number of elements in the LEFTMOST packed dimension. in this case size is 4

//3d arrayy
module tb;
  bit [2:0][3:0][7:0] 	m_data; 	// An MDA, 12 bytes

	initial begin
		// 1. Assign a value to the MDA
      m_data[0] = 32'hface_cafe;
      m_data[1] = 32'h1234_5678;
      m_data[2] = 32'hc0de_fade;

      // m_data gets a packed value
      $display ("m_data = 0x%0h", m_data);

		// 2. Iterate through each segment of the MDA and print value
      foreach (m_data[i]) begin
        $display ("m_data[%0d] = 0x%0h", i, m_data[i]);
        foreach (m_data[i][j]) begin
          $display ("m_data[%0d][%0d] = 0x%0h", i, j, m_data[i][j]);
        end
      end
	end
endmodule

/* output:
m_data = 0xc0defade12345678facecafe
m_data[2] = 0xc0defade
m_data[2][3] = 0xc0
m_data[2][2] = 0xde
m_data[2][1] = 0xfa
m_data[2][0] = 0xde
m_data[1] = 0x12345678
m_data[1][3] = 0x12
m_data[1][2] = 0x34
m_data[1][1] = 0x56
m_data[1][0] = 0x78
m_data[0] = 0xfacecafe
m_data[0][3] = 0xfa
m_data[0][2] = 0xce
m_data[0][1] = 0xca
m_data[0][0] = 0xfe*/
