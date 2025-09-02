// 80비트 RCA - 16비트 RCA 5개로 구성
// 입력: 80비트 A, B, 1비트 Cin
// 출력: 80비트 합 S, 최종 캐리 Cout
module rca_80b_16 (S, A, B, Cout, Cin);
    input [79:0] A, B;
    input Cin;
    output [79:0] S;
    output Cout;

    wire [4:0] carry;

    // 16비트 RCA 5개를 연결해 80비트 연산 구성
    rca_16b rca0 (S[15:0],   A[15:0],   B[15:0],   carry[0], Cin);
    rca_16b rca1 (S[31:16],  A[31:16],  B[31:16],  carry[1], carry[0]);
    rca_16b rca2 (S[47:32],  A[47:32],  B[47:32],  carry[2], carry[1]);
    rca_16b rca3 (S[63:48],  A[63:48],  B[63:48],  carry[3], carry[2]);
    rca_16b rca4 (S[79:64],  A[79:64],  B[79:64],  Cout,     carry[3]);
endmodule
