module nor_gate (
    input wire a,   // First input
    input wire b,   // Second input
    output wire y   // Output (result of NOR operation)
);

// NOR gate logic
assign y = ~(a | ~b);

endmodule

// Testbench for NOR Gate
module testbench;

    reg a, b;       // Inputs for NOR gate
    wire y;         // Output from NOR gate

    // Instantiate the NOR gate
    nor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Test stimulus
    initial begin
        $dumpfile("nor_gate_tb.vcd");  // Dump file for waveform
        $dumpvars(0, testbench);

        // Test cases
        a = 0; b = 0; #10;  // Expect y = 1
        a = 0; b = 1; #10;  // Expect y = 0
        a = 1; b = 0; #10;  // Expect y = 0
        a = 1; b = 1; #10;  // Expect y = 0

        $finish;
    end

endmodule
