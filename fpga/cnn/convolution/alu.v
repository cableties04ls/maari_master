module alu (
    input wire clk,          
    input wire en,           
    input wire rst,          
    input wire [7:0] a,       
    input wire [7:0] b,       
    input wire [31:0] int_result, 
    output wire [31:0] out    
);

wire [31:0] c;

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

pmi_add #(
    .pmi_data_width(32),
    .pmi_sign("off")
) Add1 (
    .DataA(c),
    .DataB(int_result),
    .Cin(1'b0),
    .Result(out)
);

endmodule
