`timescale 1ns / 1ps

module alu_tb;

    reg [3:0] A, B;
    reg [3:0] ALU_Sel;
    wire [3:0] ALU_Out;
    wire CarryOut;

    // Instantiate the ALU
    alu uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );
	 
    initial begin
        $display("Time\tA\tB\tSel\tOut\tCarry");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, A, B, ALU_Sel, ALU_Out, CarryOut);

        // Apply test vectors
        A = 4'b0101; B = 4'b0011; ALU_Sel = 4'b0000; #10; // Add
        A = 4'b1000; B = 4'b0011; ALU_Sel = 4'b0001; #10; // Sub
        A = 4'b0011; B = 4'b0010; ALU_Sel = 4'b0010; #10; // Mul
        A = 4'b0110; B = 4'b0011; ALU_Sel = 4'b0011; #10; // Div
		  A = 4'b1010; ALU_Sel = 4'b0100; #10; // LSL
        A = 4'b1010; ALU_Sel = 4'b0101; #10; // LSR
        A = 4'b1101; ALU_Sel = 4'b0110; #10; // ROL
        A = 4'b1101; ALU_Sel = 4'b0111; #10; // ROR
        A = 4'b1010; B = 4'b1100; ALU_Sel = 4'b1000; #10; // AND
        A = 4'b1010; B = 4'b1100; ALU_Sel = 4'b1001; #10; // OR
        A = 4'b1010; B = 4'b1100; ALU_Sel = 4'b1010; #10; // XOR
        A = 4'b1010; B = 4'b1100; ALU_Sel = 4'b1011; #10; // NOR
		  A = 4'b1010; B = 4'b1100; ALU_Sel = 4'b1100; #10; // NAND
        A = 4'b1010; B = 4'b1100; ALU_Sel = 4'b1101; #10; // XNOR
        A = 4'b0111; B = 4'b0101; ALU_Sel = 4'b1110; #10; // Greater
        A = 4'b0111; B = 4'b0111; ALU_Sel = 4'b1111; #10; // Equal

        $finish;
    end

endmodule

