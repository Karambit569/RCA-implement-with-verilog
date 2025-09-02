`timescale 1ns/1ps

module tb_rca40_80;

  reg [79:0] A, B;
  reg Cin;
  wire [79:0] S;
  wire Cout;

  rca_80b_40 dut (
    .S(S),
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout)
  );

  initial begin
    $display("==== RCA 80bit (40bit blocks) Testbench ====");

    A = 80'h0000000000000001;
    B = 80'h0000000000000001;
    Cin = 0;
    #10;
    $display("A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    A = 80'hFFFFFFFFFFFFFFFF;
    B = 80'h0000000000000001;
    Cin = 0;
    #10;
    $display("A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    A = 80'h0000000000000000;
    B = 80'h0000000000000000;
    Cin = 1;
    #10;
    $display("A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    A = 80'h1234567890ABCDEF0123;
    B = 80'h3210987654321111FEDC;
    Cin = 1;
    #10;
    $display("A = %h, B = %h, Cin = %b => S = %h, Cout = %b", A, B, Cin, S, Cout);

    $display("==== Test finished ====");
    $stop;
  end

endmodule
