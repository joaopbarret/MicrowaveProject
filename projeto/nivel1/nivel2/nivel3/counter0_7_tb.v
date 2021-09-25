module counter7_tb;  
  reg clk;                     // Declare an internal TB variable called clk to drive clock to the design  
  reg clear;                    // Declare an internal TB variable called clear to drive active low reset to design  
  wire clk_out;              // Declare a wire to connect to design output  
  
  // Instantiate counter design and connect with Testbench variables  
  counter7   c0 (clk,clear,clk_out);  
  
  // Generate a clock that should be driven to design  
  // This clock will flip its value every 5ns -> time period = 10ns -> freq = 100 MHz  
   
 always 
    #5 clk = ~clk;  
  
  // This initial block forms the stimulus of the testbench  
    initial begin  
    // Initialize testbench variables to 0 at start of simulation  
        clk <= 0;  
        clear <= 1;  
  
    // Drive rest of the stimulus, reset is asserted in between  
        #10   clear <= 1;  
        #80   clear <= 1;  
        #50   clear <= 0;  
  
    // Finish the stimulus after 200ns  
        #20 $finish;  
    end
        initial
            $monitor("clk=%b,clear=%b,clk_out=%b",clk,clear,clk_out);
        initial begin
            $dumpfile("counter7_tb.vcd");
            $dumpvars(0,counter7_tb);
            end

endmodule  