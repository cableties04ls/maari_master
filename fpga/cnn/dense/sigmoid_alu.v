module sigmoid_alu(
    input wire [7:0] x,
    output wire [7:0] y
);

reg [7:0] y;

always @(x) begin
     if (x <= 0) begin
            y = 0; // xが0以下の場合、出力は0
        end else begin
            y = 1; // xが0より大きい場合、出力は1
        end
    end

endmodule
