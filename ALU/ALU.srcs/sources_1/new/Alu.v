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
    input [127:0] A,
    input [127:0] B,
    input [5:0] fn_sel,
    input clk,
    input rst,
    output reg [127:0] d_out,
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
d_out = 128'b0;
Zero_flag = 1'b0;
Carry_flag = 1'b0;
end
else
begin
d_out = 128'b0;
Zero_flag = 1'b0;
Carry_flag = 1'b0;
    case(fn_sel)
        6'b000000: begin
            {Carry_flag, d_out} = A+B;
        end
        6'b000001: begin 
            d_out = A - B;
        end 
        6'b000010: begin
            d_out = A * B; 
        end 
        6'b000011: begin
            d_out = A / B; 
        end
        6'b000100: begin
            d_out = A & B; 
        end 
        6'b000101: begin
            d_out = A | B; 
        end 
        6'b000110: begin
            d_out = A ^ B; 
        end 
        6'b000111: begin
            d_out = ~A; 
        end 
        6'b001000: begin
            d_out = ~B; 
        end 
        6'b001001: begin
            d_out = A<<B; 
        end 
        6'b001010: begin
            d_out = A>>B; 
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
