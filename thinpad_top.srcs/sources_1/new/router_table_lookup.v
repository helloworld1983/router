module router_table_lookup #
(
    parameter DATA_WIDTH = 8,
    parameter ROUTER_TABLE_N = 10,  
    parameter FRAME_LENGTH = 4096
)
(

    input wire                      clk,
    // data from the RX data path
    input wire [DATA_WIDTH-1:0]     rx_axis_tdata,
    input wire                      rx_axis_tvalid,
    input wire                      rx_axis_tlast,  
    output wire                     rx_axis_tready,
    // data to the TX data path
    output wire [DATA_WIDTH-1:0]    tx_axis_tdata,
    output wire                     tx_axis_tvalid,
    output wire                     tx_axis_tlast,
    input wire                      tx_axis_tready
);

reg rx_axis_tready_reg = 0;
reg[DATA_WIDTH-1:0] tx_axis_tdata_reg;
reg tx_axis_tvalid_reg = 0;
reg tx_axis_last_reg = 0;

assign rx_axis_tready = rx_axis_tready_reg;
assign tx_axis_tvalid = tx_axis_tvalid_reg;
assign tx_axis_tlast = tx_axis_last_reg;
assign tx_axis_tdata = tx_axis_tdata_reg;

integer trie_n = 0;
integer trie[0:ROUTER_TABLE_N * 32-1][0:1];
reg trie_is_valid[0:ROUTER_TABLE_N * 32-1];
reg[15:0] ports[0:ROUTER_TABLE_N*32-1];

reg [DATA_WIDTH-1:0] data[0:FRAME_LENGTH/DATA_WIDTH-1];
integer data_head = 0,data_tail = 0;
localparam[2:0] 
    STATE_IDLE = 3'd0,
    STATE_INPUT = 3'd1,
    STATE_BUSY = 3'd2,
    STATE_OUTPUT = 3'd3,
    STATE_INPUT_BUSY=3'd4,
    STATE_INPUT_OUTPUT=3'd5;
reg [2:0] state = STATE_IDLE;

integer current = 1;
reg bit;
reg [15:0] port;
reg [31:0] dest_ip;

always @(state) begin
    if(state==STATE_BUSY||state==STATE_OUTPUT)begin
        rx_axis_tready_reg = 1'b0;
    end else begin
        rx_axis_tready_reg = 1'b1;
    end
end
integer debug,debug2,debug3;

always @(posedge clk)begin
    case(state)
        STATE_IDLE:begin
            tx_axis_last_reg = 1'b0;
            tx_axis_tvalid_reg = 1'b0;
            current = 1;
            if(rx_axis_tvalid)begin
                state = STATE_INPUT;
                data_head = 0;
                data_tail = 0;
                data[data_tail] = rx_axis_tdata;
                data_tail = data_tail + 1;
            end
        end
        STATE_INPUT:begin
            if(rx_axis_tvalid)begin
                data[data_tail] = rx_axis_tdata;
                data_tail= data_tail + 1;
                if(rx_axis_tlast)begin
                    state = STATE_BUSY;
                end
                else if (data_tail>37) begin
                    state=STATE_INPUT_BUSY;
                end
            end 
        end 
        STATE_BUSY:begin
            dest_ip = {data[34],data[35],data[36],data[37]};
            port = ports[1];
            current = 1;
            for(integer i=31;i>=0;i=i-1)begin
                bit = dest_ip[i];
                if(trie[current][bit]!=0)begin
                    current = trie[current][bit];
                    debug = current;
                    if(trie_is_valid[current])begin
                      port = ports[current];
                      
                    end
                        
                end else
                    current = 0;
            end    
            //  暂时放置在前两位
            data[0] = port[15:8];
            data[1] = port[7:0];
            state = STATE_OUTPUT;
        end
        STATE_INPUT_BUSY:begin
            if(rx_axis_tvalid)begin
                data[data_tail] = rx_axis_tdata;
                data_tail= data_tail + 1;
                if(rx_axis_tlast)begin
                    state = STATE_OUTPUT;
                end else begin
                    state = STATE_INPUT_OUTPUT;
                end
            end 
            dest_ip = {data[34],data[35],data[36],data[37]};
            port = ports[1];
            current = 1;
            for(integer i=31;i>=0;i=i-1)begin
                bit = dest_ip[i];
                if(trie[current][bit]!=0)begin
                    current = trie[current][bit];
                    debug = current;
                    if(trie_is_valid[current])begin
                      port = ports[current];
                      
                    end
                        
                end else
                    current = 0;
            end    
            //  暂时放置在前两位
            data[0] = port[15:8];
            data[1] = port[7:0];
        end
        STATE_OUTPUT:begin
            if(tx_axis_tready)begin
                tx_axis_tvalid_reg = 1;
                tx_axis_tdata_reg = data[data_head];
                data_head =data_head+ 1;
                if(data_head==data_tail)begin
                    tx_axis_last_reg = 1'b1;
                    state = STATE_IDLE;
                end
            end
        end
        STATE_INPUT_OUTPUT:begin
            if(rx_axis_tvalid)begin
                data[data_tail] = rx_axis_tdata;
                data_tail= data_tail + 1;
                if(rx_axis_tlast)begin
                    state = STATE_OUTPUT;
                end else begin
                    state = STATE_INPUT_OUTPUT;
                end
            end 
            if((data_head+1<data_tail) && tx_axis_tready)begin
                tx_axis_tvalid_reg = 1;
                tx_axis_tdata_reg = data[data_head];
                data_head =data_head+ 1;
                if(data_head==data_tail)begin
                    tx_axis_last_reg = 1'b1;
                    state = STATE_IDLE;
                end
            end
        end
    endcase
end


















/*




reg [111:0] router_table[0:ROUTER_TABLE_N-1];
reg [DATA_WIDTH-1:0] data[0:FRAME_LENGTH/DATA_WIDTH-1];
integer data_head = 0,data_tail = 0,router_table_total;
reg [15:0] port;
reg [31:0] ip;
reg [31:0] nexthop;
reg [31:0] mask;
reg [31:0] dest_ip;
localparam[1:0] 
    STATE_IDLE = 2'd0,
    STATE_INPUT = 2'd1,
    STATE_BUSY = 2'd2,
    STATE_OUTPUT = 2'd3;
reg [1:0] state = STATE_IDLE;
reg [31:0] debug;
reg [31:0] debug2;
reg hasFind = 1'b0;
always @(state) begin
    if(state==STATE_BUSY||state==STATE_OUTPUT)begin
        rx_axis_tready_reg = 1'b0;
    end else begin
        rx_axis_tready_reg = 1'b1;
    end
end

always @(posedge clk)begin
    case(state)
        STATE_IDLE:begin
            tx_axis_last_reg = 1'b0;
            tx_axis_tvalid_reg = 1'b0;
            hasFind = 1'b0;
            if(rx_axis_tvalid)begin
                state = STATE_INPUT;
                data_head = 0;
                data_tail = 0;
                data[data_tail] = rx_axis_tdata;
                data_tail = data_tail + 1;
            end
        end
        STATE_INPUT:begin
            if(rx_axis_tvalid)begin
                data[data_tail] = rx_axis_tdata;
                data_tail= data_tail + 1;
            end 
            if(rx_axis_tlast)begin
                state = STATE_BUSY;
            end
        end 
        STATE_BUSY:begin
            
            for(integer i=0;i<router_table_total;i = i+1)begin
                
                dest_ip = {data[34],data[35],data[36],data[37]};
                debug = dest_ip&router_table[i][79:48];
                debug2 = router_table[i][111:80];
                if((dest_ip&router_table[i][79:48])==router_table[i][111:80]&&!hasFind)begin
                    {ip,mask,nexthop,port} = router_table[i];
                    hasFind = 1'b1;
                    //  暂时放置在前两位
                    data[0] = port[15:8];
                    data[1] = port[7:0];
                end
            end
            state = STATE_OUTPUT;
        end
        STATE_OUTPUT:begin
            if(tx_axis_tready)begin
                tx_axis_tvalid_reg = 1;
                tx_axis_tdata_reg = data[data_head];
                data_head =data_head+ 1;
                if(data_head==data_tail)begin
                    tx_axis_last_reg = 1'b1;
                    state = STATE_IDLE;
                end
            end
        end
    endcase
end
*/
endmodule