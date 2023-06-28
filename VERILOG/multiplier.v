`timescale 1ns/10ps
module f_add(a, b, cin, cout, sum);
  input a,b,cin;
  output sum,cout;
  wire x, y, z;
  
  h_add h1(.a(a),.b(b),.s(x),.c(y));
  h_add h2(.a(x),.b(cin),.s(sum),.c(z));
  or o1(cout,y,z);
endmodule
    
module h_add(a, b, c, s); 
  input a,b;
  output s,c;
 
  xor x1(s,a,b);
  and a1(c,a,b);
endmodule

module multiplier(p, a, b);
    input [3:0] a, b;
    output [7:0] p;
    wire a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16;
    wire  sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8, sum9, sum10, sum11, sum12;
    wire  c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12;

    and and1(a1, a[3], b[3]);
    and and2(a2, a[3], b[2]);
    and and3(a3, a[2], b[3]);
    and and4(a4, a[1], b[3]);
    and and5(a5, a[3], b[1]);
    and and6(a6, a[2], b[2]);
    and and7(a7, a[2], b[1]);
    and and8(a8, a[3], b[0]);
    and and9(a9, a[0], b[3]);
    and and10(a10, a[1], b[2]);
    and and11(a11, a[1], b[1]);
    and and12(a12, a[2], b[0]);
    and and13(a13, a[0], b[2]);
    and and14(a14, a[1], b[0]);
    and and15(a15, a[0], b[1]);
    and and16(a16, a[0], b[0]);

    h_add h1(a7, a8, c1, sum1);
    h_add h2(a11, a12, c2, sum2);
    h_add h3(a14, a15, c3, sum3);
    f_add f4(c1, a5, a6, c4, sum4);
    f_add f5(a2, a3, c4, c5, sum5);
    f_add f6(a10, c2, sum1, c6, sum6);
    f_add f7(a13, sum2, c3, c7, sum7);
    f_add f8(a9, c7, sum6, c8, sum8);
    f_add f9(a4, sum4, c6, c9, sum9);
    h_add h10(c8, sum9, c10, sum10);
    f_add f11(c10, c9, sum5, c11, sum11);
    f_add f12(c11, c5, a1, c12, sum12);

    assign p[0] = a16;
    assign p[1] = sum3;
    assign p[2] = sum7;
    assign p[3] = sum8;
    assign p[4] = sum10;
    assign p[5] = sum11;
    assign p[6] = sum12;
    assign p[7] = c12;

endmodule