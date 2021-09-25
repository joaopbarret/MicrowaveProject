module sr_latch(
    input S,
    input R,
    output Q,
    output Qn
    );
 
wire Q_int, Qn_int;
 
assign Q_int = ~(R | Qn_int);
assign Qn_int = ~(S | Q_int);
assign Q = Q_int;
assign Qn = Qn_int;
 
endmodule