module seq_detector_0110_moore (
    input clk,
    input reset,
    input x,
    output reg z
);
    reg [2:0] ps, ns;
    parameter S0 = 3'b000,  // Start
              S1 = 3'b001,  // Got 0
              S2 = 3'b010,  // Got 01
              S3 = 3'b011,  // Got 011
              S4 = 3'b100;  // Got 0110 (final)

    always @(posedge clk or posedge reset) begin
        if (reset)    ps <= S0;
        else    ps <= ns;
    end

    always @(*) begin
        case (ps)
            S0: ns = (x == 0) ? S1 : S0;
            S1: ns = (x == 1) ? S2 : S1;
            S2: ns = (x == 1) ? S3 : S1;
            S3: ns = (x == 0) ? S4 : S0;
            S4: ns = (x == 0) ? S1 : S2;  
            default: ns = S0;
        endcase
    end

    always @(*) begin
        case (ps)
            S4: z = 1;  
            default: z = 0;
        endcase
    end

endmodule
