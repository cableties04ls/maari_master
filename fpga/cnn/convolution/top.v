module top(
    input wire clk,
    input wire rst,
    output wire [31:0] accumulator
);

reg [7:0] input_data_reg;
reg [7:0] filter_reg;
wire [31:0] d;
reg [9:0] count;
reg[31:0] accumulator;
wire finished;

assign finished = count == 8*9*9; //出力8*9サイズを9回計算する

alu alu1(
    .clk(clk),
    .en(1),
    .rst(rst),
    .a(input_data_ref),
    .b(filter_reg),
    .int_result(accumulator),
    .out(d)
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        input_data_reg <= 0;
        filter_reg <= 0;
        count <= 0;
    end else begin
        input_data_reg <= input_data_reg+1;
        filter_reg <= filter_reg+1;
        accumulator <= d;
        count <= count+1;
    end
end

endmodule
