module counter_mod6 (
    input wire [3:0] data,
    input wire loadn, // síncrono
    input wire clearn, // assíncrono
    input wire clock,
    input wire en,
    output reg [3:0] digit,
    output reg tc, 
    output reg zero);

    initial begin 
        tc = 0;
        zero = 0;
    end

    always @ * begin
        if (!clearn) digit = 4'b0000;
    end

    always @ (loadn) begin
        if (!loadn) digit <= data;
    end

    always @ (posedge clock) begin
        if (en)
            case (digit)
                4'b0110:  begin
                    digit <= 4'b0101; // 6 -> 5
                    tc <= 0;
                    zero <= 0;
                end
                4'b0101: digit <= 4'b0100; // 5 -> 4
                4'b0100: digit <= 4'b0011; // 4 -> 3
                4'b0011: digit <= 4'b0010; // 3 -> 2
                4'b0010: digit <= 4'b0001; // 2 -> 1
                4'b0001: digit <= 4'b0000; // 1 -> 0
                4'b0000: begin
                    digit <= 4'b0110; // 0 -> 6
                    tc <= 1;
                    zero <= 1;
                end
                default: digit <= 4'b0000;
            endcase
                    
    end

endmodule