module BCDto7SEGMENT_tb();

reg [3:0] bcd;
    wire [6:0] seg;
    integer i;

    // Instantiate the Unit Under Test (UUT)
    BCDto7SEGMENT uut (
        .E(bcd), 
        .S(seg)
    );

//Apply inputs
    initial begin
        for(i = 0;i < 16;i = i+1) //run loop for 0 to 15.
        begin
            bcd = i;
            $display("seg = %b ",seg); 
            #10; //wait for 10 ns
        end
    end

    initial begin
        $dumpfile("bcdto7SEGMENT_tb.vcd");
        $dumpvars(0,BCDto7SEGMENT_tb);

    end
    

endmodule