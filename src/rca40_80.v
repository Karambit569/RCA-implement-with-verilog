// 80-bit RCA - constructed using two 40-bit RCAs
// Input: 80-bit A, B, 1-bit Cin
// Output: 80-bit sum S, final carry Cout
module rca_80b_40 (S, A, B, Cout, Cin);
    input [79:0] A, B;
    input Cin;
    output [79:0] S;
    output Cout;

    wire carry;

    // Connect two 40-bit RCAs to build an 80-bit adder
    rca_40b rca0 (S[39:0],  A[39:0],  B[39:0],  carry, Cin);
    rca_40b rca1 (S[79:40], A[79:40], B[79:40], Cout, carry);
endmodule
