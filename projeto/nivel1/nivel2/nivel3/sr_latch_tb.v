module sr_latch_tb();
reg S;
reg R;
wire Q;
wire Qn;

sr_latch sr(S,R,Q,Qn);

initial begin
    // Initialize Inputs
    S = 1;
    R = 1;
     
    // Add stimulus here
    #10 S = 0;
    #10 S = 1;
    #10 R = 0;
    #10 R = 1;
    #10 S = 0;
         R = 0;
    #10 S = 1;
         R = 1;
    #10 S = 0;
         R = 0;
    #10 ;
end

initial
        begin
            $dumpfile("sr_latch_tb.vcd");
            $dumpvars(0,sr_latch_tb);
        end
endmodule