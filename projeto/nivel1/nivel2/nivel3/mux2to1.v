module mux2to1 (
    input wire selection,
    input wire d0,
    input wire d1,
    output reg out
);

    always @(selection or d0 or d1)
        begin
            if(selection)
                out = d1;
            else
                out = d0;
        end
    
endmodule
