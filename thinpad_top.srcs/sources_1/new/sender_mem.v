/*
 * cpu将准备发送的帧放到这里
 * 
 */

module sender_mem(
    input wire rst,
    //由于两个的时钟周期不同，因此我们不太能使用clk ?
    
    input wire[31:0] cpu_data_i,
    output reg[31:0] cpu_data_o,
    input wire[6:0] cpu_addr,
    input wire[3:0] cpu_be_n,
    input wire cpu_ce_n,
    input wire cpu_we_n,
    
    input wire[7:0] router_data_i,
    output reg[7:0] router_data_o,
    input wire[8:0] router_addr,
    input wire router_ce_n,
    input wire router_we_n //低为写，高为读
);
reg [7:0] data[0:511];

//当data[511]不为0时表示已经准备好了发送帧，数字表示帧的长度，单位(bytes)此时cpu不能进行写操作
//当data[511] == 8'b00000000时表示还没有准备好发送帧，此时路由器不能进行写操作

always @(*) begin
    if(rst) begin
        cpu_data_o <= 0;
        router_data_o <= 0;
        data[511] <= 8'b00000000;
    end else begin
        case({cpu_ce_n,router_ce_n})
            2'b11: begin
                // nothing to do
            end
            2'b10: begin
                if(router_we_n == 1'b0) begin
                    if(data[511] != 8'b00000000)
                        data[router_addr] <= router_data_i;
                end else begin
                    router_data_o <= data[router_addr];
                end
            end
            2'b01: begin
                if(cpu_we_n == 1'b0) begin
                    if(data[511] == 8'b00000000) begin
                        if(cpu_be_n[0] == 1'b0)
                            data[{cpu_addr,2'b00}] <= cpu_data_o[7:0];
                        if(cpu_be_n[1] == 1'b0)
                            data[{cpu_addr,2'b01}] <= cpu_data_o[15:8];
                        if(cpu_be_n[2] == 1'b0)
                            data[{cpu_addr,2'b10}] <= cpu_data_o[23:16];
                        if(cpu_be_n[3] == 1'b0)
                            data[{cpu_addr,2'b11}] <= cpu_data_o[31:24];
                    end
                end else begin
                    if(cpu_be_n[0] == 1'b0)
                        cpu_data_o[7:0] <= data[{cpu_addr,2'b00}];
                    if(cpu_be_n[1] == 1'b0)
                        cpu_data_o[15:8] <= data[{cpu_addr,2'b01}];
                    if(cpu_be_n[2] == 1'b0)
                        cpu_data_o[23:16] <= data[{cpu_addr,2'b10}];
                    if(cpu_be_n[3] == 1'b0)
                        cpu_data_o[31:24] <= data[{cpu_addr,2'b11}];
                end
            end
            2'b00:begin
                case({cpu_we_n,router_we_n})
                    2'b11:begin
                        if(cpu_be_n[0] == 1'b0)
                            cpu_data_o[7:0] <= data[{cpu_addr,2'b00}];
                        if(cpu_be_n[1] == 1'b0)
                            cpu_data_o[15:8] <= data[{cpu_addr,2'b01}];
                        if(cpu_be_n[2] == 1'b0)
                            cpu_data_o[23:16] <= data[{cpu_addr,2'b10}];
                        if(cpu_be_n[3] == 1'b0)
                            cpu_data_o[31:24] <= data[{cpu_addr,2'b11}];
                        router_data_o <= data[router_addr];
                    end
                    2'b10:begin //路由器写，cpu读
                        if(data[511] != 8'b00000000) begin
                            data[router_addr] <= router_data_i;
                            if(cpu_be_n[0] == 1'b0 && {cpu_addr,2'b00} == router_addr)
                                cpu_data_o[7:0] <= router_data_i;
                            else if(cpu_be_n[0] == 1'b0)    
                                cpu_data_o[7:0] <= data[{cpu_addr,2'b00}];
                            if(cpu_be_n[1] == 1'b0 && {cpu_addr,2'b01} == router_addr)
                                cpu_data_o[15:8] <= router_data_i;
                            else if(cpu_be_n[1] == 1'b0)
                                cpu_data_o[15:8] <= data[{cpu_addr,2'b01}];
                            if(cpu_be_n[2] == 1'b0 && {cpu_addr,2'b10} == router_addr)
                                cpu_data_o[23:16] <= router_data_i;
                            else if(cpu_be_n[2] == 1'b0)
                                cpu_data_o[23:16] <= data[{cpu_addr,2'b10}];
                            if(cpu_be_n[3] == 1'b0 && {cpu_addr,2'b11} == router_addr)
                                cpu_data_o[31:24] <= router_data_i;
                            else if(cpu_be_n[3] == 1'b0)
                                cpu_data_o[31:24] <= data[{cpu_addr,2'b11}];
                        end else begin
                            if(cpu_be_n[0] == 1'b0)
                                cpu_data_o[7:0] <= data[{cpu_addr,2'b00}];
                            if(cpu_be_n[1] == 1'b0)
                                cpu_data_o[15:8] <= data[{cpu_addr,2'b01}];
                            if(cpu_be_n[2] == 1'b0)
                                cpu_data_o[23:16] <= data[{cpu_addr,2'b10}];
                            if(cpu_be_n[3] == 1'b0)
                                cpu_data_o[31:24] <= data[{cpu_addr,2'b11}];
                        end
                    end
                    2'b01:begin
                        if(data[511] == 8'b00000000) begin
                            if(cpu_be_n[0] == 1'b0)
                                data[{cpu_addr,2'b00}] <= cpu_data_o[7:0];
                            if(cpu_be_n[1] == 1'b0)
                                data[{cpu_addr,2'b01}] <= cpu_data_o[15:8];
                            if(cpu_be_n[2] == 1'b0)
                                data[{cpu_addr,2'b10}] <= cpu_data_o[23:16];
                            if(cpu_be_n[3] == 1'b0)
                                data[{cpu_addr,2'b11}] <= cpu_data_o[31:24];
                            if(router_addr == {cpu_addr,2'b00} && cpu_be_n[0] == 1'b0)
                                router_data_o <= cpu_data_o[7:0];
                            else if(router_addr == {cpu_addr,2'b01} && cpu_be_n[1] == 1'b0)
                                router_data_o <= cpu_data_o[15:8];
                            else if(router_addr == {cpu_addr,2'b10} && cpu_be_n[2] == 1'b0)
                                router_data_o <= cpu_data_o[23:16];
                            else if(router_addr == {cpu_addr,2'b11} && cpu_be_n[3] == 1'b0)
                                router_data_o <= cpu_data_o[31:24];
                        end else begin
                            router_data_o <= data[router_addr];
                        end
                    end
                    2'b00:begin
                        if(data[511] != 8'b00000000) begin
                            data[router_addr] <= router_data_i;
                        end else begin
                            if(cpu_be_n[0] == 1'b0)
                                data[{cpu_addr,2'b00}] <= cpu_data_o[7:0];
                            if(cpu_be_n[1] == 1'b0)
                                data[{cpu_addr,2'b01}] <= cpu_data_o[15:8];
                            if(cpu_be_n[2] == 1'b0)
                                data[{cpu_addr,2'b10}] <= cpu_data_o[23:16];
                            if(cpu_be_n[3] == 1'b0)
                                data[{cpu_addr,2'b11}] <= cpu_data_o[31:24];
                        end
                    end
                endcase

            end
        endcase    
    end
end

endmodule