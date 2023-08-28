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
	reg [15:0] A;
	reg [15:0] B;
	
	//outputs
	wire N;
	wire Z;
	wire C;
	wire V;
	wire [15:0] d_out;
	
	// Instantiate the Unit Under Test (UUT)
	Alu uut (
		.fn_sel(fn_sel), 
		.A(A), 
		.B(B),  
		.N(N), 
		.Z(Z), 
		.C(C), 
		.V(V), 
		.d_out(d_out)
	);
	initial begin
		// Initialize Inputs
		fn_sel = 0;
		A = 0;
		B = 0;
		
     
		// Add stimulus here
      #100; A = 16'b0000000000000001; B = 16'b0000000000000001; fn_sel = 4'b0000;
	  #100; A = 16'b0000000000000001; B = 16'b0000000000000001; fn_sel = 4'b0001;
	  #100; A = 16'b0000000000000001; B = 16'b0000000000000011; fn_sel = 4'b0010;
	  #100; A = 16'b0000000000000001; B = 16'b0000000000000001; fn_sel = 4'b0011;
	  #100; A = 16'b0000000000000001; B = 16'b0000000100000000; fn_sel = 4'b0100;
	  #100; A = 16'b0000000000000001; B = 16'b0000000000000001; fn_sel = 4'b0101;
	  #100; A = 16'b0000000000000001; B = 16'b0000000000000001; fn_sel = 4'b0110;
	  #100; A = 16'b1110000000000001;  fn_sel = 4'b0111;
	end
    
endmodule
