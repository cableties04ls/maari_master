`timescale 1ns/100ps

module top_tb;
    reg clk;
    reg rst;
    reg en;
    reg [7:0] input1;
    reg [7:0] input2;
    reg [7:0] input3;
    reg [7:0] input4;
    reg [7:0] input5;
    reg [7:0] input6;
    reg [7:0] input7;
    reg [7:0] input8;
    reg [7:0] input9;
    reg [7:0] filter1;
    reg [7:0] filter2;
    reg [7:0] filter3;
    reg [7:0] filter4;
    reg [7:0] filter5;
    reg [7:0] filter6;
    reg [7:0] filter7;
    reg [7:0] filter8;
    reg [7:0] filter9;
    reg [7:0] a;
    reg [7:0] b;
    wire [31:0] result;
    wire [31:0] int_result;

    top uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .input1(input1),
        .input2(input2),
        .input3(input3),
        .input4(input4),
        .input5(input5),
        .input6(input6),
        .input7(input7),
        .input8(input8),
        .input9(input9),
        .filter1(filter1),
        .filter2(filter2),
        .filter3(filter3),
        .filter4(filter4),
        .filter5(filter5),
        .filter6(filter6),
        .filter7(filter7),
        .filter8(filter8),
        .filter9(filter9),
        .result(result)
    );

    pmi_mult #(
    .pmi_dataa_width(8),
    .pmi_datab_width(8),
    .pmi_sign("on"),
    .pmi_additional_pipeline(0),
    .pmi_input_reg("off"),
    .pmi_output_reg("on"),
    .pmi_implementation("DSP")
) Mult2 (
    .Clock(clk),
    .ClkEn(en),
    .Aclr(rst),
    .DataA(a),
    .DataB(b),
    .Result(c)
);
//c + int_result = out
pmi_add #(
    .pmi_data_width(32),
    .pmi_sign("off")
) Add1 (
    .DataA(c),
    .DataB(int_result),
    .Cin(1'b0),
    .Result(out)
);

    always #10 clk <= ~clk;

    initial begin
        clk = 0;
        rst = 1;
        en = 1;
        a = 8'd0;
        b = 8'd0;
        input1 = 8'd0;
        input2 = 8'd0;
        input3 = 8'd0;
        input4 = 8'd0;
        input5 = 8'd0;
        input6 = 8'd0;
        input7 = 8'd0;
        input8 = 8'd0;
        input9 = 8'd0;
        filter1 = 8'd0;
        filter2 = 8'd0;
        filter3 = 8'd0;
        filter4 = 8'd0;
        filter5 = 8'd0;
        filter6 = 8'd0;
        filter7 = 8'd0;
        filter8 = 8'd0;
        filter9 = 8'd0;
        #40;
        rst = 0;
        #40;
        a = 8'd1;
        b = 8'd2;
        input1 = 8'd0;
        input2 = 8'd1;
        input3 = 8'd0;
        input4 = 8'd1;
        input5 = 8'd0;
        input6 = 8'd1;
        input7 = 8'd0;
        input8 = 8'd1;
        input9 = 8'd0;
        filter1 = 8'd0;
        filter2 = 8'd1;
        filter3 = 8'd0;
        filter4 = 8'd1;
        filter5 = 8'd0;
        filter6 = 8'd1;
        filter7 = 8'd0;
        filter8 = 8'd1;
        filter9 = 8'd0;
        
        #200;
        $stop;
    end

endmodule