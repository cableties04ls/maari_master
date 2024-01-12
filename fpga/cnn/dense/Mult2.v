module Mult2 (
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [15:0] mult
);
    assign mult = a * b;
endmodule
