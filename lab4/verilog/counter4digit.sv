// Module Purpose:
//    Interface top level de uma placa FPGA DE2-115
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps
`default_nettype none

module counter4digit
	(
		////////////////////	Clock Input	 	/////////////////////////////////////// 
		input 	wire 			CLOCK_50,			//	50 MHz
		////////////////////	 Push Button   ///////////////////////////////////////
		input	 	wire [3:0]	KEY,					//	Pushbutton[3:0]
		////////////////////	7-SEG Display  ///////////////////////////////////////
		output 	wire [6:0]  HEX0, 				// Display de 7-segmentos (HEX0)
      output 	wire [6:0]  HEX1, 				// Display de 7-segmentos (HEX1)
      output 	wire [6:0]  HEX2, 				// Display de 7-segmentos (HEX2)
      output 	wire [6:0]  HEX3 				// Display de 7-segmentos (HEX3)
	);

   //--------------------------------------------------------------------------
	//	Parâmetros internos
   //--------------------------------------------------------------------------
   localparam NDIG = 4;

   //--------------------------------------------------------------------------
	//	Sinais internos
   //--------------------------------------------------------------------------
	logic [6:0]  segments [0:NDIG-1];
	logic reset;
	logic clock;

	//--------------------------------------------------------------------------
	//	Atribuições de entrada
   //--------------------------------------------------------------------------
	assign reset = KEY[0];
	assign clock = CLOCK_50;

	//--------------------------------------------------------------------------
	//	Instanciação de módulos
	//--------------------------------------------------------------------------	
   
   displayNdigit dnd (
       .clock(CLOCK_50),
       .segments(segments)
 
       );
   //--------------------------------------------------------------------------
	//	Atribuições de saída
   //--------------------------------------------------------------------------
	assign HEX0 = segments[0];
   assign HEX1 = segments[1];
   assign HEX2 = segments[2];
   assign HEX3 = segments[3];	

endmodule
