`timescale 1ms/1ms
module clock_tb;
  reg clk;
  wire clk_out;
 
     clockdiv100 t1(clk,clk_out);
        initial
          clk= 1'b0;
     always
        #5  clk=~clk; 
        initial
            begin
               
               #10000 $finish;
            end
 
        initial
               $monitor("clk=%b,clk_out=%b",clk,clk_out);
 
        initial
            begin
              $dumpfile("clock_tb.vcd");
              $dumpvars(0,clock_tb);
             end
    endmodule
 