module counter7 (input clk,      
                  input clear,              
                  output reg clk_out);    
 
  reg [3:0]out;  //criando uma variavel auxiliar para servir como contador
  initial begin
      clk_out <= 0;
      out <= 0;
  end

    always @ (posedge clk) begin //sempre na borda de subida entramos no always
        if(clear)begin  
            if (out == 3) begin// qaundo chegar em 4 a saida fica '1'
                clk_out <= 1;
                out <= out + 1; 
            end
        

            else if (out == 7) // se o contador chegar em 7 e o comando clear n for '0' ele continua no 7.
                out <=7;
            else    
                out <= out + 1;
        end
        else  begin
            if(out==7)begin // clear ativo em nivel BAIXO envia o 1 e atualiza pra zero o contador.   
                out <= out + 1;
                clk_out <=0;
            end
        end
    
  end
endmodule  