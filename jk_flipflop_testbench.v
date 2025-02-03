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
