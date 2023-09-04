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
           input [15:0] data_a,
           input [15:0] data_b,
           input [3:0] fn_sel,
	   input clk,
	   input rst,
           output reg [15:0] data_out,
           output reg zero_flag,
           output reg carry_flag
          );

    initial begin
    zero_flag = 1'b0;
    carry_flag = 1'b0;
    end

    always @ (posedge clk)
    begin

    if(rst)
    begin
    data_out = 16'h0000;
    carry_flag = 1'b0;
    zero_flag = 1'b0;
    end

    else
    begin
        case(fn_sel)

	    //Arithmetic Operations 0-3
            4'b0000: begin
                {carry_flag, data_out} = data_a + data_b;
            end

            4'b0001: begin 
                data_out = data_a - data_b;
            end 

            4'b0010: begin
                data_out = data_a * data_b; 
            end 

            4'b0011: begin
                data_out = data_a / data_b; 
            end
	
	    //Bitwise logical operations 4-8
            4'b0100: begin
                data_out = data_a & data_b; 
            end 

            4'b0101: begin
                data_out = data_a | data_b; 
            end 

            4'b0110: begin
                data_out = data_a ^ data_b; 
            end 

            4'b0111: begin
                data_out = ~data_a; 
            end 

	    4'b1000: begin
	        data_out = ~data_b;
	    end

	    default: data_out = 0;
    endcase

    if(data_out == 0)
       zero_flag = 1'b1;
    else
       begin
       zero_flag = 1'b0;
       end

    end
    end
endmodule