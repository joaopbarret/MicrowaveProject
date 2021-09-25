module ControledoMagnetron_tb();
reg startn;
reg stopn;
reg clearn;
reg door_closed;
reg timer_done;
wire Q;

Controle_do_Magnetron CM(startn,stopn,clearn,door_closed,timer_done,Q);

initial begin
     
       startn = 0;door_closed = 1;timer_done = 0;stopn = 1;clearn = 1;
      #10 startn = 1;door_closed = 1;timer_done = 0;stopn = 0;clearn = 1;
      #10 startn = 0;door_closed = 1;timer_done = 0;stopn = 1;clearn = 1;
      #10 door_closed = 0;
      
      #100 $finish;
end
initial begin
    $dumpfile("ControledoMagnetron_tb.vcd");
	$dumpvars(0,ControledoMagnetron_tb);
end
endmodule