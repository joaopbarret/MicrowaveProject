module controlador(keypad,clock,startn,stopn,clearn,door_closed,sec_ones,sec_tens,min_segs,mag_on);
 input wire [9:0] keypad;
 input wire clock;
 input wire startn;
 input wire stopn;
 input wire clearn;
 input wire door_closed;
 output wire [6:0]sec_ones_segs;
 output wire [6:0]sec_tens_segs;
 output wire [6:0]min_segs_segs;
 output wire mag_on;

 wire en,pgt_1hz,zero,loadn;
 wire [3:0] saida_cod, sec_ones, sec_tens, mins;

 timer T0(.data(saida_cod),.loadn(loadn),.clearn(clearn),.clock(pgt_1hz),.enable(mag_on),.sec_ones(sec_ones),.sec_tens(sec_tens),.min(mins),.zero(zero));
 ControledoMagnetron CDM(.startn(startn),.stopn(stopn),.clearn(clearn),.door_closed(door_closed),.timer_done(zero),.Q(mag_on));
 Entrada_de_Timer_e_minutos ETM(.tecladoNum(keypad),.enable(mag_on),.clock(clock),.d(saida_cod),.loadn(loadn),.pgt_1hz(pgt_1hz));
 
 BCDto7SEGMENT B7S(.sec_ones(sec_ones),.sec_tens(sec_tens),.mins(mins),.sec_ones_segs(sec_ones_segs),.sec_tens_segs(sec_tens_segs),.min_segs(min_segs));