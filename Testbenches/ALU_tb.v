`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 09:02:43 AM
// Design Name: 
// Module Name: ALU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_tb;
//Inputs
 
    reg [31:0] R2;
    reg [31:0] R3;
    reg [2:0] ALUOp;
    reg clk;

//Outputs
    wire [31:0] R1;

  
//Instantiate unit under test
    ALU   ALU(.ALU_R1(R1), .ALU_R2(R2), .ALU_R3(R3), .ALU_ALUOP(ALUOp));

//Assign error_flag


    
    always #5 clk = ~clk;
    
    
    initial begin

        // Initialize Inputs
	R2 = 0;
	R3 = 0;
	ALUOp = 0;
	clk = 0;

    #10
    //MOV
    ALUOp = 0;
    R2 = 65; R3 = 0;
    #4
    R2 = 23; R3 = 1;
    #4
    R2 = 67; R3 = 6;
    #4
    R2 = 54; R3 = 4;
    
    //NOT
    ALUOp = 1;
    R2 = 817; R3 = 0;
    #4
    R2 = 23; R3 = 1;
    #4
    R2 = 67; R3 = 6;
    #4
    R2 = 54; R3 = 4;
    
    //ADD
    ALUOp = 3;
    R2 = 32'hffffffff; R3 = 32'hffffffff;
    #4
    R2 = 32'd1000; R3 = 32'd999;;
    #4
    R2 = 5; R3 = 12;
    #4
    R2 = 54; R3 = -53;
    
    
    //NOR
    ALUOp = 4;
    R2 = 9238423; R3 = 234234;
    #4
    R2 = 0; R3 = 0;
    #4
    R2 = 0; R3 = 32'hffffffff;
    #4
    R2 = 32'hffffffff; R3 = 32'hffffffff;
    
    //SUB
    ALUOp = 6;
    R2 = 323; R3 = 323;
    #4
    R2 = 23; R3 = 67;
    #4
    R2 = 67; R3 = 0;
    #4
    R2 = 100; R3 = -25;
    #4
    R2 = 32'hffffffff; R3 = 32'hffffffff;
    #4
    R2 = -32; R3 = -32;
    
    
    //NAND
    ALUOp = 5;
    R2 = 9238423; R3 = 234234;
    #4
    R2 = 0; R3 = 0;
    #4
    R2 = 0; R3 = 32'hffffffff;
    #4
    R2 = 32'hffffffff; R3 = 32'hffffffff;
    
    //AND
    ALUOp = 2;
    R2 = 9238423; R3 = 234234;
    #4
    R2 = 0; R3 = 0;
    #4
    R2 = 0; R3 = 32'hffffffff;
    #4
    R2 = 32'hffffffff; R3 = 32'hffffffff;
    
    //SLT
    ALUOp = 7;
    R2 = 65; R3 = 3;
    #4
    R2 = 25; R3 = -23;
    #4
    R2 = 4; R3 = 6;
    #4
    R2 = -54; R3 = 4;
    #4
    R2 = 4; R3 = 4;
    #4
    R2 = -4; R3 = -4;
    #4
    R2 = 0; R3 = 0;
    #4
    R2 = 34; R3 = -3;
    #4
    R2 = -3; R3 = 34;
    #4
    R2 = 0; R3 = 3;
    #4
    R2 = 0; R3 = -60;
    #4
    R2 = 3; R3 = 0;
    #4
    R2 = -90; R3 = 0;
    
    
   
    
    end


endmodule

