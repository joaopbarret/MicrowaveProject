module Controle_do_Magnetron (input startn, input stopn, input clearn, input door_closed, input timer_done, output Q);

wire set_int, reset_int;

assign set_int = (~startn) && door_closed && (~timer_done);
assign reset_int = (~door_closed) || (~clearn) || ~stopn || timer_done;

wire Q_int, Qn_int;
 
assign Q_int  = ~(reset_int || Qn_int);
assign Qn_int = ~(set_int || Q_int);
assign Q = Q_int;


endmodule