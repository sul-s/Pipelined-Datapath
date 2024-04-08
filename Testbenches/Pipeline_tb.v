`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:34:40 10/16/2015
// Design Name:   Pipeline
// Module Name:   C:/Users/Ethan/Desktop/Pre_Lab6/Pre_Lab6/Pipeline_tb.v
// Project Name:  Pre_Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipeline_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] InstrIn;

	// Outputs
	wire [31:0] Out;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.rst(rst), 
		.InstrIn(InstrIn), 
		.ALUOUT(Out)
	);

	// Define clk
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		InstrIn = 0;

		// Wait 10 ns for global reset to finish
		
		//Value[Rx] = x*10; //by default from the nbit_register file
		
		
		//T0
		#10;              
		rst = 0;//            WS1   RS1   RS2
		InstrIn = 32'b010000_00010_00001_00000_00000000000;   // MOV R1 into R2   R2 = R1    R2=10
			           
		//T1           
		#10;              
		rst = 0;//           WS1   RS1   RS2
		InstrIn = 32'b010001_00011_0010_00000_00000000000;   // NOT R4 into R3   R3=~R4   R3 = -41(signed decimal)     
		               
		//T2           
		#10; //              WS1   RS1   RS2                
		InstrIn = 32'b010011_01011_01010_00101_00000000000;   // ADD R10 + R5 into R11    R11 = R10 + R5    R11 = 150
		               
		//T3           
		#10;           
		InstrIn = 32'b011011_01011_00110_00000_00110011101;   // ADDI   R6 + 413 into R11   R11 = R6 + 413   R11 = 473    Testing Register
                       
        //T4           
		#10;          
		InstrIn = 32'b010100_01001_00101_01000_00000000000;   // NOR  R7 and R8 into R9    R9 = ~(R7|R8)   R9 = 41  
		               
		//T5           
		#10;           
		InstrIn = 32'b010110_01100_10100_01111_00000000000;	  // SUB R20 and R15 into R12   R12 = R20 - R15    R12 = 50
		               
		//T6           
		#10;           
		InstrIn = 32'b011110_01100_01011_00000_00110011101;  // SUBI R6 and 413 into R12   R12 = R11 - 413   R12 = 60      Testing register
                       
        //T7           
        #10;           
		InstrIn = 32'b010101_00011_00101_00011_00000000000;   // NAND R15 and R14 into R13   R13 = ~(R15 & R14)   R13 = -19   
		               
		//T8           
		#10;           
		InstrIn = 32'b010010_100001_10000_10010_00000000000;   // AND  R16 and R18 into R17   R17 = R16 & R18      R17 = -161  
		               
		//T9           
		#10;           
		InstrIn = 32'b010111_11111_11110_11110_00000000000;	  // SLT  R30 < R30 into R31    R31 = 0 
		               
		//T10          
		#10;           
		InstrIn = 32'b010111_11111_11100_11110_00000000000;	  // SLT  R28 < R30 into R31    R31 = 1
                       
        
        


	end
      
endmodule
