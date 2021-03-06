`timescale 1ns / 1ps

module counter_mod6_test ();

    // Inputs
    reg [3:0] data;
    reg loadn, clearn, clock, enable;

    // Outputs
    wire [3:0] digit;
    wire tc, zero;

    counter_mod6 uut (data, loadn, clearn, clock, enable, digit, tc, zero);

    initial begin

        $dumpfile("counter_mod6_waves.vcd");
        $dumpvars(0,counter_mod6_test);

        // TESTE BASE
        assign loadn = 1;
        assign enable = 0; 
        assign clearn = 1;
        assign data = 4'b0110;

        #5 assign loadn = 0; 

        #5 assign loadn = 1; 
        #5 assign enable = 1; 

        // TESTE PARA ENTRADAS MAIORES QUE 6 (deve dar erro)
        // assign loadn = 1; 
        // assign enable = 0; 
        // assign clearn = 1;
        // assign data = 4'b1000;

        // #5 assign loadn = 0; 

        // #5 assign loadn = 1; 
        // #5 assign enable = 1; 

        // CASO ENABLE E LOADN ESTEJAM ATIVOS AO MESMO TEMPO (deve dar erro)
        // assign loadn = 1;
        // assign enable = 1; 
        // assign clearn = 1;
        // assign data = 4'b0110;

        // #5 assign loadn = 0; 

        // #5 assign loadn = 1; 

        // TESTE DO CLEARN
        // assign loadn = 1; 
        // assign enable = 0; 
        // assign clearn = 1;
        // assign data = 4'b0110;

        // #5 assign loadn = 0;

        // #5 assign loadn = 1; 
        // #5 assign enable = 1; 

        // #50 assign clearn = 0;
        // #5 assign enable = 0;

        #400;
        $finish;
    end

    initial clock = 0;
    always #10 clock = ~clock;

endmodule