//3*3 convolution

module top(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [7:0] input1,
    input wire [7:0] input2,
    input wire [7:0] input3,
    input wire [7:0] input4,
    input wire [7:0] input5,
    input wire [7:0] input6,
    input wire [7:0] input7,
    input wire [7:0] input8,
    input wire [7:0] input9,
    input wire [7:0] filter1,
    input wire [7:0] filter2,
    input wire [7:0] filter3,
    input wire [7:0] filter4,
    input wire [7:0] filter5,
    input wire [7:0] filter6,
    input wire [7:0] filter7,
    input wire [7:0] filter8,
    input wire [7:0] filter9,
    output wire [31:0] result
);
reg [7:0] input_reg;
reg [7:0] filter_reg;
reg [31:0] int_result;
reg [31:0] result_reg;
wire [31:0] result1;
reg [3:0] counter;
reg [3:0] current_state;

alu alu1(
    .clk(clk),
    .rst(rst),
    .en(en),
    .a(input_reg),
    .b(filter_reg),
    .int_result(int_result),
    .out(result1)
);
assign result = result_reg;
parameter 
    IDLE = 0,
    Stage1 = 1,
    Stage2 = 2,
    Stage3 = 3,
    Stage4 = 4,
    Stage5 = 5,
    Stage6 = 6,
    Stage7 = 7,
    Stage8 = 8,
    Stage9 = 9;

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        current_state <= IDLE;
    end
    else begin
        case (current_state)
            IDLE: begin
                if (en)
                    current_state <= Stage1;
                else
                    current_state <= IDLE;
            end
            Stage1: begin
                input_reg <= input1;
                filter_reg <= filter1;
                int_result <= 0;

                result_reg <= result1;
                current_state <= Stage2;
            end
            Stage2: begin
                input_reg <= input2;
                filter_reg <= filter2;
                int_result <= result1;
                result_reg <= result1;
                current_state <= Stage3;
            end
            Stage3: begin
                input_reg <= input3;
                filter_reg <= filter3;
                int_result <= result1;
                result_reg <= result1;
                current_state <= Stage4;
            end
            Stage4: begin
                input_reg <= input4;
                filter_reg <= filter4;
                int_result <= result1;
                result_reg <= result1;
                current_state <= Stage5;
            end
            Stage5: begin
                input_reg <= input5;
                filter_reg <= filter5;
                int_result <= result1;
                result_reg <= result1;
                current_state <= Stage6;
            end
            Stage6: begin
                input_reg <= input6;
                filter_reg <= filter6;
                int_result <= result1;
                result_reg <= result1;
                current_state <= Stage7;
            end
            Stage7: begin
                input_reg <= input7;
                filter_reg <= filter7;
                int_result <= result1;
                result_reg <= result1;
                current_state <= Stage8;
            end
            Stage8: begin
                input_reg <= input8;
                filter_reg <= filter8;
                int_result <= result1;
                result_reg <= result1;
                current_state <= Stage9;
            end
            Stage9: begin
                input_reg <= input9;
                filter_reg <= filter9;
                int_result <= result1;
                result_reg <= result1;
                current_state <= IDLE;
            end
        endcase
    end
end

endmodule