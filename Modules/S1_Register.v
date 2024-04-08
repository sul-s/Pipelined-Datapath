module S1_Register(InstrIn, S1_RS1, S1_RS2, S1_IMM, S1_DataSource, S1_ALUOP, S1_WS, S1_WE, clk, rst);

input [31:0] InstrIn;
input clk, rst;

output reg [4:0] S1_RS1, S1_RS2, S1_WS; //5 bit Read & Write Selects
output reg [2:0] S1_ALUOP; //3 bit ALU Op code
output reg S1_DataSource, S1_WE; //Single bit DataSource: Imm or R3 selection : 1 = Imm, 0 = R3
output reg [15:0] S1_IMM; //16 bit IMM alternate data source

always @(posedge clk) begin
    //if rst set every output to 0
    if (rst) begin
        S1_WS <= 0;
        S1_RS1 <= 0;
        S1_RS2 <= 0;
        S1_IMM <= 0;

        S1_DataSource <= 0;
        S1_ALUOP  <= 0;

        S1_WE  <= 1'b0;
    end
    else begin
        S1_RS1 <= InstrIn[20:16]; //R2
        S1_RS2 <= InstrIn[15:11]; //R3
        S1_IMM <= InstrIn[15:0];

        S1_DataSource <= InstrIn[29];
        S1_ALUOP  <= InstrIn[28:26];

        S1_WS <= InstrIn[25:21]; //R1
        S1_WE  <= 1'b1;
    end
end
endmodule