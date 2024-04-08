module MUX_DataSource(
    output reg [31:0] MUX_R3, 
    input             S2_DataSource,
    input [15:0]      S2_IMM,
    input [31:0]      S2_RD2
);

//S2_DataSource is select line: if 1 output imm else output S2_RD2
always @(*) begin
    case (S2_DataSource)
    1'b1 : MUX_R3[15:0] = S2_IMM;
    1'b0 : MUX_R3 = S2_RD2;
    endcase
end
endmodule