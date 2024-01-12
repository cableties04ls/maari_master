module dense_layer(
    input wire clk,
    input wire rst,
    output wire [31:0] accumulator2
);

reg [7:0] input_data_reg;
reg [7:0] weight_reg;
reg [7:0] bias_reg;
wire [31:0] mult_result;
wire [31:0] add_result;
wire [31:0] result;
wire [7:0] sigmoid_result;
reg [5:0] count;
reg [31:0] accumulator;
reg [31:0] accumulator2;
wire finished;

Mult2 mult1(
    .a(input_data_reg),
    .b(weight_reg),
    .mult(mult_result)
);

Add2 add1(
    .a(mult_result),
    .b(accumulator),
    .sum(add_result)
);

assign finished = count == 64;

Add2 add2(
    .a(add_result),
    .b(bias_reg),
    .sum(result)
);

sigmoid_alu sigmoid1(
    .x(result),
    .y(sigmoid_result)
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        input_data_reg <= 0;
        weight_reg <= 0;
        bias_reg <= 0;
        count <= 0;
    end else begin
        input_data_reg <= input_data_reg+1;
        weight_reg <= weight_reg+1;
        bias_reg <= bias_reg+1;
        accumulator2 <= sigmoid_result;
        count <= count+1;
    end
end


endmodule
