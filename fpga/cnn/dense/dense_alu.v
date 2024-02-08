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
assign c = a * b;
assign out = c  + int_result;

endmodule