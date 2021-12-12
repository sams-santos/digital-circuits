// Module Purpose:
//		Contador módulo 4
// -----------------------------------------------------------------------------
// Entradas: 
// 	clock: clock do sistem
// 	reset: reset global 
// -----------------------------------------------------------------------------					
// Saidas:
// 	value: valor de saída do contador
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps
`default_nettype none

module countermod4 (
	input  wire clock,    // Clock
	input  wire reset,
	output logic [1:0] value = 2'b00
);

	always_ff @(posedge clock) begin
		value <= reset ? 2'b00 : (value + 1'b1);
	end


endmodule
