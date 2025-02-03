# Verilog for FPGA Development

<div style="text-align: justify;">
  
Verilog is a hardware description language (HDL) used to model and simulate digital circuits, making it essential for FPGA development. It enables designers to describe hardware behavior at various abstraction levels, from gate-level to system-level. FPGAs use Verilog code to configure logic blocks, allowing flexible and reprogrammable circuit design.

You can use an online simulator like EDA Playground ( https://www.edaplayground.com/) to test the code and gain a better understanding of logic gates.

**Stay tuned for more updates, and happy learning :-) !**

</div>

# Declaration and instantiation of modules in Verilog.

# 1. Full Adder 

![image](https://github.com/user-attachments/assets/abd56ad4-f418-47e3-8ca9-35bd926dd845)

**Full Adder's Timing Waveform**

![image](https://github.com/user-attachments/assets/09de7355-4481-46e9-9090-253901d08080)

**Full Adder Verilog Code**

```
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
# 2. JK Flipflop

![image](https://github.com/user-attachments/assets/78d1fd7e-3ce3-4732-a9ba-3da819f1d0f2)

**JK Flipflop Timing Waveform**

![image](https://github.com/user-attachments/assets/39fafa4c-0b85-450d-b57f-8c8f90509341)


**JK Flipflop Verilog Code**

```
// JK Flip-Flop Module
module jk_flipflop(
    input J, K, clk,
    output reg Q, QB
);
  
    initial begin
      $dumpfile("dump.vcd"); $dumpvars;
    end
    
    always @(posedge clk) begin
        case ({J, K})
            2'b00: Q <= Q;      // No change
            2'b01: Q <= 0;      // Reset
            2'b10: Q <= 1;      // Set
            2'b11: Q <= ~Q;     // Toggle
        endcase
        QB <= ~Q;              // Complement of Q
    end
endmodule
```

**JK Flipflop Testbench (Verilog)**

```
// Testbench for JK Flip-Flop
module tb_jk_flipflop;
    reg J, K, clk;
    wire Q, QB;
    
    // Instantiate the JK flip-flop
    jk_flipflop uut (
        .J(J), .K(K), .clk(clk),
        .Q(Q), .QB(QB)
    );
    
    // Clock Generation
    initial begin
      $dumpfile("dump.vcd"); $dumpvars;
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end
    
    // Test Sequence
    initial begin
      $monitor("Time = %0t | clk = %b, J = %b, K = %b, Q = %b, QB = %b", $time, clk, J, K, Q, QB);
        
        J = 0; K = 0; #10; // No Change
        J = 0; K = 1; #10; // Reset
        J = 1; K = 0; #10; // Set
        J = 1; K = 1; #10; // Toggle
        J = 0; K = 0; #10; // No Change
        
        $finish;
    end
endmodule
```
