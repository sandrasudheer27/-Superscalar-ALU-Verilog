module superscalar_alu(
    input [3:0] A1, B1,         // Inputs for first ALU operation
    input [3:0] A2, B2,         // Inputs for second ALU operation
    input [3:0] ALU_Sel1,       // Operation selector for first ALU
    input [3:0] ALU_Sel2,       // Operation selector for second ALU
    output [3:0] ALU_Out1,      // Output of first ALU
    output [3:0] ALU_Out2,      // Output of second ALU
    output CarryOut1,           // Carry out of first ALU
    output CarryOut2            // Carry out of second ALU
);

// Instantiate two ALUs in parallel
alu alu1 (
    .A(A1),
    .B(B1),
    .ALU_Sel(ALU_Sel1),
    .ALU_Out(ALU_Out1),
    .CarryOut(CarryOut1)
);

alu alu2 (
    .A(A2),
    .B(B2),
    .ALU_Sel(ALU_Sel2),
    .ALU_Out(ALU_Out2),
    .CarryOut(CarryOut2)
);

endmodule
