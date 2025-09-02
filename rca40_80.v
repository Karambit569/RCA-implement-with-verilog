// 80비트 RCA - 40비트 RCA 2개로 구성
// 입력: 80비트 A, B, 1비트 Cin
// 출력: 80비트 합 S, 최종 캐리 Cout
module rca_80b_40 (S, A, B, Cout, Cin);
    input [79:0] A, B;
    input Cin;
    output [79:0] S;
    output Cout;

    wire carry;

    // 40비트 RCA 2개로 80비트 연산 구성
    rca_40b rca0 (S[39:0],  A[39:0],  B[39:0],  carry, Cin);
    rca_40b rca1 (S[79:40], A[79:40], B[79:40], Cout, carry);
endmodule
