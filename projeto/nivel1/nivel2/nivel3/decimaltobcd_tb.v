`timescale 1 ns/10 ps
module decimaltobcd_tb();
    reg [9:0] d;
    reg enable;
    wire [3:0] y;
    wire loadn;
    
    decimaltobcd  c0(d,enable,y,loadn);
    initial 
        begin
        enable = 0;
        
        #1 d = 4;
        #5 d = 1'bx;
        #1 d = 3;
        #5 d = 1'bx;
        #1 d = 6;
        #5 d = 1'bx;
        d = 1'bx;
        
        
        #100$finish;
 
        end 
    initial 
        begin
            $monitor("loadn=%b,y=%b",loadn,y);
        end
    initial
        begin
            $dumpfile("decimaltobcd_tb.vcd");
            $dumpvars(0,decimaltobcd_tb);
        end

endmodule
