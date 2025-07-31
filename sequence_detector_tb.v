`timescale 1ns/1ns
`include "mealy.v"
`include "moore.v"
module module_tb;
    reg x,clk,reset;
    wire z;
    seq_detector_0110_moore DUT(.x(x), .clk(clk), .reset(reset), .z(z));
    initial begin
        clk=0; reset=1; x=0;
    end

    initial begin
        #7 reset=0;
        #10 x=0;
        #10 x=1;
        #10 x=0;
        #10 x=1;
        #10 x=1;
        #10 reset=1;x=0;
        #1 reset=0;
        #9 x=1;
        #10 x=1;
        #10 x=0;
        #10 x=0;
        #30 $finish;
    end
    always #5 clk=~clk;
    initial begin
        $dumpfile("module.vcd");
        $dumpvars(0,module_tb);
        $monitor($time, " reset=%b, x=%b, z=%b",reset,x,z);
    end
endmodule