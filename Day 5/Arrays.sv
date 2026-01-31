/*SystemVerilog Packed Arrays
SystemVerilog Array Manipulation
SystemVerilog Unpacked Arrays
SystemVerilog Arrays
SystemVerilog Queue
SystemVerilog Dynamic Array
SystemVerilog Associative Array
SystemVerilog Array Randomization*/
//An array is a collection of variables, all of the same type, and accessed using the same name plus one or more indices. there are different types of arrays, few array declaration examples are given below.

int array1 [6];            //fixed size single dimension array
int array2 [5:0];          //fixed size single dimension array
int array3 [3:0][2:0];     //fixed size multi dimension array(unpacked)
bit [7:0] array4[2:0];     //unpacked array declaration
bit [2:0][7:0] array5;     //packed array declaration
bit [2:0][7:0] array6 [3]; //mixed packed and unpacked array

/*In fixed size array, array size will be constant throughout the simulation, Once the array is declared no need to create it. By default, the array will be initialized with value ‘0’.*/

//Single dimensional array
int array1 [6];   //Compact declaration
int array2 [5:0]; // Verbose declaration

//multidimentional arrays
