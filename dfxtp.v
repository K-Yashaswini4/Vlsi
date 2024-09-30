module d_flipflop (
    input wire D,       // Data input
    input wire clk,     // Clock input
    input wire reset,   // Reset input (active high)
    output reg Q        // Output
);

// On rising clock edge or reset
always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 1'b0;  // Set Q to 0 when reset is active
    else
        Q <= D;     // Capture D on the rising clock edge
end

endmodule

// Testbench for D Flip-Flop
module testbench;

    reg D;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the D Flip-Flop
    d_flipflop uut (
        .D(D),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    always begin
        clk = 0; #5;  // 5ns low
        clk = 1; #5;  // 5ns high
    end

    // Test stimulus
    initial begin
        $dumpfile("d_flipflop_tb.vcd");  // Dump file for waveform
        $dumpvars(0, testbench);

        // Initialize inputs
        D = 0;
        reset = 1;  // Apply reset
        #15;
        reset = 0;  // De-assert reset

        // Test the D Flip-Flop behavior
        D = 1; #10; // Set D to 1, expect Q to follow after clock edge
        D = 0; #10; // Set D to 0, expect Q to follow after clock edge
        D = 1; #10; // Set D to 1 again

        // Test reset again
        reset = 1; #10;  // Apply reset, expect Q = 0
        reset = 0;

        $finish;
    end

endmodule
