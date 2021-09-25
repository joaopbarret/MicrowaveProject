`timescale 1ns / 1ps

module timer_test ();

    // Inputs
    reg [3:0] data;
    reg loadn, clearn, clock, enable;

    // Outputs
    wire [3:0] sec_ones;
    wire [3:0] sec_tens;
    wire [3:0] min;
    wire zero;

    timer uut (data, loadn, clearn, clock, enable, sec_ones, sec_tens, min, zero);

    initial begin
        $dumpfile("timer_waves.vcd");
        $dumpvars(0,timer_test);

        // TESTE BASE - 1:30
        loadn = 1;
        clearn = 1;
        enable = 0;
        data = 4'b0001;
        
        #5 loadn = 0;
        #5 loadn = 1;
        data = 4'b0011;

        #5 loadn = 0;
        #5 loadn = 1;
        data = 4'b0000;

        #5 loadn = 0;
        #5 loadn = 1;

        #5 enable = 1;

        // TESTE DO CLEAR
        // loadn = 1;
        // clearn = 1;
        // enable = 0;
        // data = 4'b0001;
        
        // #5 loadn = 0;
        // #5 loadn = 1;
        // data = 4'b0011;

        // #5 loadn = 0;
        // #5 loadn = 1;
        // data = 4'b0000;

        // #5 loadn = 0;
        // #5 loadn = 1;

        // #5 enable = 1;

        // #100 clearn = 0;
        // enable = 0;

        //  fim dos testes

        #600;
        $finish;
    end

    initial clock = 0;
    always #10 clock = !clock;

endmodule