
module full_leds ( 
    input [3:0]sec_ones,
    input [3:0]sec_tens,
    input [3:0]mins,
    output [6:0]sec_ones_segs,
    output [6:0]sec_tens_segs,
    output [6:0]min_segs
);

BCDto7SEGMENT secs(.E(sec_ones[3:0]),.S(sec_ones_segs[6:0]));
BCDto7SEGMENT tens(.E(sec_tens[3:0]),.S(sec_tens_segs[6:0]));
BCDto7SEGMENT minutes(.E(mins[3:0]),.S(min_segs[6:0]));

endmodule

module BCDto7SEGMENT(input wire[3:0]E,
                output reg [6:0]S);



always @(*)
 begin
  case(E)
   4'b0000 : S=7'b0000001; 
   4'b0001 : S=7'b1001111;
   4'b0010 : S=7'b0010010;
   4'b0011 : S=7'b0000110;
   4'b0100 : S=7'b1001100;
   4'b0101 : S=7'b0100100;
   4'b0110 : S=7'b0100000;
   4'b0111 : S=7'b0001101;
   4'b1000 : S=7'b0000000;
   4'b1001 : S=7'b0000100; 
   default : S=7'b1111111;
  endcase
 end

endmodule