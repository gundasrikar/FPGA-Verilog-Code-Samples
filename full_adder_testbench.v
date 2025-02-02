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
