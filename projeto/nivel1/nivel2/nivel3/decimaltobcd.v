module decimaltobcd(input [9:0] key,
                    input enable,
                    output reg [3:0] y,
                    output reg loadn);
    
    initial begin //iniciar o 'dado valido = loadn' =  a '0'.
    loadn <=0;
    end
    // sempre que estiver pressionando a chave do keypad o loadn vai pra '1'
    always @ (key)
        begin
            
            if(!enable)begin
                loadn<=1;
            case(key)
                4'd0:y=4'b0000;
                4'd1:y=4'b0001;
                4'd2:y=4'b0010;
                4'd3:y=4'b0011;
                4'd4:y=4'b0100;
                4'd5:y=4'b0101;
                4'd6:y=4'b0110;
                4'd7:y=4'b0111;
                4'd8:y=4'b1000;
                4'd9:y=4'b1001;
    
                    default: begin
                        
                        loadn<=0;
                    end
                endcase
            end
        end
endmodule