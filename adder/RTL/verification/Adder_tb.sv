`timescale 1ns / 1ps

module Adder_tb;

    // Declare testbench variables
    reg [1:0] A;  // First input
    reg [1:0] B;  // Second input
    wire [2:0] out;  // Output from the DUT (Device Under Test)

    // Instantiate the design under test (DUT)
    adder uut (
        .A(A),  
        .B(B),
        .out(out)
    );

    // Testbench process
    initial begin
        // Initialize inputs
        A = 2'b00;
        B = 2'b00;  

        // Apply test cases
        #10 A = 2'b01; B = 2'b01; // Case 1: 1 + 1
        #10 A = 2'b10; B = 2'b10; // Case 2: 2 + 2
        #10 A = 2'b11; B = 2'b01; // Case 3: 3 + 1
        #10 A = 2'b10; B = 2'b11; // Case 4: 2 + 3

        // Finish simulation
        #10 $stop;
    end

    // Monitor output for verification
    initial begin
        $monitor("At time %t: A = %b, B = %b, out = %b", $time, A, B, out);
    end

endmodule
