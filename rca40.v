// 40비트 Ripple Carry Adder (RCA)
// 입력: 40비트 A, B, 1비트 Cin
// 출력: 40비트 합 S, 최종 캐리 Cout
module rca_40b (S, A, B, Cout, Cin);
    input [39:0] A, B;
    input Cin;
    output [39:0] S;
    output Cout;

    wire [39:0] carry;

    genvar i;
    generate
        // 40개의 full_adder를 생성
        for (i = 0; i < 40; i = i + 1) begin : full_adders
            if (i == 0)
                // 첫 번째 비트는 입력 캐리 Cin 사용
                full_adder fa (A[i], B[i], Cin, S[i], carry[i]);
            else
                // 나머지는 이전 단계의 캐리를 입력으로 사용
                full_adder fa (A[i], B[i], carry[i-1], S[i], carry[i]);
        end
    endgenerate

    // 최종 캐리 출력
    assign Cout = carry[39];
endmodule
