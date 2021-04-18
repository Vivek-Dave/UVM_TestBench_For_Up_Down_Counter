module up_down_counter(rst,
      clk,
      up_down,
      out
      );

    input clk;
    input rst;
    input up_down;
    output reg [7:0] out;

    always@(posedge clk)
        begin
            if(rst==1)
                begin 
                    out=0;
                end
            else 
                begin
                    if(up_down==1)
                        out=out+1;
                    else  
                        out=out-1;
                end

        end
endmodule
