// 40-bit Ripple Carry Adder (RCA)
// Input: 40-bit A, B, 1-bit Cin
// Output: 40-bit sum S, final carry Cout
module rca_40b (S, A, B, Cout, Cin);
    input [39:0] A, B;
    input Cin;
    output [39:0] S;
    output Cout;

    wire [39:0] carry;

    genvar i;
    generate
        // Instantiate 40 full_adders
        for (i = 0; i < 40; i = i + 1) begin : full_adders
            if (i == 0)
                // The first bit uses the input carry Cin
                full_adder fa (A[i], B[i], Cin, S[i], carry[i]);
            else
                // The remaining bits use the carry from the previous stage
                full_adder fa (A[i], B[i], carry[i-1], S[i], carry[i]);
        end
    endgenerate

    // Final carry output
    assign Cout = carry[39];
endmodule
