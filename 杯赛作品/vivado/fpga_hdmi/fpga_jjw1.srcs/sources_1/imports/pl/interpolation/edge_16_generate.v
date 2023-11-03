//利用边缘插值法9个点插值出中间点的16个4k点
module edge_16_generate
(
    input   wire    [7:0]   dot_9_1k_1_1            ,//输入1k图片9个点的像素值
    input   wire    [7:0]   dot_9_1k_1_2            ,
    input   wire    [7:0]   dot_9_1k_1_3            ,
    input   wire    [7:0]   dot_9_1k_2_1            ,
    input   wire    [7:0]   dot_9_1k_2_2            ,
    input   wire    [7:0]   dot_9_1k_2_3            ,
    input   wire    [7:0]   dot_9_1k_3_1            ,
    input   wire    [7:0]   dot_9_1k_3_2            ,
    input   wire    [7:0]   dot_9_1k_3_3            ,
    
    output  wire    [7:0]   edge_dot_16_4k_1_1    ,//输出9点中件点对应4k图片的像素值
    output  wire    [7:0]   edge_dot_16_4k_1_2    ,
    output  wire    [7:0]   edge_dot_16_4k_1_3    ,
    output  wire    [7:0]   edge_dot_16_4k_1_4    ,
    output  wire    [7:0]   edge_dot_16_4k_2_1    ,
    output  wire    [7:0]   edge_dot_16_4k_2_2    ,
    output  wire    [7:0]   edge_dot_16_4k_2_3    ,
    output  wire    [7:0]   edge_dot_16_4k_2_4    ,
    output  wire    [7:0]   edge_dot_16_4k_3_1    ,
    output  wire    [7:0]   edge_dot_16_4k_3_2    ,
    output  wire    [7:0]   edge_dot_16_4k_3_3    ,
    output  wire    [7:0]   edge_dot_16_4k_3_4    ,
    output  wire    [7:0]   edge_dot_16_4k_4_1    ,
    output  wire    [7:0]   edge_dot_16_4k_4_2    ,
    output  wire    [7:0]   edge_dot_16_4k_4_3    ,
    output  wire    [7:0]   edge_dot_16_4k_4_4    
);

//移位以便将乘法转为加法
// wire    [9:0]   dot_9_1k_1_1_ls2    ;  
wire    [8:0]   dot_9_1k_1_1_ls1    ;  
// assign  dot_9_1k_1_1_ls2=dot_9_1k_1_1<<2;
assign  dot_9_1k_1_1_ls1=dot_9_1k_1_1<<1;
   
wire    [9:0]   dot_9_1k_1_2_ls2    ;  
wire    [8:0]   dot_9_1k_1_2_ls1    ;  
assign  dot_9_1k_1_2_ls2=dot_9_1k_1_2<<2;
assign  dot_9_1k_1_2_ls1=dot_9_1k_1_2<<1;

// wire    [9:0]   dot_9_1k_1_3_ls2    ;  
wire    [8:0]   dot_9_1k_1_3_ls1    ;  
// assign  dot_9_1k_1_3_ls2=dot_9_1k_1_3<<2;
assign  dot_9_1k_1_3_ls1=dot_9_1k_1_3<<1; 
          
wire    [9:0]   dot_9_1k_2_1_ls2    ;  
wire    [8:0]   dot_9_1k_2_1_ls1    ;  
assign  dot_9_1k_2_1_ls2=dot_9_1k_2_1<<2;
assign  dot_9_1k_2_1_ls1=dot_9_1k_2_1<<1;

wire    [9:0]   dot_9_1k_2_2_ls2    ;  
wire    [8:0]   dot_9_1k_2_2_ls1    ;  
assign  dot_9_1k_2_2_ls2=dot_9_1k_2_2<<2;
assign  dot_9_1k_2_2_ls1=dot_9_1k_2_2<<1;

wire    [9:0]   dot_9_1k_2_3_ls2    ;  
wire    [8:0]   dot_9_1k_2_3_ls1    ;  
assign  dot_9_1k_2_3_ls2=dot_9_1k_2_3<<2;
assign  dot_9_1k_2_3_ls1=dot_9_1k_2_3<<1;       
           
// wire    [9:0]   dot_9_1k_3_1_ls2    ;  
wire    [8:0]   dot_9_1k_3_1_ls1    ;  
// assign  dot_9_1k_3_1_ls2=dot_9_1k_3_1<<2;
assign  dot_9_1k_3_1_ls1=dot_9_1k_3_1<<1;

wire    [9:0]   dot_9_1k_3_2_ls2    ;  
wire    [8:0]   dot_9_1k_3_2_ls1    ;  
assign  dot_9_1k_3_2_ls2=dot_9_1k_3_2<<2;
assign  dot_9_1k_3_2_ls1=dot_9_1k_3_2<<1;       

// wire    [9:0]   dot_9_1k_3_3_ls2    ;  
wire    [8:0]   dot_9_1k_3_3_ls1    ;  
// assign  dot_9_1k_3_3_ls2=dot_9_1k_3_3<<2;
assign  dot_9_1k_3_3_ls1=dot_9_1k_3_3<<1;
            
//水平方向
//第一行
wire    [10:0]   pixel_left_r1       ;
wire    [10:0]   pixel_right_r1      ;
wire    [10:0]   pixel_midle_r1      ;
assign  pixel_left_r1=(dot_9_1k_2_1_ls2+dot_9_1k_2_1)+(dot_9_1k_1_1_ls1+dot_9_1k_1_1);
assign  pixel_right_r1=(dot_9_1k_2_3_ls2+dot_9_1k_2_3)+(dot_9_1k_1_3_ls1+dot_9_1k_1_3);
assign  pixel_midle_r1=(dot_9_1k_2_2_ls2+dot_9_1k_2_2)+(dot_9_1k_1_2_ls1+dot_9_1k_1_2);
//求出第一行左右两边的像素值
wire    [7:0]   pixel_left_r_1       ;
wire    [7:0]   pixel_right_r_1      ;
assign  pixel_left_r_1=pixel_left_r1>>3;
assign  pixel_right_r_1=pixel_right_r1>>3;
//求出左右两边的梯度
reg     [7:0]   d1_left ;
always@(*) begin
    if(pixel_midle_r1>pixel_left_r1)
        d1_left=(pixel_midle_r1-pixel_left_r1)>>3;
    else
        d1_left=(pixel_left_r1-pixel_midle_r1)>>3;
end
reg     [7:0]   d1_right ;
always@(*) begin
    if(pixel_right_r1>pixel_midle_r1)
        d1_right=(pixel_right_r1-pixel_midle_r1)>>3;
    else
        d1_right=(pixel_midle_r1-pixel_right_r1)>>3;
end
//求出1x(d1_left+d1_right),3x(d1_left+d1_right),5x(d1_left+d1_right),7x(d1_left+d1_right)
wire    [10:0]  d1_right_ls3;
wire    [8:0]   d1_right_add_d1_left  ;
wire    [9:0]   three_mul_d1_right_add_d1_left  ;
wire    [10:0]  five_mul_d1_right_add_d1_left  ;
wire    [11:0]  seven_mul_d1_right_add_d1_left  ;

assign  d1_right_ls3=d1_right<<3;
assign  d1_right_add_d1_left=d1_left+d1_right;
assign  three_mul_d1_right_add_d1_left=(d1_right_add_d1_left<<1)+d1_right_add_d1_left;
assign  five_mul_d1_right_add_d1_left=(d1_right_add_d1_left<<2)+d1_right_add_d1_left;
assign  seven_mul_d1_right_add_d1_left=((d1_right_add_d1_left<<2)+(d1_right_add_d1_left<<1))+d1_right_add_d1_left;
//求出跳变点坐标x1
reg     [3:0]   x1;
always@(*) begin
    if(d1_right_ls3>seven_mul_d1_right_add_d1_left)
        x1=4'd8;
    else if(d1_right_ls3>five_mul_d1_right_add_d1_left)
        x1=4'd6;
    else if(d1_right_ls3>three_mul_d1_right_add_d1_left)
        x1=4'd4;
    else if(d1_right_ls3>d1_right_add_d1_left)
        x1=4'd2;
    else
        x1=4'd0;
end
//利用x1和第一行左右两边像素值求出第一行4个点的像素值
reg     [7:0]   edge_dot_16_4k_r_1_1;
reg     [7:0]   edge_dot_16_4k_r_1_2;
reg     [7:0]   edge_dot_16_4k_r_1_3;
reg     [7:0]   edge_dot_16_4k_r_1_4;
always@(*) begin
    if(3'd1<x1)
        edge_dot_16_4k_r_1_1=pixel_left_r_1;
    else
        edge_dot_16_4k_r_1_1=pixel_right_r_1;
end
always@(*) begin
    if(3'd3<x1)
        edge_dot_16_4k_r_1_2=pixel_left_r_1;
    else
        edge_dot_16_4k_r_1_2=pixel_right_r_1;
end
always@(*) begin
    if(3'd5<x1)
        edge_dot_16_4k_r_1_3=pixel_left_r_1;
    else
        edge_dot_16_4k_r_1_3=pixel_right_r_1;
end
always@(*) begin
    if(3'd7<x1)
        edge_dot_16_4k_r_1_4=pixel_left_r_1;
    else
        edge_dot_16_4k_r_1_4=pixel_right_r_1;
end

//第二行
wire    [10:0]   pixel_left_r2       ;
wire    [10:0]   pixel_right_r2      ;
wire    [10:0]   pixel_midle_r2      ;
assign  pixel_left_r2=(dot_9_1k_2_1_ls2+dot_9_1k_2_1_ls1)+(dot_9_1k_2_1+dot_9_1k_1_1);
assign  pixel_right_r2=(dot_9_1k_2_3_ls2+dot_9_1k_2_3_ls1)+(dot_9_1k_2_3+dot_9_1k_1_3);
assign  pixel_midle_r2=(dot_9_1k_2_2_ls2+dot_9_1k_2_2_ls1)+(dot_9_1k_2_2+dot_9_1k_1_2);
//求出第二行左右两边的像素值
wire    [7:0]   pixel_left_r_2       ;
wire    [7:0]   pixel_right_r_2      ;
assign  pixel_left_r_2=pixel_left_r2>>3;
assign  pixel_right_r_2=pixel_right_r2>>3;
//求出左右两边的梯度
reg     [7:0]   d2_left ;
always@(*) begin
    if(pixel_midle_r2>pixel_left_r2)
        d2_left=(pixel_midle_r2-pixel_left_r2)>>3;
    else
        d2_left=(pixel_left_r2-pixel_midle_r2)>>3;
end
reg     [7:0]   d2_right ;
always@(*) begin
    if(pixel_right_r2>pixel_midle_r2)
        d2_right=(pixel_right_r2-pixel_midle_r2)>>3;
    else
        d2_right=(pixel_midle_r2-pixel_right_r2)>>3;
end
//求出1x(d2_left+d2_right),3x(d2_left+d2_right),5x(d2_left+d2_right),7x(d2_left+d2_right)
wire    [10:0]  d2_right_ls3;
wire    [8:0]   d2_right_add_d2_left  ;
wire    [9:0]   three_mul_d2_right_add_d2_left  ;
wire    [10:0]  five_mul_d2_right_add_d2_left  ;
wire    [11:0]  seven_mul_d2_right_add_d2_left  ;

assign  d2_right_ls3=d2_right<<3;
assign  d2_right_add_d2_left=d2_left+d2_right;
assign  three_mul_d2_right_add_d2_left=(d2_right_add_d2_left<<1)+d2_right_add_d2_left;
assign  five_mul_d2_right_add_d2_left=(d2_right_add_d2_left<<2)+d2_right_add_d2_left;
assign  seven_mul_d2_right_add_d2_left=((d2_right_add_d2_left<<2)+(d2_right_add_d2_left<<1))+d2_right_add_d2_left;
//求出跳变点坐标x2
reg     [3:0]   x2;
always@(*) begin
    if(d2_right_ls3>seven_mul_d2_right_add_d2_left)
        x2=4'd8;
    else if(d2_right_ls3>five_mul_d2_right_add_d2_left)
        x2=4'd6;
    else if(d2_right_ls3>three_mul_d2_right_add_d2_left)
        x2=4'd4;
    else if(d2_right_ls3>d2_right_add_d2_left)
        x2=4'd2;
    else
        x2=4'd0;
end
//利用x2和第二行左右两边像素值求出第二行4个点的像素值
reg     [7:0]   edge_dot_16_4k_r_2_1;
reg     [7:0]   edge_dot_16_4k_r_2_2;
reg     [7:0]   edge_dot_16_4k_r_2_3;
reg     [7:0]   edge_dot_16_4k_r_2_4;
always@(*) begin
    if(3'd1<x2)
        edge_dot_16_4k_r_2_1=pixel_left_r_2;
    else
        edge_dot_16_4k_r_2_1=pixel_right_r_2;
end
always@(*) begin
    if(3'd3<x2)
        edge_dot_16_4k_r_2_2=pixel_left_r_2;
    else
        edge_dot_16_4k_r_2_2=pixel_right_r_2;
end
always@(*) begin
    if(3'd5<x2)
        edge_dot_16_4k_r_2_3=pixel_left_r_2;
    else
        edge_dot_16_4k_r_2_3=pixel_right_r_2;
end
always@(*) begin
    if(3'd7<x2)
        edge_dot_16_4k_r_2_4=pixel_left_r_2;
    else
        edge_dot_16_4k_r_2_4=pixel_right_r_2;
end

//第三行
wire    [10:0]   pixel_left_r3       ;
wire    [10:0]   pixel_right_r3      ;
wire    [10:0]   pixel_midle_r3    ;
assign  pixel_left_r3=(dot_9_1k_2_1_ls2+dot_9_1k_2_1_ls1)+(dot_9_1k_2_1+dot_9_1k_3_1);
assign  pixel_right_r3=(dot_9_1k_2_3_ls2+dot_9_1k_2_3_ls1)+(dot_9_1k_2_3+dot_9_1k_3_3);
assign  pixel_midle_r3=(dot_9_1k_2_2_ls2+dot_9_1k_2_2_ls1)+(dot_9_1k_2_2+dot_9_1k_3_2);
//求出第三行左右两边的像素值
wire    [7:0]   pixel_left_r_3       ;
wire    [7:0]   pixel_right_r_3      ;
assign  pixel_left_r_3=pixel_left_r3>>3;
assign  pixel_right_r_3=pixel_right_r3>>3;
//求出左右两边的梯度
reg     [7:0]   d3_left ;
always@(*) begin
    if(pixel_midle_r3>pixel_left_r3)
        d3_left=(pixel_midle_r3-pixel_left_r3)>>3;
    else
        d3_left=(pixel_left_r3-pixel_midle_r3)>>3;
end
reg     [7:0]   d3_right ;
always@(*) begin
    if(pixel_right_r3>pixel_midle_r3)
        d3_right=(pixel_right_r3-pixel_midle_r3)>>3;
    else
        d3_right=(pixel_midle_r3-pixel_right_r3)>>3;
end
//求出1x(d3_left+d3_right),3x(d3_left+d3_right),5x(d3_left+d3_right),7x(d3_left+d3_right)
wire    [10:0]  d3_right_ls3;
wire    [8:0]   d3_right_add_d3_left  ;
wire    [9:0]   three_mul_d3_right_add_d3_left  ;
wire    [10:0]  five_mul_d3_right_add_d3_left  ;
wire    [11:0]  seven_mul_d3_right_add_d3_left  ;

assign  d3_right_ls3=d3_right<<3;
assign  d3_right_add_d3_left=d3_left+d3_right;
assign  three_mul_d3_right_add_d3_left=(d3_right_add_d3_left<<1)+d3_right_add_d3_left;
assign  five_mul_d3_right_add_d3_left=(d3_right_add_d3_left<<2)+d3_right_add_d3_left;
assign  seven_mul_d3_right_add_d3_left=((d3_right_add_d3_left<<2)+(d3_right_add_d3_left<<1))+d3_right_add_d3_left;
//求出跳变点坐标x3
reg     [3:0]   x3;
always@(*) begin
    if(d3_right_ls3>seven_mul_d3_right_add_d3_left)
        x3=4'd8;
    else if(d3_right_ls3>five_mul_d3_right_add_d3_left)
        x3=4'd6;
    else if(d3_right_ls3>three_mul_d3_right_add_d3_left)
        x3=4'd4;
    else if(d3_right_ls3>d3_right_add_d3_left)
        x3=4'd2;
    else
        x3=4'd0;
end
//利用x3和第三行左右两边像素值求出第三行4个点的像素值
reg     [7:0]   edge_dot_16_4k_r_3_1;
reg     [7:0]   edge_dot_16_4k_r_3_2;
reg     [7:0]   edge_dot_16_4k_r_3_3;
reg     [7:0]   edge_dot_16_4k_r_3_4;
always@(*) begin
    if(3'd1<x3)
        edge_dot_16_4k_r_3_1=pixel_left_r_3;
    else
        edge_dot_16_4k_r_3_1=pixel_right_r_3;
end
always@(*) begin
    if(3'd3<x3)
        edge_dot_16_4k_r_3_2=pixel_left_r_3;
    else
        edge_dot_16_4k_r_3_2=pixel_right_r_3;
end
always@(*) begin
    if(3'd5<x3)
        edge_dot_16_4k_r_3_3=pixel_left_r_3;
    else
        edge_dot_16_4k_r_3_3=pixel_right_r_3;
end
always@(*) begin
    if(3'd7<x3)
        edge_dot_16_4k_r_3_4=pixel_left_r_3;
    else
        edge_dot_16_4k_r_3_4=pixel_right_r_3;
end

//第四行
wire    [10:0]   pixel_left_r4       ;
wire    [10:0]   pixel_right_r4      ;
wire    [10:0]   pixel_midle_r4      ;
assign  pixel_left_r4=(dot_9_1k_2_1_ls2+dot_9_1k_2_1)+(dot_9_1k_3_1_ls1+dot_9_1k_3_1);
assign  pixel_right_r4=(dot_9_1k_2_3_ls2+dot_9_1k_2_3)+(dot_9_1k_3_3_ls1+dot_9_1k_3_3);
assign  pixel_midle_r4=(dot_9_1k_2_2_ls2+dot_9_1k_2_2)+(dot_9_1k_3_2_ls1+dot_9_1k_3_2);
//求出第四行左右两边的像素值
wire    [7:0]   pixel_left_r_4       ;
wire    [7:0]   pixel_right_r_4      ;
assign  pixel_left_r_4=pixel_left_r4>>3;
assign  pixel_right_r_4=pixel_right_r4>>3;
//求出左右两边的梯度
reg     [7:0]   d4_left ;
always@(*) begin
    if(pixel_midle_r4>pixel_left_r4)
        d4_left=(pixel_midle_r4-pixel_left_r4)>>3;
    else
        d4_left=(pixel_left_r4-pixel_midle_r4)>>3;
end
reg     [7:0]   d4_right ;
always@(*) begin
    if(pixel_right_r4>pixel_midle_r4)
        d4_right=(pixel_right_r4-pixel_midle_r4)>>3;
    else
        d4_right=(pixel_midle_r4-pixel_right_r4)>>3;
end
//求出1x(d4_left+d4_right),3x(d4_left+d4_right),5x(d4_left+d4_right),7x(d4_left+d4_right)
wire    [10:0]  d4_right_ls3;
wire    [8:0]   d4_right_add_d4_left  ;
wire    [9:0]   three_mul_d4_right_add_d4_left  ;
wire    [10:0]  five_mul_d4_right_add_d4_left  ;
wire    [11:0]  seven_mul_d4_right_add_d4_left  ;

assign  d4_right_ls3=d4_right<<3;
assign  d4_right_add_d4_left=d4_left+d4_right;
assign  three_mul_d4_right_add_d4_left=(d4_right_add_d4_left<<1)+d4_right_add_d4_left;
assign  five_mul_d4_right_add_d4_left=(d4_right_add_d4_left<<2)+d4_right_add_d4_left;
assign  seven_mul_d4_right_add_d4_left=((d4_right_add_d4_left<<2)+(d4_right_add_d4_left<<1))+d4_right_add_d4_left;
//求出跳变点坐标x4
reg     [3:0]   x4;
always@(*) begin
    if(d4_right_ls3>seven_mul_d4_right_add_d4_left)
        x4=4'd8;
    else if(d4_right_ls3>five_mul_d4_right_add_d4_left)
        x4=4'd6;
    else if(d4_right_ls3>three_mul_d4_right_add_d4_left)
        x4=4'd4;
    else if(d4_right_ls3>d4_right_add_d4_left)
        x4=4'd2;
    else
        x4=4'd0;
end
//利用x4和第四行左右两边像素值求出第四行4个点的像素值
reg     [7:0]   edge_dot_16_4k_r_4_1;
reg     [7:0]   edge_dot_16_4k_r_4_2;
reg     [7:0]   edge_dot_16_4k_r_4_3;
reg     [7:0]   edge_dot_16_4k_r_4_4;
always@(*) begin
    if(3'd1<x4)
        edge_dot_16_4k_r_4_1=pixel_left_r_4;
    else
        edge_dot_16_4k_r_4_1=pixel_right_r_4;
end
always@(*) begin
    if(3'd3<x4)
        edge_dot_16_4k_r_4_2=pixel_left_r_4;
    else
        edge_dot_16_4k_r_4_2=pixel_right_r_4;
end
always@(*) begin
    if(3'd5<x4)
        edge_dot_16_4k_r_4_3=pixel_left_r_4;
    else
        edge_dot_16_4k_r_4_3=pixel_right_r_4;
end
always@(*) begin
    if(3'd7<x4)
        edge_dot_16_4k_r_4_4=pixel_left_r_4;
    else
        edge_dot_16_4k_r_4_4=pixel_right_r_4;
end

//竖直方向
//第一列
wire    [10:0]   pixel_up_c1       ;
wire    [10:0]   pixel_down_c1      ;
wire    [10:0]  pixel_midle_c1    ;
assign  pixel_up_c1=(dot_9_1k_1_2_ls2+dot_9_1k_1_2)+(dot_9_1k_1_1_ls1+dot_9_1k_1_1);
assign  pixel_down_c1=(dot_9_1k_3_2_ls2+dot_9_1k_3_2)+(dot_9_1k_3_1_ls1+dot_9_1k_3_1);
assign  pixel_midle_c1=(dot_9_1k_2_2_ls2+dot_9_1k_2_2)+(dot_9_1k_2_1_ls1+dot_9_1k_2_1);
//求出第一列上下两边的像素值
wire    [7:0]   pixel_up_c_1       ;
wire    [7:0]   pixel_down_c_1      ;
assign  pixel_up_c_1=pixel_up_c1>>3;
assign  pixel_down_c_1=pixel_down_c1>>3;
//求出上下两边的梯度
reg     [7:0]   d1_up ;
always@(*) begin
    if(pixel_midle_c1>pixel_up_c1)
        d1_up=(pixel_midle_c1-pixel_up_c1)>>3;
    else
        d1_up=(pixel_up_c1-pixel_midle_c1)>>3;
end
reg     [7:0]   d1_down ;
always@(*) begin
    if(pixel_down_c1>pixel_midle_c1)
        d1_down=(pixel_down_c1-pixel_midle_c1)>>3;
    else
        d1_down=(pixel_midle_c1-pixel_down_c1)>>3;
end
//求出1x(d1_up+d1_down),3x(d1_up+d1_down),5x(d1_up+d1_down),7x(d1_up+d1_down)
wire    [10:0]  d1_down_ls3;
wire    [8:0]   d1_down_add_d1_up  ;
wire    [9:0]   three_mul_d1_down_add_d1_up  ;
wire    [10:0]  five_mul_d1_down_add_d1_up  ;
wire    [11:0]  seven_mul_d1_down_add_d1_up  ;

assign  d1_down_ls3=d1_down<<3;
assign  d1_down_add_d1_up=d1_up+d1_down;
assign  three_mul_d1_down_add_d1_up=(d1_down_add_d1_up<<1)+d1_down_add_d1_up;
assign  five_mul_d1_down_add_d1_up=(d1_down_add_d1_up<<2)+d1_down_add_d1_up;
assign  seven_mul_d1_down_add_d1_up=((d1_down_add_d1_up<<2)+(d1_down_add_d1_up<<1))+d1_down_add_d1_up;
//求出跳变点坐标y1
reg     [3:0]   y1;
always@(*) begin
    if(d1_down_ls3>seven_mul_d1_down_add_d1_up)
        y1=4'd8;
    else if(d1_down_ls3>five_mul_d1_down_add_d1_up)
        y1=4'd6;
    else if(d1_down_ls3>three_mul_d1_down_add_d1_up)
        y1=4'd4;
    else if(d1_down_ls3>d1_down_add_d1_up)
        y1=4'd2;
    else
        y1=4'd0;
end
//利用y1和第一列上下两边像素值求出第一列4个点的像素值
reg     [7:0]   edge_dot_16_4k_c_1_1;
reg     [7:0]   edge_dot_16_4k_c_2_1;
reg     [7:0]   edge_dot_16_4k_c_3_1;
reg     [7:0]   edge_dot_16_4k_c_4_1;
always@(*) begin
    if(3'd1<y1)
        edge_dot_16_4k_c_1_1=pixel_up_c_1;
    else
        edge_dot_16_4k_c_1_1=pixel_down_c_1;
end
always@(*) begin
    if(3'd3<y1)
        edge_dot_16_4k_c_2_1=pixel_up_c_1;
    else
        edge_dot_16_4k_c_2_1=pixel_down_c_1;
end
always@(*) begin
    if(3'd5<y1)
        edge_dot_16_4k_c_3_1=pixel_up_c_1;
    else
        edge_dot_16_4k_c_3_1=pixel_down_c_1;
end
always@(*) begin
    if(3'd7<y1)
        edge_dot_16_4k_c_4_1=pixel_up_c_1;
    else
        edge_dot_16_4k_c_4_1=pixel_down_c_1;
end

//第二列
wire    [10:0]   pixel_up_c2       ;
wire    [10:0]   pixel_down_c2      ;
wire    [10:0]   pixel_midle_c2      ;
assign  pixel_up_c2=(dot_9_1k_1_2_ls2+dot_9_1k_1_2_ls1)+(dot_9_1k_1_2+dot_9_1k_1_1);
assign  pixel_down_c2=(dot_9_1k_3_2_ls2+dot_9_1k_3_2_ls1)+(dot_9_1k_3_2+dot_9_1k_3_1);
assign  pixel_midle_c2=(dot_9_1k_2_2_ls2+dot_9_1k_2_2_ls1)+(dot_9_1k_2_2+dot_9_1k_2_1);
//求出第二列上下两边的像素值
wire    [7:0]   pixel_up_c_2       ;
wire    [7:0]   pixel_down_c_2      ;
assign  pixel_up_c_2=pixel_up_c2>>3;
assign  pixel_down_c_2=pixel_down_c2>>3;
//求出上下两边的梯度
reg     [7:0]   d2_up ;
always@(*) begin
    if(pixel_midle_c2>pixel_up_c2)
        d2_up=(pixel_midle_c2-pixel_up_c2)>>3;
    else
        d2_up=(pixel_up_c2-pixel_midle_c2)>>3;
end
reg     [7:0]   d2_down ;
always@(*) begin
    if(pixel_down_c2>pixel_midle_c2)
        d2_down=(pixel_down_c2-pixel_midle_c2)>>3;
    else
        d2_down=(pixel_midle_c2-pixel_down_c2)>>3;
end
//求出1x(d2_left+d2_right),3x(d2_left+d2_right),5x(d2_left+d2_right),7x(d2_left+d2_right)
wire    [10:0]  d2_down_ls3;
wire    [8:0]   d2_down_add_d2_up  ;
wire    [9:0]   three_mul_d2_down_add_d2_up  ;
wire    [10:0]  five_mul_d2_down_add_d2_up  ;
wire    [11:0]  seven_mul_d2_down_add_d2_up  ;

assign  d2_down_ls3=d2_down<<3;
assign  d2_down_add_d2_up=d2_up+d2_down;
assign  three_mul_d2_down_add_d2_up=(d2_down_add_d2_up<<1)+d2_down_add_d2_up;
assign  five_mul_d2_down_add_d2_up=(d2_down_add_d2_up<<2)+d2_down_add_d2_up;
assign  seven_mul_d2_down_add_d2_up=((d2_down_add_d2_up<<2)+(d2_down_add_d2_up<<1))+d2_down_add_d2_up;
//求出跳变点坐标y2
reg     [3:0]   y2;
always@(*) begin
    if(d2_down_ls3>seven_mul_d2_down_add_d2_up)
        y2=4'd8;
    else if(d2_down_ls3>five_mul_d2_down_add_d2_up)
        y2=4'd6;
    else if(d2_down_ls3>three_mul_d2_down_add_d2_up)
        y2=4'd4;
    else if(d2_down_ls3>d2_down_add_d2_up)
        y2=4'd2;
    else
        y2=4'd0;
end
//利用y2和第二列上下两边像素值求出第二列4个点的像素值
reg     [7:0]   edge_dot_16_4k_c_1_2;
reg     [7:0]   edge_dot_16_4k_c_2_2;
reg     [7:0]   edge_dot_16_4k_c_3_2;
reg     [7:0]   edge_dot_16_4k_c_4_2;
always@(*) begin
    if(3'd1<y2)
        edge_dot_16_4k_c_1_2=pixel_up_c_2;
    else
        edge_dot_16_4k_c_1_2=pixel_down_c_2;
end
always@(*) begin
    if(3'd3<y2)
        edge_dot_16_4k_c_2_2=pixel_up_c_2;
    else
        edge_dot_16_4k_c_2_2=pixel_down_c_2;
end
always@(*) begin
    if(3'd5<y2)
        edge_dot_16_4k_c_3_2=pixel_up_c_2;
    else
        edge_dot_16_4k_c_3_2=pixel_down_c_2;
end
always@(*) begin
    if(3'd7<y2)
        edge_dot_16_4k_c_4_2=pixel_up_c_2;
    else
        edge_dot_16_4k_c_4_2=pixel_down_c_2;
end

//第三列
wire    [10:0]   pixel_up_c3       ;
wire    [10:0]   pixel_down_c3      ;
wire    [10:0]   pixel_midle_c3    ;
assign  pixel_up_c3=(dot_9_1k_1_2_ls2+dot_9_1k_1_2_ls1)+(dot_9_1k_1_2+dot_9_1k_1_3);
assign  pixel_down_c3=(dot_9_1k_3_2_ls2+dot_9_1k_3_2_ls1)+(dot_9_1k_3_2+dot_9_1k_3_3);
assign  pixel_midle_c3=(dot_9_1k_2_2_ls2+dot_9_1k_2_2_ls1)+(dot_9_1k_2_2+dot_9_1k_2_3);
//求出第一行左右两边的像素值
wire    [7:0]   pixel_up_c_3       ;
wire    [7:0]   pixel_down_c_3      ;
assign  pixel_up_c_3=pixel_up_c3>>3;
assign  pixel_down_c_3=pixel_down_c3>>3;
//求出上下两边的梯度
reg     [7:0]   d3_up ;
always@(*) begin
    if(pixel_midle_c3>pixel_up_c3)
        d3_up=(pixel_midle_c3-pixel_up_c3)>>3;
    else
        d3_up=(pixel_up_c3-pixel_midle_c3)>>3;
end
reg     [7:0]   d3_down ;
always@(*) begin
    if(pixel_down_c3>pixel_midle_c3)
        d3_down=(pixel_down_c3-pixel_midle_c3)>>3;
    else
        d3_down=(pixel_midle_c3-pixel_down_c3)>>3;
end
//求出1x(d3_up+d3_down),3x(d3_up+d3_down),5x(d3_up+d3_down),7x(d3_up+d3_down)
wire    [10:0]  d3_down_ls3;
wire    [8:0]   d3_down_add_d3_up  ;
wire    [9:0]   three_mul_d3_down_add_d3_up  ;
wire    [10:0]  five_mul_d3_down_add_d3_up  ;
wire    [11:0]  seven_mul_d3_down_add_d3_up  ;

assign  d3_down_ls3=d3_down<<3;
assign  d3_down_add_d3_up=d3_up+d3_down;
assign  three_mul_d3_down_add_d3_up=(d3_down_add_d3_up<<1)+d3_down_add_d3_up;
assign  five_mul_d3_down_add_d3_up=(d3_down_add_d3_up<<2)+d3_down_add_d3_up;
assign  seven_mul_d3_down_add_d3_up=((d3_down_add_d3_up<<2)+(d3_down_add_d3_up<<1))+d3_down_add_d3_up;
//求出跳变点坐标y3
reg     [3:0]   y3;
always@(*) begin
    if(d3_down_ls3>seven_mul_d3_down_add_d3_up)
        y3=4'd8;
    else if(d3_down_ls3>five_mul_d3_down_add_d3_up)
        y3=4'd6;
    else if(d3_down_ls3>three_mul_d3_down_add_d3_up)
        y3=4'd4;
    else if(d3_down_ls3>d3_down_add_d3_up)
        y3=4'd2;
    else
        y3=4'd0;
end
//利用y3和第三列上下两边像素值求出第三列4个点的像素值
reg     [7:0]   edge_dot_16_4k_c_1_3;
reg     [7:0]   edge_dot_16_4k_c_2_3;
reg     [7:0]   edge_dot_16_4k_c_3_3;
reg     [7:0]   edge_dot_16_4k_c_4_3;
always@(*) begin
    if(3'd1<y3)
        edge_dot_16_4k_c_1_3=pixel_up_c_3;
    else
        edge_dot_16_4k_c_1_3=pixel_down_c_3;
end
always@(*) begin
    if(3'd3<y3)
        edge_dot_16_4k_c_2_3=pixel_up_c_3;
    else
        edge_dot_16_4k_c_2_3=pixel_down_c_3;
end
always@(*) begin
    if(3'd5<y3)
        edge_dot_16_4k_c_3_3=pixel_up_c_3;
    else
        edge_dot_16_4k_c_3_3=pixel_down_c_3;
end
always@(*) begin
    if(3'd7<y3)
        edge_dot_16_4k_c_4_3=pixel_up_c_3;
    else
        edge_dot_16_4k_c_4_3=pixel_down_c_3;
end

//第四列
wire    [10:0]   pixel_up_c4       ;
wire    [10:0]   pixel_down_c4      ;
wire    [10:0]   pixel_midle_c4      ;
assign  pixel_up_c4=(dot_9_1k_1_2_ls2+dot_9_1k_1_2)+(dot_9_1k_1_3_ls1+dot_9_1k_1_3);
assign  pixel_down_c4=(dot_9_1k_3_2_ls2+dot_9_1k_3_2)+(dot_9_1k_3_3_ls1+dot_9_1k_3_3);
assign  pixel_midle_c4=(dot_9_1k_2_2_ls2+dot_9_1k_2_2)+(dot_9_1k_2_3_ls1+dot_9_1k_2_3);
//求出第四列上下两边的像素值
wire    [7:0]   pixel_up_c_4       ;
wire    [7:0]   pixel_down_c_4      ;
assign  pixel_up_c_4=pixel_up_c4>>3;
assign  pixel_down_c_4=pixel_down_c4>>3;
//求出左右两边的梯度
reg     [7:0]   d4_up ;
always@(*) begin
    if(pixel_midle_c4>pixel_up_c4)
        d4_up=(pixel_midle_c4-pixel_up_c4)>>3;
    else
        d4_up=(pixel_up_c4-pixel_midle_c4)>>3;
end
reg     [7:0]   d4_down ;
always@(*) begin
    if(pixel_down_c4>pixel_midle_c4)
        d4_down=(pixel_down_c4-pixel_midle_c4)>>3;
    else
        d4_down=(pixel_midle_c4-pixel_down_c4)>>3;
end
//求出1x(d4_up+d4_down),3x(d4_up+d4_down),5x(d4_up+d4_down),7x(d4_up+d4_down)
wire    [10:0]  d4_down_ls3;
wire    [8:0]   d4_down_add_d4_up  ;
wire    [9:0]   three_mul_d4_down_add_d4_up  ;
wire    [10:0]  five_mul_d4_down_add_d4_up  ;
wire    [11:0]  seven_mul_d4_down_add_d4_up  ;

assign  d4_down_ls3=d4_down<<3;
assign  d4_down_add_d4_up=d4_up+d4_down;
assign  three_mul_d4_down_add_d4_up=(d4_down_add_d4_up<<1)+d4_down_add_d4_up;
assign  five_mul_d4_down_add_d4_up=(d4_down_add_d4_up<<2)+d4_down_add_d4_up;
assign  seven_mul_d4_down_add_d4_up=((d4_down_add_d4_up<<2)+(d4_down_add_d4_up<<1))+d4_down_add_d4_up;
//求出跳变点坐标y4
reg     [3:0]   y4;
always@(*) begin
    if(d4_down_ls3>seven_mul_d4_down_add_d4_up)
        y4=4'd8;
    else if(d4_down_ls3>five_mul_d4_down_add_d4_up)
        y4=4'd6;
    else if(d4_down_ls3>three_mul_d4_down_add_d4_up)
        y4=4'd4;
    else if(d4_down_ls3>d4_down_add_d4_up)
        y4=4'd2;
    else
        y4=4'd0;
end
//利用y4和第四列上下两边像素值求出第四列4个点的像素值
reg     [7:0]   edge_dot_16_4k_c_1_4;
reg     [7:0]   edge_dot_16_4k_c_2_4;
reg     [7:0]   edge_dot_16_4k_c_3_4;
reg     [7:0]   edge_dot_16_4k_c_4_4;
always@(*) begin
    if(3'd1<y4)
        edge_dot_16_4k_c_1_4=pixel_up_c_4;
    else
        edge_dot_16_4k_c_1_4=pixel_down_c_4;
end
always@(*) begin
    if(3'd3<y4)
        edge_dot_16_4k_c_2_4=pixel_up_c_4;
    else
        edge_dot_16_4k_c_2_4=pixel_down_c_4;
end
always@(*) begin
    if(3'd5<y4)
        edge_dot_16_4k_c_3_4=pixel_up_c_4;
    else
        edge_dot_16_4k_c_3_4=pixel_down_c_4;
end
always@(*) begin
    if(3'd7<y4)
        edge_dot_16_4k_c_4_4=pixel_up_c_4;
    else
        edge_dot_16_4k_c_4_4=pixel_down_c_4;
end
//(水平方向+垂直方向)/2
wire    [8:0]   r_add_c_1_1    ;
wire    [8:0]   r_add_c_1_2    ;
wire    [8:0]   r_add_c_1_3    ;
wire    [8:0]   r_add_c_1_4    ;
wire    [8:0]   r_add_c_2_1    ;
wire    [8:0]   r_add_c_2_2    ;
wire    [8:0]   r_add_c_2_3    ;
wire    [8:0]   r_add_c_2_4    ;
wire    [8:0]   r_add_c_3_1    ;
wire    [8:0]   r_add_c_3_2    ;
wire    [8:0]   r_add_c_3_3    ;
wire    [8:0]   r_add_c_3_4    ;
wire    [8:0]   r_add_c_4_1    ;
wire    [8:0]   r_add_c_4_2    ;
wire    [8:0]   r_add_c_4_3    ;
wire    [8:0]   r_add_c_4_4    ;
assign   r_add_c_1_1=edge_dot_16_4k_c_1_1+edge_dot_16_4k_r_1_1  ;
assign   r_add_c_1_2=edge_dot_16_4k_c_1_2+edge_dot_16_4k_r_1_2  ;
assign   r_add_c_1_3=edge_dot_16_4k_c_1_3+edge_dot_16_4k_r_1_3  ;
assign   r_add_c_1_4=edge_dot_16_4k_c_1_4+edge_dot_16_4k_r_1_4  ;
assign   r_add_c_2_1=edge_dot_16_4k_c_2_1+edge_dot_16_4k_r_2_1  ;
assign   r_add_c_2_2=edge_dot_16_4k_c_2_2+edge_dot_16_4k_r_2_2  ;
assign   r_add_c_2_3=edge_dot_16_4k_c_2_3+edge_dot_16_4k_r_2_3  ;
assign   r_add_c_2_4=edge_dot_16_4k_c_2_4+edge_dot_16_4k_r_2_4  ;
assign   r_add_c_3_1=edge_dot_16_4k_c_3_1+edge_dot_16_4k_r_3_1  ;
assign   r_add_c_3_2=edge_dot_16_4k_c_3_2+edge_dot_16_4k_r_3_2  ;
assign   r_add_c_3_3=edge_dot_16_4k_c_3_3+edge_dot_16_4k_r_3_3  ;
assign   r_add_c_3_4=edge_dot_16_4k_c_3_4+edge_dot_16_4k_r_3_4  ;
assign   r_add_c_4_1=edge_dot_16_4k_c_4_1+edge_dot_16_4k_r_4_1  ;
assign   r_add_c_4_2=edge_dot_16_4k_c_4_2+edge_dot_16_4k_r_4_2  ;
assign   r_add_c_4_3=edge_dot_16_4k_c_4_3+edge_dot_16_4k_r_4_3  ;
assign   r_add_c_4_4=edge_dot_16_4k_c_4_4+edge_dot_16_4k_r_4_4  ;
    
assign   edge_dot_16_4k_1_1=r_add_c_1_1>>1 ;
assign   edge_dot_16_4k_1_2=r_add_c_1_2>>1 ;
assign   edge_dot_16_4k_1_3=r_add_c_1_3>>1 ;
assign   edge_dot_16_4k_1_4=r_add_c_1_4>>1 ;
assign   edge_dot_16_4k_2_1=r_add_c_2_1>>1 ;
assign   edge_dot_16_4k_2_2=r_add_c_2_2>>1 ;
assign   edge_dot_16_4k_2_3=r_add_c_2_3>>1 ;
assign   edge_dot_16_4k_2_4=r_add_c_2_4>>1 ;
assign   edge_dot_16_4k_3_1=r_add_c_3_1>>1 ;
assign   edge_dot_16_4k_3_2=r_add_c_3_2>>1 ;
assign   edge_dot_16_4k_3_3=r_add_c_3_3>>1 ;
assign   edge_dot_16_4k_3_4=r_add_c_3_4>>1 ;
assign   edge_dot_16_4k_4_1=r_add_c_4_1>>1 ;
assign   edge_dot_16_4k_4_2=r_add_c_4_2>>1 ;
assign   edge_dot_16_4k_4_3=r_add_c_4_3>>1 ;
assign   edge_dot_16_4k_4_4=r_add_c_4_4>>1 ;

endmodule






