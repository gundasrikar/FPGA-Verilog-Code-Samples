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
