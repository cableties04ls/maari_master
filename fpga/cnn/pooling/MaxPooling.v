// This maxpooling module gets a 2x2 matrix, each entry being an 8-bit value.
// the module outputs a single 8-bit value, which is the maximum of the 2x2 input matrix

module MaxPooling #(
    parameter WIDTH = 8, // Data width
    parameter SIZE = 4  // Pooling window size
    )
    (
    input wire clk,              // Clock input
    input wire rst,              // Reset input
    input wire en,               // Enable input
    input wire [WIDTH-1:0] i_matrix[SIZE-1:0][SIZE-1:0], // 2x2 input matrix (8-bit elements)
    output reg [WIDTH-1:0] o_max_pool // 8-bit output of a single maxpool operation
);

    // Local signals
    reg [WIDTH-1:0] w_max_val;
    wire [WIDTH-1:0] r_max_val;
    reg [1:0] i, j;

    // Function to find the maximum value in the input matrix
    function [WIDTH-1:0] find_max;
        input [WIDTH-1:0] input_matrix[SIZE-1:0][SIZE-1:0];
        wire [WIDTH-1:0] max_value;
        integer i,j;

        begin
            max_value = 8'd0; // Initialize max value
            for (i = 0; i < SIZE; i = i + 1) begin
                for (j = 0; j < SIZE; j = j + 1) begin
                    if (input_matrix[i][j] > max_value) begin
                        max_value = input_matrix[i][j];
                    end
                end
            end
        end

        find_max = max_value;
    endfunction

    assign w_max_value = find_max(i_matrix);

    // Sequential logic for max-pooling
    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            r_max_val <= '0; // Reset the max value
        end else if(en) begin
            r_max_val <= w_max_value;
        end
    end

    // Assign the max-pooled output
    assign o_max_pool = r_max_value;

endmodule