
module controle_mag_on_tb();
reg startn ;
reg stopn;
reg clearn;
reg door_closed;
reg timer_done;
wire set;
wire reset;

controle_mag_on CMO(startn,stopn,clearn,door_closed,timer_done,set,reset);

initial
    begin
       startn = 0;door_closed = 0;timer_done = 0;stopn = 0;clearn = 0;
      #10 startn = 0;door_closed = 0;timer_done = 1;stopn = 1;clearn = 0;
      #10 startn = 0;door_closed = 1;timer_done = 0;stopn = 0;clearn = 1;
      #10 startn = 0;door_closed = 1;timer_done = 1;stopn = 1;clearn = 1;
      #10 startn = 1;door_closed = 0;timer_done = 0;stopn = 0;clearn = 0;
      #10 startn = 1;door_closed = 0;timer_done = 1;stopn = 0;clearn = 0;
      #10 startn = 1;door_closed = 1;timer_done = 0;stopn = 1;clearn = 0;
      #10 startn = 1;door_closed = 1;timer_done = 1;stopn = 1;clearn = 1;
        #10 startn = 1;door_closed = 1;timer_done = 1;stopn = 0;clearn = 0;

    end

initial begin
    $dumpfile("controle_mag_on_tb.vcd");
	$dumpvars(0,controle_mag_on_tb);
end

endmodule