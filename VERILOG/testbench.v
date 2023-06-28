`timescale 1ns / 1ps
 
module testbench();
    reg [3:0] a, b;
    output [7:0] p;
    
    multiplier mul(p, a, b);

    initial begin
        $dumpfile("mul.vcd");
        $dumpvars(0,mul);

        $monitor($time, "a = %d, b = %d, p = %d", a, b, p);
        a = 4'd0; b = 4'd0;

        #10 a = 4'd0; b = 4'd0;
        #10 a = 4'd0; b = 4'd0;
        #10 a = 4'd0; b = 4'd0;
        #10 a = 4'd0; b = 4'd0;
        #10 a = 4'd0; b = 4'd0;
        #10 a = 4'd0; b = 4'd0;
        #10 a = 4'd0; b = 4'd0;


        $finish;
    end

    // always @(w)
    // $display("time =%0t \t a =%b$b%b%b, b =%b%b%b%b, P =%b%b%b%b%b%b%b%b",$time,a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0]);

endmodule