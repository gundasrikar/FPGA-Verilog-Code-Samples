module half_adder (
    input A,     // Input: Single-bit binary number
    input B,     // Input: Single-bit binary number
    output P,    // Output: Sum
    output G     // Output: Carry
);

assign P = A ^ B;  // XOR for Sum
assign G = A & B;  // AND for Carry

endmodule
