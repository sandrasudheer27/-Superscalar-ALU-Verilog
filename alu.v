module alu(
    input [3:0] A, B,             // 4-bit Inputs
    input [3:0] ALU_Sel,          // ALU Operation Selector
    output [3:0] ALU_Out,         // 4-bit ALU Output
    output CarryOut               // Carry Out flag (only for addition)
);

reg [3:0] ALU_Result;
wire [4:0] tmp;

assign ALU_Out = ALU_Result;

// Compute CarryOut only for addition
assign tmp = (ALU_Sel == 4'b0000) ? ({1'b0, A} + {1'b0, B}) : 5'b00000;
assign CarryOut = tmp[4];

always @(*) begin
    case(ALU_Sel)
        4'b0000: ALU_Result = A + B;                       // Addition
        4'b0001: ALU_Result = A - B;                       // Subtraction
        4'b0010: ALU_Result = A * B;                       // Multiplication
        4'b0011: ALU_Result = (B != 0) ? A / B : 4'b0000;  // Division with zero-check
        4'b0100: ALU_Result = A << 1;                      // Logical Shift Left
        4'b0101: ALU_Result = A >> 1;                      // Logical Shift Right
        4'b0110: ALU_Result = {A[2:0], A[3]};              // Rotate Left
        4'b0111: ALU_Result = {A[0], A[3:1]};              // Rotate Right
        4'b1000: ALU_Result = A & B;                       // AND
        4'b1001: ALU_Result = A | B;                       // OR
        4'b1010: ALU_Result = A ^ B;                       // XOR
        4'b1011: ALU_Result = ~(A | B);                    // NOR
        4'b1100: ALU_Result = ~(A & B);                    // NAND
        4'b1101: ALU_Result = ~(A ^ B);                    // XNOR
        4'b1110: ALU_Result = (A > B) ? 4'd1 : 4'd0;       // Greater than
        4'b1111: ALU_Result = (A == B) ? 4'd1 : 4'd0;      // Equal
        default: ALU_Result = 4'b0000;                     // Default
    endcase
end

endmodule
