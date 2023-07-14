`timescale 1s / 1ms

module model (clk,light);
input clk ;
output reg [2:0] light;
parameter S0=0, S1=1, S2=2;
parameter RED=3'b100, GREEN=3'b010, YELLOW=3'b001;
reg [1:0] state;
// It is a Moore model but input component is
// absent. Refer Moore Block diagram.
always @(posedge clk) // Always block for NS logic and FF
case(state)
S0: state <= S1;
S1: state <= S2;
S2: state <= S0;
default: state <= S0;
endcase
always @ (state) // Always block for output logic
case(state)
S0: light = RED;
S1: light = GREEN;
S2: light = YELLOW;
default: light = RED;
endcase
endmodule