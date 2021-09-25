
`timescale 1ms/1ms
module codificador_tb;
    reg [9:0] tecladoNum;
    reg enable;
    reg clock;
    wire [3:0]d;
    wire loadn;
    wire pgt_1hz;

codificador U0(tecladoNum,enable,clock,d,loadn,pgt_1hz);

always
    #5 clock = ~clock;
initial
    begin
    clock <= 0;
    
    enable <= 0;    
    #5 tecladoNum <= 4'd1;
    #2 tecladoNum <= 4'dx;
    #5 tecladoNum <= 4'd0;
    #2 tecladoNum <= 4'dx;
    #5 tecladoNum <= 4'd5;
    #2 tecladoNum <= 4'dx;
    #100 enable <= 1;
    #1000 $finish;
    end
initial
    begin
    $dumpfile("codificador_tb.vcd");
    $dumpvars(0,codificador_tb);
    end
endmodule