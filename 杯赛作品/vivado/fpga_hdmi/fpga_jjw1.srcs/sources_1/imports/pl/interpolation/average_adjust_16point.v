//利用平均值进行16个点的调整
module average_adjust_16point
(
    input   wire    [7:0]   dot_16_4k_1_1            ,//输入4k图片16个点的像素值
    input   wire    [7:0]   dot_16_4k_1_2            ,
    input   wire    [7:0]   dot_16_4k_1_3            ,
    input   wire    [7:0]   dot_16_4k_1_4            ,
    input   wire    [7:0]   dot_16_4k_2_1            ,
    input   wire    [7:0]   dot_16_4k_2_2            ,
    input   wire    [7:0]   dot_16_4k_2_3            ,
    input   wire    [7:0]   dot_16_4k_2_4            ,
    input   wire    [7:0]   dot_16_4k_3_1            ,
    input   wire    [7:0]   dot_16_4k_3_2            ,
    input   wire    [7:0]   dot_16_4k_3_3            ,
    input   wire    [7:0]   dot_16_4k_3_4            ,
    input   wire    [7:0]   dot_16_4k_4_1            ,
    input   wire    [7:0]   dot_16_4k_4_2            ,
    input   wire    [7:0]   dot_16_4k_4_3            ,
    input   wire    [7:0]   dot_16_4k_4_4            ,
    
    input   wire    [7:0]   average                  ,//平均值

    output  reg     [7:0]   adjust_dot_16_4k_1_1     ,//输出9点中件点对应4k图片的像素值
    output  reg     [7:0]   adjust_dot_16_4k_1_2     ,
    output  reg     [7:0]   adjust_dot_16_4k_1_3     ,
    output  reg     [7:0]   adjust_dot_16_4k_1_4     ,
    output  reg     [7:0]   adjust_dot_16_4k_2_1     ,
    output  reg     [7:0]   adjust_dot_16_4k_2_2     ,
    output  reg     [7:0]   adjust_dot_16_4k_2_3     ,
    output  reg     [7:0]   adjust_dot_16_4k_2_4     ,
    output  reg     [7:0]   adjust_dot_16_4k_3_1     ,
    output  reg     [7:0]   adjust_dot_16_4k_3_2     ,
    output  reg     [7:0]   adjust_dot_16_4k_3_3     ,
    output  reg     [7:0]   adjust_dot_16_4k_3_4     ,
    output  reg     [7:0]   adjust_dot_16_4k_4_1     ,
    output  reg     [7:0]   adjust_dot_16_4k_4_2     ,
    output  reg     [7:0]   adjust_dot_16_4k_4_3     ,
    output  reg     [7:0]   adjust_dot_16_4k_4_4     
);

wire    [11:0]  sum_dot_16_4k  ;

assign  sum_dot_16_4k=(((dot_16_4k_1_1+dot_16_4k_1_2)+(dot_16_4k_1_3+dot_16_4k_1_4))+
                      ((dot_16_4k_2_1+dot_16_4k_2_2)+(dot_16_4k_2_3+dot_16_4k_2_4)))+
                      (((dot_16_4k_3_1+dot_16_4k_3_2)+(dot_16_4k_3_3+dot_16_4k_3_4))+
                      ((dot_16_4k_4_1+dot_16_4k_4_2)+(dot_16_4k_4_3+dot_16_4k_4_4)));

wire    [7:0]   ave_sum_dot_16_4k   ;

assign  ave_sum_dot_16_4k=sum_dot_16_4k>>4;

wire    [8:0]   dot_16_4k_1_1_add_ave   ;
wire    [8:0]   dot_16_4k_1_2_add_ave   ;
wire    [8:0]   dot_16_4k_1_3_add_ave   ;
wire    [8:0]   dot_16_4k_1_4_add_ave   ;
wire    [8:0]   dot_16_4k_2_1_add_ave   ;
wire    [8:0]   dot_16_4k_2_2_add_ave   ;
wire    [8:0]   dot_16_4k_2_3_add_ave   ;
wire    [8:0]   dot_16_4k_2_4_add_ave   ;
wire    [8:0]   dot_16_4k_3_1_add_ave   ;
wire    [8:0]   dot_16_4k_3_2_add_ave   ;
wire    [8:0]   dot_16_4k_3_3_add_ave   ;
wire    [8:0]   dot_16_4k_3_4_add_ave   ;
wire    [8:0]   dot_16_4k_4_1_add_ave   ;
wire    [8:0]   dot_16_4k_4_2_add_ave   ;
wire    [8:0]   dot_16_4k_4_3_add_ave   ;
wire    [8:0]   dot_16_4k_4_4_add_ave   ;

assign  dot_16_4k_1_1_add_ave=dot_16_4k_1_1+average;
assign  dot_16_4k_1_2_add_ave=dot_16_4k_1_2+average;
assign  dot_16_4k_1_3_add_ave=dot_16_4k_1_3+average;
assign  dot_16_4k_1_4_add_ave=dot_16_4k_1_4+average;
assign  dot_16_4k_2_1_add_ave=dot_16_4k_2_1+average;
assign  dot_16_4k_2_2_add_ave=dot_16_4k_2_2+average;
assign  dot_16_4k_2_3_add_ave=dot_16_4k_2_3+average;
assign  dot_16_4k_2_4_add_ave=dot_16_4k_2_4+average;
assign  dot_16_4k_3_1_add_ave=dot_16_4k_3_1+average;
assign  dot_16_4k_3_2_add_ave=dot_16_4k_3_2+average;
assign  dot_16_4k_3_3_add_ave=dot_16_4k_3_3+average;
assign  dot_16_4k_3_4_add_ave=dot_16_4k_3_4+average;
assign  dot_16_4k_4_1_add_ave=dot_16_4k_4_1+average;
assign  dot_16_4k_4_2_add_ave=dot_16_4k_4_2+average;
assign  dot_16_4k_4_3_add_ave=dot_16_4k_4_3+average;
assign  dot_16_4k_4_4_add_ave=dot_16_4k_4_4+average;

//对16个点进行调整，判断是否超出了0~255
always@(*) begin
    if(dot_16_4k_1_1_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_1_1=8'd0;
    else if(dot_16_4k_1_1_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_1_1=8'd255;
    else
        adjust_dot_16_4k_1_1=dot_16_4k_1_1_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_1_2_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_1_2=8'd0;
    else if(dot_16_4k_1_2_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_1_2=8'd255;
    else
        adjust_dot_16_4k_1_2=dot_16_4k_1_2_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_1_3_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_1_3=8'd0;
    else if(dot_16_4k_1_3_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_1_3=8'd255;
    else
        adjust_dot_16_4k_1_3=dot_16_4k_1_3_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_1_4_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_1_4=8'd0;
    else if(dot_16_4k_1_4_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_1_4=8'd255;
    else
        adjust_dot_16_4k_1_4=dot_16_4k_1_4_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_2_1_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_2_1=8'd0;
    else if(dot_16_4k_2_1_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_2_1=8'd255;
    else
        adjust_dot_16_4k_2_1=dot_16_4k_2_1_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_2_2_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_2_2=8'd0;
    else if(dot_16_4k_2_2_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_2_2=8'd255;
    else
        adjust_dot_16_4k_2_2=dot_16_4k_2_2_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_2_3_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_2_3=8'd0;
    else if(dot_16_4k_2_3_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_2_3=8'd255;
    else
        adjust_dot_16_4k_2_3=dot_16_4k_2_3_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_2_4_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_2_4=8'd0;
    else if(dot_16_4k_2_4_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_2_4=8'd255;
    else
        adjust_dot_16_4k_2_4=dot_16_4k_2_4_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_3_1_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_3_1=8'd0;
    else if(dot_16_4k_3_1_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_3_1=8'd255;
    else
        adjust_dot_16_4k_3_1=dot_16_4k_3_1_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_3_2_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_3_2=8'd0;
    else if(dot_16_4k_3_2_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_3_2=8'd255;
    else
        adjust_dot_16_4k_3_2=dot_16_4k_3_2_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_3_3_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_3_3=8'd0;
    else if(dot_16_4k_3_3_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_3_3=8'd255;
    else
        adjust_dot_16_4k_3_3=dot_16_4k_3_3_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_3_4_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_3_4=8'd0;
    else if(dot_16_4k_3_4_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_3_4=8'd255;
    else
        adjust_dot_16_4k_3_4=dot_16_4k_3_4_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_4_1_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_4_1=8'd0;
    else if(dot_16_4k_4_1_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_4_1=8'd255;
    else
        adjust_dot_16_4k_4_1=dot_16_4k_4_1_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_4_2_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_4_2=8'd0;
    else if(dot_16_4k_4_2_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_4_2=8'd255;
    else
        adjust_dot_16_4k_4_2=dot_16_4k_4_2_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_4_3_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_4_3=8'd0;
    else if(dot_16_4k_4_3_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_4_3=8'd255;
    else
        adjust_dot_16_4k_4_3=dot_16_4k_4_3_add_ave-ave_sum_dot_16_4k;
end

always@(*) begin
    if(dot_16_4k_4_4_add_ave<ave_sum_dot_16_4k)
        adjust_dot_16_4k_4_4=8'd0;
    else if(dot_16_4k_4_4_add_ave-ave_sum_dot_16_4k>8'd255)
        adjust_dot_16_4k_4_4=8'd255;
    else
        adjust_dot_16_4k_4_4=dot_16_4k_4_4_add_ave-ave_sum_dot_16_4k;
end


endmodule



