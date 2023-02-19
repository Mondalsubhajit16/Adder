module adder (
    input  logic [1:0] A, B,
    input  logic resetn,
    output logic [2:0] out
);
    
    // Combinational addition with reset
    assign out = (resetn == 0) ? 3'b000 : (A + B);
    
endmodule

