`timescale 1ns / 100ps
module dense_top_tb();

    reg clk;
    reg rst;
    reg en;
    reg [7:0] data;
    reg [7:0] weight;
    wire [31:0] result;

    top top1(
        .clk(clk),
        .rst(rst),
        .en(en),
        .data(data),
        .weight(weight),
        .result(result)
    );

    initial begin
        clk = 0;
        rst = 0;
        en = 0;
        data = 0;
        weight = 0;
        #50 rst = 1;
        #10 rst = 0; data = 1; weight = 1;
        #50000 $stop;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule