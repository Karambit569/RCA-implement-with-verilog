// 80-bit RCA - constructed using five 16-bit RCAs
// Input: 80-bit A, B, 1-bit Cin
// Output: 80-bit sum S, final carry Cout
module rca_80b_16 (S, A, B, Cout, Cin);
    input [79:0] A, B;
    input Cin;
    output [79:0] S;
    output Cout;

    wire [4:0] carry;

    // Connect five 16-bit RCAs to build an 80-bit adder
    rca_16b rca0 (S[15:0],   A[15:0],   B[15:0],   carry[0], Cin);
    rca_16b rca1 (S[31:16],  A[31:16],  B[31:16],  carry[1], carry[0]);
    rca_16b rca2 (S[47:32],  A[47:32],  B[47:32],  carry[2], carry[1]);
    rca_16b rca3 (S[63:48],  A[63:48],  B[63:48],  carry[3], carry[2]);
    rca_16b rca4 (S[79:64],  A[79:64],  B[79:64],  Cout,     carry[3]);
endmodule
