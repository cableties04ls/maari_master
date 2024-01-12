module async_counter(
    input wire clk,
    input wire In1,     
    input wire reset,   
    output wire [9:0] q 
);

reg [9:0] count = 10'b0000000000;       

always @(posedge In1 or posedge reset) begin
    if (reset) begin
        count[0] <= 1'b0;
    end else begin
        count[0] <= ~count[0];
    end
end

always @(negedge count[0] or posedge reset) begin
    if (reset) begin
        count[1] <= 1'b0;
    end else begin
        count[1] <= ~count[1];
    end
end

always @(negedge count[1] or posedge reset) begin
    if (reset) begin
        count[2] <= 1'b0;
    end else begin
        count[2] <= ~count[2];
    end
end

always @(negedge count[2] or posedge reset) begin
    if (reset) begin
        count[3] <= 1'b0;
    end else begin
        count[3] <= ~count[3];
    end
end

always @(negedge count[3] or posedge reset) begin
    if (reset) begin
        count[4] <= 1'b0;
    end else begin
        count[4] <= ~count[4];
    end
end

always @(negedge count[4] or posedge reset) begin
    if (reset) begin
        count[5] <= 1'b0;
    end else begin
        count[5] <= ~count[5];
    end
end

always @(negedge count[5] or posedge reset) begin
    if (reset) begin
        count[6] <= 1'b0;
    end else begin
        count[6] <= ~count[6];
    end
end

always @(negedge count[6] or posedge reset) begin
    if (reset) begin
        count[7] <= 1'b0;
    end else begin
        count[7] <= ~count[7];
    end
end

always @(negedge count[7] or posedge reset) begin
    if (reset) begin
        count[8] <= 1'b0;
    end else begin
        count[8] <= ~count[8];
    end
end

always @(negedge count[8] or posedge reset) begin
    if (reset) begin
        count[9] <= 1'b0;
    end else begin
        count[9] <= ~count[9];
    end
end

assign q = count;
    

endmodule
