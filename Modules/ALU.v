module ALU(ALU_R1, ALU_R2, ALU_R3, ALU_ALUOP);

parameter n = 32;
input [n-1:0] ALU_R2, ALU_R3;
input [2:0] ALU_ALUOP;
output reg [n-1:0] ALU_R1;

always @(*) begin
    case (ALU_ALUOP)
        3'b000: ALU_R1 = ALU_R2;                //MOV
        3'b001: ALU_R1 = ~ALU_R2;               //NOT
        3'b010: ALU_R1 = ALU_R2 & ALU_R3;           //AND
        3'b011: ALU_R1 = ALU_R2 + ALU_R3;           //ADD
        3'b100: ALU_R1 = ~(ALU_R2 | ALU_R3);        //NOR
        3'b101: ALU_R1 = ~(ALU_R2 & ALU_R3);        //NAND
        3'b110: ALU_R1 = ALU_R2 - ALU_R3;           //SUB
        3'b111: ALU_R1 = ALU_R2 < ALU_R3 ? 1 : 0;   //SLT
        default ALU_R1 = 0;
    endcase
end
endmodule