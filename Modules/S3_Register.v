module S3_Register(
    input clk,
    input rst,
    input [31:0] ALU_ALUOUT,
    input [4:0] S2_WS,
    input S2_WE,

    output reg [31:0] S3_ALUOUT,
    output reg [4:0] S3_WS,
    output reg S3_WE
    );

always @(posedge clk) begin
    if (rst) begin
        S3_ALUOUT <= 0;
        S3_WS <= 0;
        S3_WE <= 0;
    end

    else begin
        S3_ALUOUT <= ALU_ALUOUT;
        S3_WS <= S2_WS;
        S3_WE <= S2_WE;
    end
end

endmodule