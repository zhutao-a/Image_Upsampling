module single_color_top
(
    input   wire                sys_clk                 ,
    input   wire                sys_rst_n               ,
    input   wire    [9:0]       col_num                 ,
    input   wire    [9:0]       row_num                 ,
    input   wire    [5*8-1:0]   single_color_datain     ,//二维图像一列的元素最上边像素位于该变量的高地址
    input   wire                receive_flag            ,     

    output  reg                 send_flag               ,
    output  wire    [16*8-1:0]  single_color_dataout      
);

//将输入的5个像素数据改为数组形式
wire    [7:0]   pixel[4:0];
assign  pixel[4]=single_color_datain[5*8-1:4*8];
assign  pixel[3]=single_color_datain[4*8-1:3*8];
assign  pixel[2]=single_color_datain[3*8-1:2*8];
assign  pixel[1]=single_color_datain[2*8-1:1*8];
assign  pixel[0]=single_color_datain[1*8-1:0*8];

//存储所需要的5行3列1k像素数据
reg     [7:0]   column1_1k[4:0];
reg     [7:0]   column2_1k[4:0];
reg     [7:0]   column3_1k[4:0];
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column1_1k[4]<='b0;
        column1_1k[3]<='b0;
        column1_1k[2]<='b0;
        column1_1k[1]<='b0;
        column1_1k[0]<='b0;
    end
    else if(receive_flag==1'b1) begin
        column1_1k[4]<=column2_1k[4];
        column1_1k[3]<=column2_1k[3];
        column1_1k[2]<=column2_1k[2];
        column1_1k[1]<=column2_1k[1];
        column1_1k[0]<=column2_1k[0];
    end
    else begin
        column1_1k[4]<=column1_1k[4];
        column1_1k[3]<=column1_1k[3];
        column1_1k[2]<=column1_1k[2];
        column1_1k[1]<=column1_1k[1];
        column1_1k[0]<=column1_1k[0];
    end
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column2_1k[4]<='b0;
        column2_1k[3]<='b0;
        column2_1k[2]<='b0;
        column2_1k[1]<='b0;
        column2_1k[0]<='b0;
    end
    else if(receive_flag==1'b1) begin
        column2_1k[4]<=column3_1k[4];
        column2_1k[3]<=column3_1k[3];
        column2_1k[2]<=column3_1k[2];
        column2_1k[1]<=column3_1k[1];
        column2_1k[0]<=column3_1k[0];
    end
    else begin
        column2_1k[4]<=column2_1k[4];
        column2_1k[3]<=column2_1k[3];
        column2_1k[2]<=column2_1k[2];
        column2_1k[1]<=column2_1k[1];
        column2_1k[0]<=column2_1k[0];
    end
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column3_1k[4]<='b0;
        column3_1k[3]<='b0;
        column3_1k[2]<='b0;
        column3_1k[1]<='b0;
        column3_1k[0]<='b0;
    end
    else if(receive_flag==1'b1) begin
        column3_1k[4]<=pixel[4];
        column3_1k[3]<=pixel[3];
        column3_1k[2]<=pixel[2];
        column3_1k[1]<=pixel[1];
        column3_1k[0]<=pixel[0];
    end
    else begin
        column3_1k[4]<=column3_1k[4];
        column3_1k[3]<=column3_1k[3];
        column3_1k[2]<=column3_1k[2];
        column3_1k[1]<=column3_1k[1];
        column3_1k[0]<=column3_1k[0];
    end
end

//5行3列存储完成，可以开始边缘插值标志
reg     interpolate_start_flag1     ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        interpolate_start_flag1<=1'b0;
    else
        interpolate_start_flag1<=receive_flag;
end
reg     interpolate_start_flag2     ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        interpolate_start_flag2<=1'b0;
    else
        interpolate_start_flag2<=interpolate_start_flag1;
end
reg     interpolate_start_flag3     ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        interpolate_start_flag3<=1'b0;
    else
        interpolate_start_flag3<=interpolate_start_flag2;
end

//取出需要进行边缘插值的1k图片的9个点
reg     [7:0]   dot_9_1k_1_1   ;
reg     [7:0]   dot_9_1k_1_2   ;
reg     [7:0]   dot_9_1k_1_3   ;
reg     [7:0]   dot_9_1k_2_1   ;
reg     [7:0]   dot_9_1k_2_2   ;
reg     [7:0]   dot_9_1k_2_3   ;
reg     [7:0]   dot_9_1k_3_1   ;
reg     [7:0]   dot_9_1k_3_2   ;
reg     [7:0]   dot_9_1k_3_3   ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        dot_9_1k_1_1<='b0   ;
        dot_9_1k_1_2<='b0   ;
        dot_9_1k_1_3<='b0   ;
        dot_9_1k_2_1<='b0   ;
        dot_9_1k_2_2<='b0   ;
        dot_9_1k_2_3<='b0   ;
        dot_9_1k_3_1<='b0   ;
        dot_9_1k_3_2<='b0   ;
        dot_9_1k_3_3<='b0   ;
    end
    else if(interpolate_start_flag1==1'b1) begin
        dot_9_1k_1_1<=column1_1k[4]   ;
        dot_9_1k_1_2<=column2_1k[4]   ;
        dot_9_1k_1_3<=column3_1k[4]   ;
        dot_9_1k_2_1<=column1_1k[3]   ;
        dot_9_1k_2_2<=column2_1k[3]   ;
        dot_9_1k_2_3<=column3_1k[3]   ;
        dot_9_1k_3_1<=column1_1k[2]   ;
        dot_9_1k_3_2<=column2_1k[2]   ;
        dot_9_1k_3_3<=column3_1k[2]   ;
    end
    else if(interpolate_start_flag2==1'b1) begin
        dot_9_1k_1_1<=column1_1k[3]   ;
        dot_9_1k_1_2<=column2_1k[3]   ;
        dot_9_1k_1_3<=column3_1k[3]   ;
        dot_9_1k_2_1<=column1_1k[2]   ;
        dot_9_1k_2_2<=column2_1k[2]   ;
        dot_9_1k_2_3<=column3_1k[2]   ;
        dot_9_1k_3_1<=column1_1k[1]   ;
        dot_9_1k_3_2<=column2_1k[1]   ;
        dot_9_1k_3_3<=column3_1k[1]   ;
    end
    else if(interpolate_start_flag3==1'b1) begin
        dot_9_1k_1_1<=column1_1k[2]   ;
        dot_9_1k_1_2<=column2_1k[2]   ;
        dot_9_1k_1_3<=column3_1k[2]   ;
        dot_9_1k_2_1<=column1_1k[1]   ;
        dot_9_1k_2_2<=column2_1k[1]   ;
        dot_9_1k_2_3<=column3_1k[1]   ;
        dot_9_1k_3_1<=column1_1k[0]   ;
        dot_9_1k_3_2<=column2_1k[0]   ;
        dot_9_1k_3_3<=column3_1k[0]   ;
    end
    else begin
        dot_9_1k_1_1<='b0   ;
        dot_9_1k_1_2<='b0   ;
        dot_9_1k_1_3<='b0   ;
        dot_9_1k_2_1<='b0   ;
        dot_9_1k_2_2<='b0   ;
        dot_9_1k_2_3<='b0   ;
        dot_9_1k_3_1<='b0   ;
        dot_9_1k_3_2<='b0   ;
        dot_9_1k_3_3<='b0   ;
    end
end

//边缘插值+均值调整后的4k图片的像素值
wire    [7:0]   final_dot_16_4k_1_1   ;
wire    [7:0]   final_dot_16_4k_1_2   ;
wire    [7:0]   final_dot_16_4k_1_3   ;
wire    [7:0]   final_dot_16_4k_1_4   ;
wire    [7:0]   final_dot_16_4k_2_1   ;
wire    [7:0]   final_dot_16_4k_2_2   ;
wire    [7:0]   final_dot_16_4k_2_3   ;
wire    [7:0]   final_dot_16_4k_2_4   ;
wire    [7:0]   final_dot_16_4k_3_1   ;
wire    [7:0]   final_dot_16_4k_3_2   ;
wire    [7:0]   final_dot_16_4k_3_3   ;
wire    [7:0]   final_dot_16_4k_3_4   ;
wire    [7:0]   final_dot_16_4k_4_1   ;
wire    [7:0]   final_dot_16_4k_4_2   ;
wire    [7:0]   final_dot_16_4k_4_3   ;
wire    [7:0]   final_dot_16_4k_4_4   ;
interpolate_16point interpolate_16point_inst
(
    .sys_clk            (sys_clk     )   ,
    .dot_9_1k_1_1       (dot_9_1k_1_1)   ,//输入1k图片9个点的像素值
    .dot_9_1k_1_2       (dot_9_1k_1_2)   ,
    .dot_9_1k_1_3       (dot_9_1k_1_3)   ,
    .dot_9_1k_2_1       (dot_9_1k_2_1)   ,
    .dot_9_1k_2_2       (dot_9_1k_2_2)   ,
    .dot_9_1k_2_3       (dot_9_1k_2_3)   ,
    .dot_9_1k_3_1       (dot_9_1k_3_1)   ,
    .dot_9_1k_3_2       (dot_9_1k_3_2)   ,
    .dot_9_1k_3_3       (dot_9_1k_3_3)   ,
  
    .final_dot_16_4k_1_1(final_dot_16_4k_1_1)  ,
    .final_dot_16_4k_1_2(final_dot_16_4k_1_2)  ,
    .final_dot_16_4k_1_3(final_dot_16_4k_1_3)  ,
    .final_dot_16_4k_1_4(final_dot_16_4k_1_4)  ,
    .final_dot_16_4k_2_1(final_dot_16_4k_2_1)  ,
    .final_dot_16_4k_2_2(final_dot_16_4k_2_2)  ,
    .final_dot_16_4k_2_3(final_dot_16_4k_2_3)  ,
    .final_dot_16_4k_2_4(final_dot_16_4k_2_4)  ,
    .final_dot_16_4k_3_1(final_dot_16_4k_3_1)  ,
    .final_dot_16_4k_3_2(final_dot_16_4k_3_2)  ,
    .final_dot_16_4k_3_3(final_dot_16_4k_3_3)  ,
    .final_dot_16_4k_3_4(final_dot_16_4k_3_4)  ,
    .final_dot_16_4k_4_1(final_dot_16_4k_4_1)  ,
    .final_dot_16_4k_4_2(final_dot_16_4k_4_2)  ,
    .final_dot_16_4k_4_3(final_dot_16_4k_4_3)  ,
    .final_dot_16_4k_4_4(final_dot_16_4k_4_4)  
);

//将由边缘插值+均值调整的4k像素寄存标志位
wire    save_flag1      ;
reg     save_flag2      ;
reg     save_flag3      ;
assign  save_flag1=interpolate_start_flag3;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        save_flag2<=1'b0;
    else
        save_flag2<=save_flag1;
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        save_flag3<=1'b0;
    else
        save_flag3<=save_flag2;
end

//存储需要进行高斯平滑的6行9列数据
reg [7:0]  column1_4k[5:0]   ;
reg [7:0]  column2_4k[5:0]   ;              
reg [7:0]  column3_4k[5:0]   ;
reg [7:0]  column4_4k[5:0]   ;
reg [7:0]  column5_4k[5:0]   ;
reg [7:0]  column6_4k[5:0]   ;
reg [7:0]  column7_4k[5:0]   ;
reg [7:0]  column8_4k[5:0]   ;
reg [7:0]  column9_4k[5:0]   ;
//前5列在interpolate_start_flag1时先进行循环移动
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column1_4k[5]<='b0   ;
        column1_4k[4]<='b0   ;
        column1_4k[3]<='b0   ;
        column1_4k[2]<='b0   ;
        column1_4k[1]<='b0   ;
        column1_4k[0]<='b0   ;
    end
    else if(interpolate_start_flag1==1'b1) begin        
        column1_4k[5]<=column5_4k[5]   ;
        column1_4k[4]<=column5_4k[4]   ;
        column1_4k[3]<=column5_4k[3]   ;
        column1_4k[2]<=column5_4k[2]   ;
        column1_4k[1]<=column5_4k[1]   ;
        column1_4k[0]<=column5_4k[0]   ;
    end
    else begin
        column1_4k[5]<=column1_4k[5]   ;
        column1_4k[4]<=column1_4k[4]   ;
        column1_4k[3]<=column1_4k[3]   ;
        column1_4k[2]<=column1_4k[2]   ;
        column1_4k[1]<=column1_4k[1]   ;
        column1_4k[0]<=column1_4k[0]   ;
    end  
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column2_4k[5]<='b0   ;
        column2_4k[4]<='b0   ;
        column2_4k[3]<='b0   ;
        column2_4k[2]<='b0   ;
        column2_4k[1]<='b0   ;
        column2_4k[0]<='b0   ;
    end
    else if(interpolate_start_flag1==1'b1) begin         
        column2_4k[5]<=column6_4k[5]   ;
        column2_4k[4]<=column6_4k[4]   ;
        column2_4k[3]<=column6_4k[3]   ;
        column2_4k[2]<=column6_4k[2]   ;
        column2_4k[1]<=column6_4k[1]   ;
        column2_4k[0]<=column6_4k[0]   ;
    end
    else begin
        column2_4k[5]<=column2_4k[5]   ;
        column2_4k[4]<=column2_4k[4]   ;
        column2_4k[3]<=column2_4k[3]   ;
        column2_4k[2]<=column2_4k[2]   ;
        column2_4k[1]<=column2_4k[1]   ;
        column2_4k[0]<=column2_4k[0]   ;
    end  
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column3_4k[5]<='b0   ;
        column3_4k[4]<='b0   ;
        column3_4k[3]<='b0   ;
        column3_4k[2]<='b0   ;
        column3_4k[1]<='b0   ;
        column3_4k[0]<='b0   ;
    end
    else if(interpolate_start_flag1==1'b1) begin            
        column3_4k[5]<=column7_4k[5]   ;
        column3_4k[4]<=column7_4k[4]   ;
        column3_4k[3]<=column7_4k[3]   ;
        column3_4k[2]<=column7_4k[2]   ;
        column3_4k[1]<=column7_4k[1]   ;
        column3_4k[0]<=column7_4k[0]   ;
    end
    else begin
        column3_4k[5]<=column3_4k[5]   ;
        column3_4k[4]<=column3_4k[4]   ;
        column3_4k[3]<=column3_4k[3]   ;
        column3_4k[2]<=column3_4k[2]   ;
        column3_4k[1]<=column3_4k[1]   ;
        column3_4k[0]<=column3_4k[0]   ;
    end  
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column4_4k[5]<='b0   ;
        column4_4k[4]<='b0   ;
        column4_4k[3]<='b0   ;
        column4_4k[2]<='b0   ;
        column4_4k[1]<='b0   ;
        column4_4k[0]<='b0   ;
    end
    else if(interpolate_start_flag1==1'b1) begin         
        column4_4k[5]<=column8_4k[5]   ;
        column4_4k[4]<=column8_4k[4]   ;
        column4_4k[3]<=column8_4k[3]   ;
        column4_4k[2]<=column8_4k[2]   ;
        column4_4k[1]<=column8_4k[1]   ;
        column4_4k[0]<=column8_4k[0]   ;
    end
    else begin
        column4_4k[5]<=column4_4k[5]   ;
        column4_4k[4]<=column4_4k[4]   ;
        column4_4k[3]<=column4_4k[3]   ;
        column4_4k[2]<=column4_4k[2]   ;
        column4_4k[1]<=column4_4k[1]   ;
        column4_4k[0]<=column4_4k[0]   ;
    end  
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column5_4k[5]<='b0   ;
        column5_4k[4]<='b0   ;
        column5_4k[3]<='b0   ;
        column5_4k[2]<='b0   ;
        column5_4k[1]<='b0   ;
        column5_4k[0]<='b0   ;
    end
    else if(interpolate_start_flag1==1'b1) begin         
        column5_4k[5]<=column9_4k[5]   ;
        column5_4k[4]<=column9_4k[4]   ;
        column5_4k[3]<=column9_4k[3]   ;
        column5_4k[2]<=column9_4k[2]   ;
        column5_4k[1]<=column9_4k[1]   ;
        column5_4k[0]<=column9_4k[0]   ; 
    end
    else begin
        column5_4k[5]<=column5_4k[5]   ;
        column5_4k[4]<=column5_4k[4]   ;
        column5_4k[3]<=column5_4k[3]   ;
        column5_4k[2]<=column5_4k[2]   ;
        column5_4k[1]<=column5_4k[1]   ;
        column5_4k[0]<=column5_4k[0]   ;
    end  
end
//后4列进行赋值
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column6_4k[5]<='b0   ;
        column6_4k[4]<='b0   ;
        column6_4k[3]<='b0   ;
        column6_4k[2]<='b0   ;
        column6_4k[1]<='b0   ;
        column6_4k[0]<='b0   ;
    end
    else if(save_flag1==1'b1) begin         
        column6_4k[5]<=final_dot_16_4k_4_1   ;
    end
    else if(save_flag2==1'b1) begin
        column6_4k[4]<=final_dot_16_4k_1_1   ;
        column6_4k[3]<=final_dot_16_4k_2_1   ;
        column6_4k[2]<=final_dot_16_4k_3_1   ;
        column6_4k[1]<=final_dot_16_4k_4_1   ;
    end
    else if(save_flag3==1'b1) begin
        column6_4k[0]<=final_dot_16_4k_1_1   ;
    end
    else begin
        column6_4k[5]<=column6_4k[5]   ;
        column6_4k[4]<=column6_4k[4]   ;
        column6_4k[3]<=column6_4k[3]   ;
        column6_4k[2]<=column6_4k[2]   ;
        column6_4k[1]<=column6_4k[1]   ;
        column6_4k[0]<=column6_4k[0]   ;
    end  
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column7_4k[5]<='b0   ;
        column7_4k[4]<='b0   ;
        column7_4k[3]<='b0   ;
        column7_4k[2]<='b0   ;
        column7_4k[1]<='b0   ;
        column7_4k[0]<='b0   ;
    end
    else if(save_flag1==1'b1) begin         
        column7_4k[5]<=final_dot_16_4k_4_2   ;
    end
    else if(save_flag2==1'b1) begin
        column7_4k[4]<=final_dot_16_4k_1_2   ;
        column7_4k[3]<=final_dot_16_4k_2_2   ;
        column7_4k[2]<=final_dot_16_4k_3_2   ;
        column7_4k[1]<=final_dot_16_4k_4_2   ;
    end
    else if(save_flag3==1'b1) begin
        column7_4k[0]<=final_dot_16_4k_1_2   ;
    end
    else begin
        column7_4k[5]<=column7_4k[5]   ;
        column7_4k[4]<=column7_4k[4]   ;
        column7_4k[3]<=column7_4k[3]   ;
        column7_4k[2]<=column7_4k[2]   ;
        column7_4k[1]<=column7_4k[1]   ;
        column7_4k[0]<=column7_4k[0]   ;
    end  
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column8_4k[5]<='b0   ;
        column8_4k[4]<='b0   ;
        column8_4k[3]<='b0   ;
        column8_4k[2]<='b0   ;
        column8_4k[1]<='b0   ;
        column8_4k[0]<='b0   ;
    end
    else if(save_flag1==1'b1) begin         
        column8_4k[5]<=final_dot_16_4k_4_3   ;
    end
    else if(save_flag2==1'b1) begin
        column8_4k[4]<=final_dot_16_4k_1_3   ;
        column8_4k[3]<=final_dot_16_4k_2_3   ;
        column8_4k[2]<=final_dot_16_4k_3_3   ;
        column8_4k[1]<=final_dot_16_4k_4_3   ;
    end
    else if(save_flag3==1'b1) begin
        column8_4k[0]<=final_dot_16_4k_1_3   ;
    end
    else begin
        column8_4k[5]<=column8_4k[5]   ;
        column8_4k[4]<=column8_4k[4]   ;
        column8_4k[3]<=column8_4k[3]   ;
        column8_4k[2]<=column8_4k[2]   ;
        column8_4k[1]<=column8_4k[1]   ;
        column8_4k[0]<=column8_4k[0]   ;
    end  
end
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column9_4k[5]<='b0   ;
        column9_4k[4]<='b0   ;
        column9_4k[3]<='b0   ;
        column9_4k[2]<='b0   ;
        column9_4k[1]<='b0   ;
        column9_4k[0]<='b0   ;
    end
    else if(save_flag1==1'b1) begin         
        column9_4k[5]<=final_dot_16_4k_4_4   ;
    end
    else if(save_flag2==1'b1) begin
        column9_4k[4]<=final_dot_16_4k_1_4   ;
        column9_4k[3]<=final_dot_16_4k_2_4   ;
        column9_4k[2]<=final_dot_16_4k_3_4   ;
        column9_4k[1]<=final_dot_16_4k_4_4   ;
    end
    else if(save_flag3==1'b1) begin
        column9_4k[0]<=final_dot_16_4k_1_4   ;
    end
    else begin
        column9_4k[5]<=column9_4k[5]   ;
        column9_4k[4]<=column9_4k[4]   ;
        column9_4k[3]<=column9_4k[3]   ;
        column9_4k[2]<=column9_4k[2]   ;
        column9_4k[1]<=column9_4k[1]   ;
        column9_4k[0]<=column9_4k[0]   ;
    end  
end

//取出需要进行高斯平滑的36点标志位
reg     gauss_flag  ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        gauss_flag<=1'b0;
    else
        gauss_flag<=save_flag3;
end

//取出进行高斯平滑的36个数据
reg [7:0]   column1_gauss_4k[5:0]   ;
reg [7:0]   column2_gauss_4k[5:0]   ;
reg [7:0]   column3_gauss_4k[5:0]   ;
reg [7:0]   column4_gauss_4k[5:0]   ;
reg [7:0]   column5_gauss_4k[5:0]   ;
reg [7:0]   column6_gauss_4k[5:0]   ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0) begin
        column1_gauss_4k[5]<='b0;
        column1_gauss_4k[4]<='b0;
        column1_gauss_4k[3]<='b0;
        column1_gauss_4k[2]<='b0;
        column1_gauss_4k[1]<='b0;
        column1_gauss_4k[0]<='b0;
        column2_gauss_4k[5]<='b0;
        column2_gauss_4k[4]<='b0;
        column2_gauss_4k[3]<='b0;
        column2_gauss_4k[2]<='b0;
        column2_gauss_4k[1]<='b0;
        column2_gauss_4k[0]<='b0;
        column3_gauss_4k[5]<='b0;
        column3_gauss_4k[4]<='b0;
        column3_gauss_4k[3]<='b0;
        column3_gauss_4k[2]<='b0;
        column3_gauss_4k[1]<='b0;
        column3_gauss_4k[0]<='b0;
        column4_gauss_4k[5]<='b0;
        column4_gauss_4k[4]<='b0;
        column4_gauss_4k[3]<='b0;
        column4_gauss_4k[2]<='b0;
        column4_gauss_4k[1]<='b0;
        column4_gauss_4k[0]<='b0;
        column5_gauss_4k[5]<='b0;
        column5_gauss_4k[4]<='b0;
        column5_gauss_4k[3]<='b0;
        column5_gauss_4k[2]<='b0;
        column5_gauss_4k[1]<='b0;
        column5_gauss_4k[0]<='b0;
        column6_gauss_4k[5]<='b0;
        column6_gauss_4k[4]<='b0;
        column6_gauss_4k[3]<='b0;
        column6_gauss_4k[2]<='b0;
        column6_gauss_4k[1]<='b0;
        column6_gauss_4k[0]<='b0;
    end
    else if(col_num>=3'd4&&gauss_flag==1'b1) begin
        column1_gauss_4k[5]<=column1_4k[5];
        column1_gauss_4k[4]<=column1_4k[4];
        column1_gauss_4k[3]<=column1_4k[3];
        column1_gauss_4k[2]<=column1_4k[2];
        column1_gauss_4k[1]<=column1_4k[1];
        column1_gauss_4k[0]<=column1_4k[0];
        column2_gauss_4k[5]<=column2_4k[5];
        column2_gauss_4k[4]<=column2_4k[4];
        column2_gauss_4k[3]<=column2_4k[3];
        column2_gauss_4k[2]<=column2_4k[2];
        column2_gauss_4k[1]<=column2_4k[1];
        column2_gauss_4k[0]<=column2_4k[0];
        column3_gauss_4k[5]<=column3_4k[5];
        column3_gauss_4k[4]<=column3_4k[4];
        column3_gauss_4k[3]<=column3_4k[3];
        column3_gauss_4k[2]<=column3_4k[2];
        column3_gauss_4k[1]<=column3_4k[1];
        column3_gauss_4k[0]<=column3_4k[0];
        column4_gauss_4k[5]<=column4_4k[5];
        column4_gauss_4k[4]<=column4_4k[4];
        column4_gauss_4k[3]<=column4_4k[3];
        column4_gauss_4k[2]<=column4_4k[2];
        column4_gauss_4k[1]<=column4_4k[1];
        column4_gauss_4k[0]<=column4_4k[0];
        column5_gauss_4k[5]<=column5_4k[5];
        column5_gauss_4k[4]<=column5_4k[4];
        column5_gauss_4k[3]<=column5_4k[3];
        column5_gauss_4k[2]<=column5_4k[2];
        column5_gauss_4k[1]<=column5_4k[1];
        column5_gauss_4k[0]<=column5_4k[0];
        column6_gauss_4k[5]<=column6_4k[5];
        column6_gauss_4k[4]<=column6_4k[4];
        column6_gauss_4k[3]<=column6_4k[3];
        column6_gauss_4k[2]<=column6_4k[2];
        column6_gauss_4k[1]<=column6_4k[1];
        column6_gauss_4k[0]<=column6_4k[0];
    end
    else begin
        column1_gauss_4k[5]<='b0;
        column1_gauss_4k[4]<='b0;
        column1_gauss_4k[3]<='b0;
        column1_gauss_4k[2]<='b0;
        column1_gauss_4k[1]<='b0;
        column1_gauss_4k[0]<='b0;
        column2_gauss_4k[5]<='b0;
        column2_gauss_4k[4]<='b0;
        column2_gauss_4k[3]<='b0;
        column2_gauss_4k[2]<='b0;
        column2_gauss_4k[1]<='b0;
        column2_gauss_4k[0]<='b0;
        column3_gauss_4k[5]<='b0;
        column3_gauss_4k[4]<='b0;
        column3_gauss_4k[3]<='b0;
        column3_gauss_4k[2]<='b0;
        column3_gauss_4k[1]<='b0;
        column3_gauss_4k[0]<='b0;
        column4_gauss_4k[5]<='b0;
        column4_gauss_4k[4]<='b0;
        column4_gauss_4k[3]<='b0;
        column4_gauss_4k[2]<='b0;
        column4_gauss_4k[1]<='b0;
        column4_gauss_4k[0]<='b0;
        column5_gauss_4k[5]<='b0;
        column5_gauss_4k[4]<='b0;
        column5_gauss_4k[3]<='b0;
        column5_gauss_4k[2]<='b0;
        column5_gauss_4k[1]<='b0;
        column5_gauss_4k[0]<='b0;
        column6_gauss_4k[5]<='b0;
        column6_gauss_4k[4]<='b0;
        column6_gauss_4k[3]<='b0;
        column6_gauss_4k[2]<='b0;
        column6_gauss_4k[1]<='b0;
        column6_gauss_4k[0]<='b0;
    end
end

reg [7:0]   average ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        average<='b0;
    else if(col_num>=3'd4&&gauss_flag==1'b1)
        average<=column1_1k[2];
    else
        average<='b0;
end

//高斯平滑+均值调整得到最终的4k图像的16点
gauss_filter_dot_36_4k gauss_filter_dot_36_4k_inst
(
    .sys_clk      (sys_clk            )            ,
    .dot_36_4k_1_1(column1_gauss_4k[5])            ,
    .dot_36_4k_1_2(column2_gauss_4k[5])            ,
    .dot_36_4k_1_3(column3_gauss_4k[5])            ,
    .dot_36_4k_1_4(column4_gauss_4k[5])            ,
    .dot_36_4k_1_5(column5_gauss_4k[5])            ,
    .dot_36_4k_1_6(column6_gauss_4k[5])            ,
    .dot_36_4k_2_1(column1_gauss_4k[4])            ,
    .dot_36_4k_2_2(column2_gauss_4k[4])            ,
    .dot_36_4k_2_3(column3_gauss_4k[4])            ,
    .dot_36_4k_2_4(column4_gauss_4k[4])            ,
    .dot_36_4k_2_5(column5_gauss_4k[4])            ,
    .dot_36_4k_2_6(column6_gauss_4k[4])            ,
    .dot_36_4k_3_1(column1_gauss_4k[3])            ,
    .dot_36_4k_3_2(column2_gauss_4k[3])            ,
    .dot_36_4k_3_3(column3_gauss_4k[3])            ,
    .dot_36_4k_3_4(column4_gauss_4k[3])            ,
    .dot_36_4k_3_5(column5_gauss_4k[3])            ,
    .dot_36_4k_3_6(column6_gauss_4k[3])            ,
    .dot_36_4k_4_1(column1_gauss_4k[2])            ,
    .dot_36_4k_4_2(column2_gauss_4k[2])            ,
    .dot_36_4k_4_3(column3_gauss_4k[2])            ,
    .dot_36_4k_4_4(column4_gauss_4k[2])            ,
    .dot_36_4k_4_5(column5_gauss_4k[2])            ,
    .dot_36_4k_4_6(column6_gauss_4k[2])            ,
    .dot_36_4k_5_1(column1_gauss_4k[1])            ,
    .dot_36_4k_5_2(column2_gauss_4k[1])            ,
    .dot_36_4k_5_3(column3_gauss_4k[1])            ,
    .dot_36_4k_5_4(column4_gauss_4k[1])            ,
    .dot_36_4k_5_5(column5_gauss_4k[1])            ,
    .dot_36_4k_5_6(column6_gauss_4k[1])            ,
    .dot_36_4k_6_1(column1_gauss_4k[0])            ,
    .dot_36_4k_6_2(column2_gauss_4k[0])            ,
    .dot_36_4k_6_3(column3_gauss_4k[0])            ,
    .dot_36_4k_6_4(column4_gauss_4k[0])            ,
    .dot_36_4k_6_5(column5_gauss_4k[0])            ,
    .dot_36_4k_6_6(column6_gauss_4k[0])            ,
    
    .average(average)                  ,                //平均值

    .final_4k_pixel_1_1(single_color_dataout[16*8-1:15*8])       , 
    .final_4k_pixel_1_2(single_color_dataout[15*8-1:14*8])       , 
    .final_4k_pixel_1_3(single_color_dataout[14*8-1:13*8])       , 
    .final_4k_pixel_1_4(single_color_dataout[13*8-1:12*8])       ,
    .final_4k_pixel_2_1(single_color_dataout[12*8-1:11*8])       , 
    .final_4k_pixel_2_2(single_color_dataout[11*8-1:10*8])       , 
    .final_4k_pixel_2_3(single_color_dataout[10*8-1: 9*8])       , 
    .final_4k_pixel_2_4(single_color_dataout[ 9*8-1: 8*8])       ,
    .final_4k_pixel_3_1(single_color_dataout[ 8*8-1: 7*8])       , 
    .final_4k_pixel_3_2(single_color_dataout[ 7*8-1: 6*8])       , 
    .final_4k_pixel_3_3(single_color_dataout[ 6*8-1: 5*8])       , 
    .final_4k_pixel_3_4(single_color_dataout[ 5*8-1: 4*8])       ,
    .final_4k_pixel_4_1(single_color_dataout[ 4*8-1: 3*8])       , 
    .final_4k_pixel_4_2(single_color_dataout[ 3*8-1: 2*8])       , 
    .final_4k_pixel_4_3(single_color_dataout[ 2*8-1: 1*8])       , 
    .final_4k_pixel_4_4(single_color_dataout[ 1*8-1: 0*8])       
);

reg early_send_flag ;
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        early_send_flag<=1'b0;
    else
        early_send_flag<=gauss_flag;
end

//send_flag信号与并行输出的16点像素同步
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n==1'b0)
        send_flag<=1'b0;
    else
        send_flag<=early_send_flag;
end

endmodule




