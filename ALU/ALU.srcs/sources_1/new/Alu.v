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
    output reg [15:0] d_out,
    output reg Z,
    output reg C,
    output reg N,
    output reg V
    );
    initial begin
        Z = 1'b0;
        V = 1'b0;
        N = 1'b0;
        C = 1'b0;
	end
always @ (A, B, fn_sel)
begin
    case(fn_sel)
        4'b0000: begin
            {C, d_out} = A+B;
        end
        4'b0001: begin 
            d_out = A-B;
            if(d_out[15]==1) 
                N = 1'b1;
        end 
        4'b0010: begin
            d_out = A * B; 
        end 
        4'b0011: begin
            d_out = A / B; 
        end 
    endcase
    if(d_out == 0)
        Z = 1'b1;
    else
        Z= 0;
	N = 1'b0;
	C = 1'b0;
	if((A[15]==1 & B[15]==1 & d_out[15]==1) | (A[15]==0 & B[15]==0 & d_out[15]==1))
		V = 1'b1;
    end 
endmodule
