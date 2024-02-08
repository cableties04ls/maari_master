//CNN dense layer top module
module top(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [7:0] data,
    input wire [7:0] weight,
    output wire [31:0] result
);

reg [7:0] a;
reg [7:0] b;
reg [31:0] c, alu_out_reg;
wire [31:0] alu_out;
assign result = c;

alu alu1(
    .clk(clk),
    .rst(rst),
    .en(en),
    .a(a),
    .b(b),
    .int_result(c),
    .out(alu_out)
);

reg [10:0] state;
parameter FINISH = 1152+1; //(4*9)*32
wire finished;
assign finished = (state == FINISH);

wire [10:0] next_state;
assign next_state = state + 1;


always @ (posedge clk or posedge rst) begin
    if (rst) begin
        state <= 0;
        a <= 0;
        b <= 0;
        c <= 0;
        alu_out_reg <= 0;
    end else begin
        if (!finished) begin
                a <= data;
                b <= weight;
            if (state == 0) begin
                c <= 0;                
            end else begin
                c <= alu_out;    
            end
            state <= next_state;
        end else begin
            state <= state;
        end
    end

end

endmodule