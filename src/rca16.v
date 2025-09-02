// 16-bit Ripple Carry Adder (RCA)
// Input: 16-bit A, B, 1-bit Cin
// Output: 16-bit sum S, final carry Cout
module rca_16b (S, A, B, Cout, Cin);
    input [15:0] A, B;
    input Cin;
    output [15:0] S;
    output Cout;

    wire [15:0] carry;

    genvar i;
    generate
        // Instantiate 16 full_adders
        for (i = 0; i < 16; i = i + 1) begin : full_adders
            if (i == 0)
                // The first bit uses the input carry Cin
                full_adder fa (A[i], B[i], Cin, S[i], carry[i]);
            else
                // The rest use the carry from the previous stage
                full_adder fa (A[i], B[i], carry[i-1], S[i], carry[i]);
        end
    endgenerate

    // Final carry output
    assign Cout = carry[15];
endmodule
