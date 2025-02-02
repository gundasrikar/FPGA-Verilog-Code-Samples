module full_adder (
    input A, B, Cin,  // Inputs: Two operands and carry-in
    output S, Cout    // Outputs: Sum and carry-out
);

    wire P, G, H;  // Intermediate wires

    // First Half Adder
    assign P = A ^ B;    // XOR for Sum
    assign G = A & B;    // AND for Carry

    // Second Half Adder
    assign S = P ^ Cin;  // XOR with Cin for final Sum
    assign H = P & Cin; // Carry from second half adder

    // Final Carry Out
    assign Cout = G | H; // OR gate for final carry

endmodule
