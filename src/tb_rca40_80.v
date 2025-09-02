`timescale 1ns/1ps

module tb_rca40_80;

  reg [79:0] A, B;
  reg Cin;
  wire [79:0] S;
  wire Cout;

  // DUT (Design Under Test): 80-bit RCA built from two 40-bit RCAs
  rca_80b_40 dut (
    .S(S),
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout)
  );

  initial begin
    $display("==== RCA 80-bit (40-bit blocks) Testbench ====");

    // Test 1: Simple addition
    A = 80'h0000000000000001;
    B = 80'h0000000000000001;
    Cin = 0;
    #10;
    $display("Test 1: A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    // Test 2: Maximum 80-bit value + 1
    A = 80'hFFFFFFFFFFFFFFFF;
    B = 80'h0000000000000001;
    Cin = 0;
    #10;
    $display("Test 2: A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    // Test 3: Both inputs zero, carry-in = 1
    A = 80'h0000000000000000;
    B = 80'h0000000000000000;
    Cin = 1;
    #10;
    $display("Test 3: A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    // Test 4: Random large values with carry-in = 1
    A = 80'h1234567890ABCDEF0123;
    B = 80'h3210987654321111FEDC;
    Cin = 1;
    #10;
    $display("Test 4: A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    $display("==== Test finished ====");
    $stop;
  end

endmodule
