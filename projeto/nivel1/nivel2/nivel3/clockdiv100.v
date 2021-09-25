`timescale 1ms/1ms
module clockdiv100 (clk, clk_out);
 
input clk;

output clk_out;
 
reg [24:0] r_reg;
wire [24:0] r_nxt;
reg clk_track;


initial begin
        r_reg <= 0;
	clk_track <= 1'b0;
end

always @(posedge clk)
 
begin
   if (r_nxt == 50)
 	   begin
	     r_reg <= 0;
	     clk_track <= ~clk_track;
	   end
 
  else 
      r_reg <= r_nxt;
end
 
 assign r_nxt = r_reg+1;   	      
 assign clk_out = clk_track;
endmodule