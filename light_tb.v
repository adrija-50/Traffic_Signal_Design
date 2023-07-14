`timescale 1s / 1ms

module model_test ;
reg clk;
wire [2:0] light;
// Instanstiation
model G0 (clk, light);
always #(0.5) clk=~clk;
initial
begin
#0.5 clk=0;
#50 $finish;
end
initial
begin
$dumpfile("model.vcd");
$dumpvars(0,model_test);
$monitor($time," LIGHT =%3b",light );
end
endmodule