`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 18:32:43
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    //inputs
    reg [3:0] fn_sel;
	reg [15:0] data_a;
	reg [15:0] data_b;
	reg clk;
	reg rst;
	//outputs
	wire zero_flag;
	wire carry_flag;
	wire [15:0] data_out;
	 
	// Instantiate the Unit Under Test (UUT)
	Alu uut (
		.fn_sel(fn_sel), 
		.data_a(data_a), 
		.data_b(data_b),
		.clk(clk),
		.rst(rst),  
		.zero_flag(zero_flag), 
		.carry_flag(carry_flag), 
		.data_out(data_out)
	);
	initial begin
		// Initialize Inputs
		fn_sel = 0;
		data_a = 0;
		data_b = 0;
		clk = 0;
		rst = 0;
  
    forever begin
    #10 clk = ~clk;
 end end
     
     initial begin
	  // Add stimulus here
	  //a + b (arithmetic operations 0-3)
          #100; data_a = 16'b0010000000000001; data_b = 16'b0000000000000001; fn_sel = 4'b0000;
          #100; data_a = 16'b1111111111111111; data_b = 16'b0000000000000001; fn_sel = 4'b0000;
          #100; data_a = 16'b1111111111000001; data_b = 16'b0000000000000001; fn_sel = 4'b0000;
          #100; data_a = 16'b1111111111111111; data_b = 16'b1111111111111111; fn_sel = 4'b0000;

	  //a - b      
	  #100; data_a = 16'b0000000010000001; data_b = 16'b0000000000000001; fn_sel = 4'b0001;
	  #100; data_a = 16'b0000000000000010; data_b = 16'b0000000000000011; fn_sel = 4'b0001;
	  #100; data_a = 16'b0000000011111111; data_b = 16'b0000100000000001; fn_sel = 4'b0001;
	  #100; data_a = 16'b0000000000000001; data_b = 16'b0000000000000001; fn_sel = 4'b0001;

	  //a * b	  
	  #100; data_a = 16'b0000000000000001; data_b = 16'b0000000000000011; fn_sel = 4'b0010;
	  #100; data_a = 16'b0000000000000011; data_b = 16'b0000000000000000; fn_sel = 4'b0010;
	  #100; data_a = 16'b1000000000000001; data_b = 16'b0000000000000011; fn_sel = 4'b0010;
	  #100; data_a = 16'b1111111111000001; data_b = 16'b0000000000000011; fn_sel = 4'b0010;
	  
	  #100; rst = 1'b1;
	  #100; rst = 1'b0;
	  
	  //a / b
	  #100; data_a = 16'b0000000000000001; data_b = 16'b0000000000000000; fn_sel = 4'b0011;
	  #100; data_a = 16'b0000000000000011; data_b = 16'b0000000000000001; fn_sel = 4'b0011;
	  #100; data_a = 16'b0000000000001001; data_b = 16'b0000000000000100; fn_sel = 4'b0011;
	  #100; data_a = 16'b0000000000000011; data_b = 16'b0000000000000010; fn_sel = 4'b0011;

	  //a & b (bitwise logic operations 4-8)  
	  #100; data_a = 16'b0000000000000001; data_b = 16'b0000000100000000; fn_sel = 4'b0100;
	  #100; data_a = 16'b1000000000000001; data_b = 16'b1000000000000001; fn_sel = 4'b0100;
	  
	  //a | b
	  #100; data_a = 16'b0000000000000001; data_b = 16'b0000000000000001; fn_sel = 4'b0101;
	  #100; data_a = 16'b0000101000000001; data_b = 16'b0000000000000001; fn_sel = 4'b0101;
	  
	  //a ^ b
	  #100; data_a = 16'b0000000000000001; data_b = 16'b0000000000000001; fn_sel = 4'b0110;
	  #100; data_a = 16'b0000000000000001; data_b = 16'b0000000000000010; fn_sel = 4'b0110;
	  #100; data_a = 16'b0001111000000001; data_b = 16'b0000000000000010; fn_sel = 4'b0110;
	  #100; data_a = 16'b1111111111111111; data_b = 16'b1111111111111111; fn_sel = 4'b0110;

	  //~a 	  
	  #100; data_a = 16'b1110000000000001;  fn_sel = 4'b0111;

	  //~b
	  #100; data_b = 16'b1110000000000001;  fn_sel = 4'b1000;
	end
    
endmodule