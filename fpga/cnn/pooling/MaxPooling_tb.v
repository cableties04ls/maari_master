module MaxPooling_tb;

    // Parameters
    parameter WIDTH = 8;         // Data width
    parameter SIZE = 2;          // Pooling window size

    // Signals for the DUT (Design Under Test)
    reg clk;                      // Clock signal
    reg rst;                      // Reset signal
    reg en;
    wire [WIDTH-1:0] i_matrix[SIZE-1:0][SIZE-1:0];  // 4x4 input matrix
    wire [WIDTH-1:0] o_max_pool;           // Max-pooled output

    // Instantiate the MaxPooling module
    MaxPooling uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .i_matrix(i_matrix),
        .o_max_pool(o_max_pool)
    );


    always #10 clk <= ~clk;

    // Testbench stimulus
    initial begin
        // Initialize clock and reset
        clk = 0;
        rst = 1;
        #10;

        // Apply reset and wait
        rst = 0;
        #10;
        rst = 1;

        // Apply test vectors to input_data
        input_data[0][0] = 8'd25;
        input_data[0][1] = 8'd56;
        input_data[1][0] = 8'd12;
        input_data[1][1] = 8'd200;


        // Apply clock and monitor results

        // Display the max-pooled result
        $display("Max-Pooled Result: %h", o_max_pool);

        // Terminate the simulation
        $finish;
    end

endmodule