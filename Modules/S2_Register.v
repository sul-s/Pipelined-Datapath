module S2_Register(
    input        clk,
    input        rst,
    
    input [31:0] Reg_RD1,
    input [31:0] Reg_RD2,

    input [15:0] S1_IMM,
    input        S1_DataSource,
    input [2:0]  S1_ALUOP,
    input [4:0]  S1_WS,
    input        S1_WE,
    
    output reg        S2_DataSource,
    output reg [31:0] S2_RD1,
    output reg [31:0] S2_RD2,
    output reg [15:0] S2_IMM,
    output reg [2:0]  S2_ALUOP,
    output reg [4:0]  S2_WS,
    output reg        S2_WE
);

always @(posedge clk) begin
    //if rst then set everything to 0
    if (rst) begin
        S2_DataSource <= 0;
        S2_RD1 <= 0;
        S2_RD2 <= 0;
        S2_IMM <= 0;
        S2_ALUOP <= 0;
        S2_WS <= 0;
        S2_WE <= 0;
    end
    else begin
        S2_RD1 <= Reg_RD1;
        S2_RD2 <= Reg_RD2;

        S2_IMM <= S1_IMM;
        S2_ALUOP <= S1_ALUOP;
        S2_WS <= S1_WS;
        S2_WE <= S1_WE;

        S2_DataSource <= S1_DataSource;
    end
end

endmodule