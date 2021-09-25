module mux2to1_tb();

reg selection;
reg d0;
reg d1;
wire out;

mux2to1 mux(selection,d0,d1,out);

always #10 selection=~selection;

initial
    begin
        selection <= 0;
        d0<=1'b0;
        d1<=1'b0;
        #5d0=1'b0;
        #5d1=1'b0;
        #5d0=1'b1;
        #5d1=1'b0;
        #5d0=1'b1;
        #5d1=1'b1;
        #5d0=1'b0;
        #5d1=1'b1;
        #5d0=1'b0;
        #5d1=1'b0;
        #100 $finish;
    end
        
       
        

initial
    begin
        $dumpfile("mux2to1_tb.vcd");
        $dumpvars(0,mux2to1_tb);
    end
endmodule