module buffer (
    input wire a,   // Input signal
    output wire y   // Output signal (same as input)
);

// Continuous assignment for buffer (just passes input to output)
assign y = a;

endmodule

// Testbench for Buffer
module testbench;

    reg a;          // Input for buffer
    wire y;         // Output from buffer

    // Instantiate the buffer
    buffer uut (
        .a(a),
        .y(y)
    );

    // Test stimulus
    initial begin
        $dumpfile("buffer_tb.vcd");  // Dump file for waveform
        $dumpvars(0, testbench);

        // Test cases
        a = 0; #10;  // Expect y = 0
        a = 1; #10;  // Expect y = 1
        a = 0; #10;  // Expect y = 0

        $finish;
    end

endmodule
