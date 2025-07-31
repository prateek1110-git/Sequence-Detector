//iverilog -o .\file_name.vvp .\module_tb.v
//vvp file_name.vvp
//gtkwave.exe .\module.vcd
module seq_detector_0110_mealy(x,clk,z,reset);
    input x,clk,reset;
    output reg z;
    reg [1:0] ps,ns;
    parameter s0=0, s1=1, s2=2, s3=3;
    always @(posedge clk or posedge reset) 
        if(reset) ps<=s0;
        else ps<=ns;
    always @(ps,x)
    begin
        z=0;
        case (ps)
            s0: begin
                ns=x?s0:s1;
            end 
            s1: begin
                ns=x?s2:s1;
            end
            s2: begin
                ns=x?s3:s1;
            end
            s3: begin
                z=x?0:1;
                ns=x?s0:s1;
            end
            default: begin
                ns=s0;
                z=0;
            end
        endcase
    end
endmodule

