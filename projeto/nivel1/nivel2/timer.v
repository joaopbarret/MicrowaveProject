module timer (
    input wire [3:0] data,
    input wire loadn,
    input wire clearn, 
    input wire clock, 
    input wire enable,
    output wire [3:0] sec_ones,
    output wire [3:0] sec_tens,
    output wire [3:0] min,
    output reg zero);

    wire [3:0] out_sec_ones;
    wire [3:0] out_sec_tens;
    wire en_sec_tens, en_min;
    wire tc_min;
    wire zero_sec_ones, zero_sec_tens, zero_min;

    reg [3:0] data_temp;

    always @ * begin
        if (!clearn) data_temp = 4'b0000;
        else data_temp = data;
        zero = zero_sec_ones & zero_sec_tens & zero_min;
    end

    counter_mod10 u1 (data_temp, loadn, clearn, clock, enable, out_sec_ones, en_sec_tens, zero_sec_ones); // unidade dos segundos
    counter_mod6 u2 (out_sec_ones, loadn, clearn, clock, en_sec_tens, out_sec_tens, en_min, zero_sec_tens); // dezena dos segundos
    counter_mod10 u3 (out_sec_tens, loadn, clearn, clock, en_min, min, tc_min, zero_min); // minutos

    assign sec_ones = out_sec_ones;
    assign sec_tens = out_sec_tens;

endmodule
