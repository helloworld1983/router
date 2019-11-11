
module memory(
    input wire rst,
    input wire[31:0] wdata_i,
    input wire wreg_i,
    input wire[4:0] wd_i,
    
    output reg[31:0] wdata_o,
    output reg wreg_o,
    output reg[4:0] wd_o
);

always @(*)begin
    if(rst)begin
        wd_o <= 0;
        wreg_o <= 0;
        wdata_o <= 0;
    end else begin
        wdata_o <= wdata_i;
        wreg_o <= wreg_i;
        wd_o <= wd_i;
    end   

end

endmodule