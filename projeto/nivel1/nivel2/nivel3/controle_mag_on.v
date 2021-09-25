module controle_mag_on (input startn, input stopn, input clearn, input door_closed, input timer_done, output set, output reset);

wire set_int, reset_int;

assign set_int = (~startn) & door_closed & (~timer_done);
assign reset_int = (~door_closed) | (~clearn) | ~stopn | timer_done;

assign set = set_int;
assign reset = reset_int;

endmodule