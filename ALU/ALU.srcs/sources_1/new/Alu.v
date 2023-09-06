`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 15:12:46
// Design Name: 
// Module Name: Alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Alu(
    input [15:0] A,
    input [15:0] B,
    input [3:0] fn_sel,
    input clk,
    input rst,
    output reg [15:0] d_out,
    output reg Zero_flag,
    output reg Carry_flag
    );
    initial begin
        Zero_flag = 1'b0;
        Carry_flag = 1'b0;
	end
always @ (posedge clk)
begin
if(rst)
begin
d_out = 16'b0000000000000000;
Zero_flag = 1'b0;
Carry_flag = 1'b0;
end
else
begin
d_out = 16'b0000000000000000;
Zero_flag = 1'b0;
Carry_flag = 1'b0;
    case(fn_sel)
        4'b0000: begin
            {Carry_flag, d_out} = A+B;
        end
        4'b0001: begin 
            d_out = A-B;
        end 
        4'b0010: begin
            d_out = A * B; 
        end 
        4'b0011: begin
            d_out = A / B; 
        end
        4'b0100: begin
            d_out = A & B; 
        end 
        4'b0101: begin
            d_out = A | B; 
        end 
        4'b0110: begin
            d_out = A ^ B; 
        end 
        4'b0111: begin
            d_out = ~A; 
        end 
        default:
        d_out = 0;
        
    endcase
    if(d_out == 0)
        Zero_flag = 1'b1;
    else
        Zero_flag= 0;
	
    end 
    end
endmodule
