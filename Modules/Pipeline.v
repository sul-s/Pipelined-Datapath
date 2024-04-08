module Pipeline(
    input clk,
    input rst,
    input [31:0] InstrIn,
    output [31:0] ALUOUT
);

// S1 Output / S2 Input / Reg_File Input Bus
wire [4:0] S1_RS1, S1_RS2, S1_WS; //Stage One: 5 bit Read & Write Selects
wire [2:0] S1_ALUOP;                     //3 bit ALU Op code
wire [15:0] S1_IMM;                      //Single bit DataSource: Imm or R3 selection : 1 = Imm, 0 = R3
wire S1_DataSource, S1_WE;                      //16 bit IMM alternate data source

// Reg_File Output Bus
wire [31:0] Reg_RD1, Reg_RD2;

//S2 Output / Mux Input / ALU Input / S3 Input Bus
wire [31:0] S2_RD1, S2_RD2;
wire [15:0] S2_IMM;
wire [2:0]  S2_ALUOP;
wire [4:0]  S2_WS;
wire S2_WE, S2_DataSource;

//MUX Output Bus
wire [31:0] MUX_R3;

//ALU Out Bus
wire [31:0] ALU_R1;

//S3 Output / Reg_File Input Bus
wire [31:0] S3_ALUOUT;
wire [4:0] S3_WS;
wire S3_WE;

S1_Register Stage_One (
    .clk(clk),
    .rst(rst),

    .InstrIn(InstrIn),
    .S1_RS1(S1_RS1),
    .S1_RS2(S1_RS2),
    .S1_IMM(S1_IMM),
    .S1_DataSource(S1_DataSource),
    .S1_ALUOP(S1_ALUOP),
    .S1_WS(S1_WS),
    .S1_WE(S1_WE)
    );

nbit_register_file Register_File (
    .clk(clk),

    .read_data_1(Reg_RD1),
    .read_data_2(Reg_RD2), 

    .read_sel_1(S1_RS1),
    .read_sel_2(S1_RS2), 

    .write_data(S3_ALUOUT),
    .write_address(S3_WS),
    .RegWrite(S3_WE)
    );

S2_Register Stage_Two (
    .clk(clk),
    .rst(rst),

    .Reg_RD1(Reg_RD1),
    .Reg_RD2(Reg_RD2),

    .S1_IMM(S1_IMM),
    .S1_DataSource(S1_DataSource),
    .S1_ALUOP(S1_ALUOP),
    .S1_WS(S1_WS),
    .S1_WE(S1_WE),

    .S2_DataSource(S2_DataSource),
    .S2_RD1(S2_RD1),
    .S2_RD2(S2_RD2),
    .S2_IMM(S2_IMM),
    .S2_ALUOP(S2_ALUOP),
    .S2_WS(S2_WS),
    .S2_WE(S2_WE)
    );

MUX_DataSource Data_Select (
    .MUX_R3(MUX_R3), 
    .S2_DataSource(S2_DataSource),
    .S2_IMM(S2_IMM),
    .S2_RD2(S2_RD2)
    );

ALU ALU_Calc (
    .ALU_R1(ALU_R1),
    .ALU_R2(S2_RD1),
    .ALU_R3(MUX_R3),
    .ALU_ALUOP(S2_ALUOP)
    );

S3_Register Stage_Three (
    .clk(clk),
    .rst(rst),
    .ALU_ALUOUT(ALU_R1),
    .S2_WS(S2_WS),
    .S2_WE(S2_WE),

    .S3_ALUOUT(S3_ALUOUT),
    .S3_WS(S3_WS),
    .S3_WE(S3_WE)
    );

assign ALUOUT = S3_ALUOUT;

endmodule