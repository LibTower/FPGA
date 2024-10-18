
module counter_enbl # (parameter N=5)  
(
input clk,                                           
input reset,
input enable,
	output reg [N-1:0] counter               
	);
always @(posedge clk) begin         
if (reset) begin                         
    counter <= 0;                    
end 
else if (enable) begin            
counter <= counter + 1;   
        end
end
endmodule	
