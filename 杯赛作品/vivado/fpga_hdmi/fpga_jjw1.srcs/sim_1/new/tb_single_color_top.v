`timescale 1ns / 1ps
module tb_single_color_top();

parameter   col_num_max=10'd964;
parameter   row_num_max=10'd540;

reg [7:0]       ram_1k_data[8*964*540-1:0];//存储1k图片

reg             sys_clk             ;
reg             sys_rst_n           ;
reg [9:0]       col_num             ;
reg [9:0]       row_num             ;
reg [5*8-1:0]   single_color_datain ;
reg             receive_flag        ;

wire            send_flag           ;
wire[16*8-1:0]  single_color_dataout;

integer fid;
initial begin
    $readmemb("C:/Users/master/Desktop/image_process/vivado/ram_1k_data.v",ram_1k_data);
    fid=$fopen("C:/Users/master/Desktop/image_process/vivado/ram_4k_data.v");
    sys_clk=1'b0;
    sys_rst_n<=1'b0;
    #20
    sys_rst_n<=1'b1;                    
end

always#10   sys_clk=~sys_clk;


//在send_flag拉高一个时钟周期后开始计数，标志着向4k图像ram存储的数据个数
reg [4:0]   dataout_cnt;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        dataout_cnt<='b0;
    else if(send_flag==1'b1)
        dataout_cnt<='b0;
    else if(dataout_cnt==5'd16)
        dataout_cnt<=5'd16;
    else
       dataout_cnt<=dataout_cnt+1'b1; 
end
//向4k图像ram存储数据时一直拉高，其余时间均为低
reg     send_lasting_flag;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        send_lasting_flag<='b0;
    else if(send_flag==1'b1)
        send_lasting_flag<=1'b1;
    else if(dataout_cnt==5'd15)
        send_lasting_flag<=1'b0;
    else
        send_lasting_flag<=send_lasting_flag;
end
//存储数据地址，存完一张图片后又回到最初的地址
reg [23:0]   send_addr;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        send_addr<='b0;
    else if(col_num==col_num_max-1&&row_num==row_num_max-1&&send_finish_flag==1'b1)
        send_addr<='b0;
    else if(col_num<3'd4&&send_lasting_flag==1'b1)
        send_addr<=send_addr;
    else if(send_lasting_flag==1'b1)
        send_addr<=send_addr+1'b1;
    else
        send_addr<=send_addr;
end
//将要发送的数据寄存起来
reg [16*8-1:0]  d_single_color_dataout;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        d_single_color_dataout<='b0;
    else if(send_flag==1'b1)
        d_single_color_dataout<=single_color_dataout;
    else
        d_single_color_dataout<=d_single_color_dataout;
end
//将发送的并行数据写成数组
wire    [7:0]   array_color_dataout[15:0];
assign  array_color_dataout[15]=d_single_color_dataout[16*8-1:15*8];
assign  array_color_dataout[14]=d_single_color_dataout[15*8-1:14*8];
assign  array_color_dataout[13]=d_single_color_dataout[14*8-1:13*8];
assign  array_color_dataout[12]=d_single_color_dataout[13*8-1:12*8];
assign  array_color_dataout[11]=d_single_color_dataout[12*8-1:11*8];
assign  array_color_dataout[10]=d_single_color_dataout[11*8-1:10*8];
assign  array_color_dataout[ 9]=d_single_color_dataout[10*8-1: 9*8];
assign  array_color_dataout[ 8]=d_single_color_dataout[ 9*8-1: 8*8];
assign  array_color_dataout[ 7]=d_single_color_dataout[ 8*8-1: 7*8];
assign  array_color_dataout[ 6]=d_single_color_dataout[ 7*8-1: 6*8];
assign  array_color_dataout[ 5]=d_single_color_dataout[ 6*8-1: 5*8];
assign  array_color_dataout[ 4]=d_single_color_dataout[ 5*8-1: 4*8];
assign  array_color_dataout[ 3]=d_single_color_dataout[ 4*8-1: 3*8];
assign  array_color_dataout[ 2]=d_single_color_dataout[ 3*8-1: 2*8];
assign  array_color_dataout[ 1]=d_single_color_dataout[ 2*8-1: 1*8];
assign  array_color_dataout[ 0]=d_single_color_dataout[ 1*8-1: 0*8];
//将模块输出的并行数据转为串行数据，由于时序逻辑落后地址一拍
reg [7:0]   dataout;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        dataout<='b0;
    else if(send_lasting_flag==1'b1)
        dataout<=array_color_dataout[5'd15-dataout_cnt];
    else
        dataout<='b0;
end
//与dataout对齐
reg [23:0]   d_send_addr;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        d_send_addr<='b0;
    else
        d_send_addr<=send_addr;
end
//与dataout对齐
reg     d_send_lasting_flag;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        d_send_lasting_flag<='b0;
    else
        d_send_lasting_flag<=send_lasting_flag;
end
//输出完成标志位
reg     send_finish_flag    ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        send_finish_flag<='b0;
    else if(send_lasting_flag==1'b1&&dataout_cnt==5'd15)
        send_finish_flag<='b1;
    else
        send_finish_flag<='b0;
end


//求出当前对应的列数
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        col_num<='b0;
    else if(col_num==(col_num_max-1'b1)&&send_finish_flag==1'b1)
        col_num<='b0;
    else if(send_finish_flag==1'b1)
        col_num<=col_num+1'b1;
    else
        col_num<=col_num;
end

//求出当前对应的行数
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        row_num<='b0;
    else if(row_num==(row_num_max-1'b1)&&col_num==(col_num_max-1'b1)&&send_finish_flag==1'b1)
        row_num<='b0;
    else if(col_num==(col_num_max-1'b1)&&send_finish_flag==1'b1)
        row_num<=row_num+1'b1;
    else
        row_num<=row_num;
end 


//整张图片存储标志位
reg save_picture_finish_flag;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        save_picture_finish_flag<='b0;
    else if(col_num==(col_num_max-1)&&row_num==(row_num_max-1)&&send_finish_flag==1'b1)
        save_picture_finish_flag<='b1;
    else
        save_picture_finish_flag<='b0;
end

//将生成的数据写入ram_4k_data
integer j;
always@(posedge sys_clk) begin
    if(save_picture_finish_flag==1'b1) begin
        $fclose(fid);
        $finish;
    end
    else if(col_num>=3'd4&&d_send_lasting_flag==1'b1) begin
        for(j=0;j<8;j=j+1) begin
            $fwrite(fid,"%b",dataout[7-j]);
        end
        $fwrite(fid,"\n");
    end
        
end







//在send_finish_flag拉高一个时钟周期后开始计数，标志着从1k图像ram读到的数据个数
reg [3:0]   datain_cnt;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        datain_cnt<='b0;
    else if(send_finish_flag==1'b1)
        datain_cnt<='b0;
    else if(datain_cnt==4'd8)
        datain_cnt<=4'd8;
    else
       datain_cnt<=datain_cnt+1'b1; 
end

//在从图像ram读取数据时一直拉高，其余时间均为低
wire    receive_lasting_flag;
assign  receive_lasting_flag=sys_rst_n&(datain_cnt>=4'd0&&datain_cnt<=4'd7)?1'b1:1'b0;

//接收数据地址，读完一张图片后又回到最初的地址
reg [23:0]   receive_addr;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        receive_addr<='b0;
    else if(col_num==col_num_max-1&&row_num==row_num_max-1&&send_finish_flag==1'b1)
        receive_addr<='b0;
    else if(receive_lasting_flag==1'b1)
        receive_addr<=receive_addr+1'b1;
    else
        receive_addr<=receive_addr;
end

//根据地址receive_addr从1k图像ram里面读出数据，时序逻辑慢后receive_lasting_flag一个时钟
reg [7:0]   datain;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        datain<='b0;
    else if(receive_lasting_flag==1'b1)
        datain<=ram_1k_data[receive_addr];
    else
        datain<='b0;
end

//接收持续信号打拍以便与datain对齐
reg d_receive_lasting_flag;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        d_receive_lasting_flag<='b0;
    else
        d_receive_lasting_flag<=receive_lasting_flag;
end

//将接收到的数据并串转换
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        single_color_datain<='b0;
    else if(d_receive_lasting_flag==1'b1&&datain_cnt<=4'd5)
        single_color_datain<={single_color_datain[4*8-1:0],datain};
    else
        single_color_datain<='b0;
end

//5个数据刚好串并转换完成时，将receive_flag拉高
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        receive_flag<='b0;
    else if(d_receive_lasting_flag==1'b1&&datain_cnt==4'd5)
        receive_flag<=1'b1;
    else
        receive_flag<='b0;
end

            

single_color_top  single_color_top_inst
(
    .sys_clk             (sys_clk              )    ,
    .sys_rst_n           (sys_rst_n            )    ,
    .col_num             (col_num              )    ,
    .row_num             (row_num              )    ,
    .single_color_datain (single_color_datain  )    ,//二维图像一列的元素最上边像素位于该变量的高地址
    .receive_flag        (receive_flag         )    ,     
                          
    .send_flag           (send_flag            )    ,
    .single_color_dataout(single_color_dataout )      
); 



endmodule
