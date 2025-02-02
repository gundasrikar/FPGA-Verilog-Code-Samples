# Verilog for FPGA Development

<div style="text-align: justify;">
  
Verilog is a hardware description language (HDL) used to model and simulate digital circuits, making it essential for FPGA development. It enables designers to describe hardware behavior at various abstraction levels, from gate-level to system-level. FPGAs use Verilog code to configure logic blocks, allowing flexible and reprogrammable circuit design.

</div>

# Declaration and instantiation of modules in Verilog.

# 1. Full Adder 

![image](https://github.com/user-attachments/assets/abd56ad4-f418-47e3-8ca9-35bd926dd845)

**Full Adder Verilog Code**

```
module full_adder (
    input A, B, Cin,  // Inputs: Two operands and carry-in
    output S, Cout    // Outputs: Sum and carry-out
);

    wire P, G, C1;  // Intermediate wires

    // First Half Adder
    assign P = A ^ B;    // XOR for Sum
    assign G = A & B;    // AND for Carry

    // Second Half Adder
    assign S = P ^ Cin;  // XOR with Cin for final Sum
    assign C1 = P & Cin; // Carry from second half adder

    // Final Carry Out
    assign Cout = G | C1; // OR gate for final carry

endmodule
```

**Full Adder Testbench (Verilog)**

```
module full_adder_tb;
    reg A, B, Cin;      // Test inputs
    wire S, Cout;       // Test outputs

    // Instantiate Full Adder module
    full_adder uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .S(S), 
        .Cout(Cout)
    );

    initial begin
        // Test Cases
        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 1; B = 1; Cin = 1; #10;

        $finish;
    end

    // Display results
    initial begin
        $monitor("Time = %0t | A = %b | B = %b | Cin = %b | S = %b | Cout = %b", $time, A, B, Cin, S, Cout);
    end
endmodule
```

