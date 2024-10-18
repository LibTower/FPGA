//`timescale 1ns / 100ps                           
module cnt_en_testbanch;                       

localparam cnt_width = 4;                      

reg clk;                                                   
reg [cnt_width:0] cnt_taktov;                

logic enable;                                         
logic [cnt_width-1:0] out_counter;       

initial begin                                          
    clk = 0;
    cnt_taktov = 0;
end

always
  #10 clk = ~ clk;                                 

always @(posedge clk) begin
    cnt_taktov <= cnt_taktov + 1;          
end

wire reset = (cnt_taktov == 3);          
wire start = (cnt_taktov == 5);          
wire active;                                       

wire pause = (cnt_taktov == 10) || (cnt_taktov == 15);    

//Триггер активного состояния
trigger_x  tr ( 
    .clk(clk),  .reset(reset),                
    .set(start),  .out(active));

assign enable =  active & ~ pause; 



counter_enbl  # ( .N(cnt_width)) cnt_inst 
    (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .counter(out_counter)
    );
 
endmodule
