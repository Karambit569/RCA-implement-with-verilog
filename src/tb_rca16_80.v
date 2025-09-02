`timescale 1ns / 1ps  // ← 백틱(`) 꼭 필요함!

module tb_rca16_80;

  reg [79:0] A, B;
  reg Cin;
  wire [79:0] S;
  wire Cout;

  // DUT (Design Under Test) 연결
  rca_80b_16 dut (
    .S(S),
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout)
  );

  initial begin
    $display("==== RCA 80bit (16bit blocks) Testbench ====");

    // Test 1: 기본 테스트
    A = 80'h00000000000000000001;
    B = 80'h00000000000000000001;
    Cin = 0;
    #10;
    $display("Test 1: A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    // Test 2: 최대값 + 1
    A = 80'h000000FFFFFFFFFFFF;
    B = 80'h000000000000000001;
    Cin = 0;
    #10;
    $display("Test 2: A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    // Test 3: 둘 다 0, Cin = 1
    A = 80'h00000000000000000000;
    B = 80'h00000000000000000000;
    Cin = 1;
    #10;
    $display("Test 3: A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    // Test 4: 무작위 큰 수 테스트
    A = 80'hABCDEF1234567890FFFF;
    B = 80'h11111111111111111111;
    Cin = 1;
    #10;
    $display("Test 4: A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    $display("==== Test finished ====");
    $stop;
  end

endmodule
