module Entrada_de_timer_e_controle(
    input wire [9:0] tecladoNum,
    input wire enable,
    input wire clock,
    output wire [3:0] d,
    output wire loadn,
    output wire pgt_1hz
);
    //criar 3 fios para ligar o 'dado valido' no counter0-7, e os outros dois sao do mux
    wire clr , mux_d0,mux_d1;

    decimaltobcd DTB(.key(tecladoNum),.enable(enable),.y(d),.loadn(clr));
    counter7 CNT7(.clk(clock),.clear(clr),.clk_out(mux_d0));
    clockdiv100 CD100(.clk(clock),.clk_out(mux_d1));
    mux2to1 mux(.selection(enable),.d0(mux_d0),.d1(mux_d1),.out(pgt_1hz));

    assign loadn = clr;

endmodule

