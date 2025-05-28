`timescale 1ns/1ns
`include "qualidade.sv"

module tb_qualidade;

  logic clk, n_rst, presenca, rgb, rgb_valido;
  logic [1:0] leds;

  qualidade UUT(
    .clk(clk),
    .n_rst(n_rst),
    .presenca(presenca),
    .rgb(rgb),
    .rgb_valido(rgb_valido),
    .leds(leds)
  );

  initial begin
    $dumpfile("waveform_qualidade.vcd");
  end
  
endmodule