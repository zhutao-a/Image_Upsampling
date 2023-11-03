module gauss_filter_dot_36_4k
(
    input   wire            sys_clk                 ,
    input   wire    [7:0]   dot_36_4k_1_1            ,
    input   wire    [7:0]   dot_36_4k_1_2            ,
    input   wire    [7:0]   dot_36_4k_1_3            ,
    input   wire    [7:0]   dot_36_4k_1_4            ,
    input   wire    [7:0]   dot_36_4k_1_5            ,
    input   wire    [7:0]   dot_36_4k_1_6            ,
    input   wire    [7:0]   dot_36_4k_2_1            ,
    input   wire    [7:0]   dot_36_4k_2_2            ,
    input   wire    [7:0]   dot_36_4k_2_3            ,
    input   wire    [7:0]   dot_36_4k_2_4            ,
    input   wire    [7:0]   dot_36_4k_2_5            ,
    input   wire    [7:0]   dot_36_4k_2_6            ,
    input   wire    [7:0]   dot_36_4k_3_1            ,
    input   wire    [7:0]   dot_36_4k_3_2            ,
    input   wire    [7:0]   dot_36_4k_3_3            ,
    input   wire    [7:0]   dot_36_4k_3_4            ,
    input   wire    [7:0]   dot_36_4k_3_5            ,
    input   wire    [7:0]   dot_36_4k_3_6            ,
    input   wire    [7:0]   dot_36_4k_4_1            ,
    input   wire    [7:0]   dot_36_4k_4_2            ,
    input   wire    [7:0]   dot_36_4k_4_3            ,
    input   wire    [7:0]   dot_36_4k_4_4            ,
    input   wire    [7:0]   dot_36_4k_4_5            ,
    input   wire    [7:0]   dot_36_4k_4_6            ,
    input   wire    [7:0]   dot_36_4k_5_1            ,
    input   wire    [7:0]   dot_36_4k_5_2            ,
    input   wire    [7:0]   dot_36_4k_5_3            ,
    input   wire    [7:0]   dot_36_4k_5_4            ,
    input   wire    [7:0]   dot_36_4k_5_5            ,
    input   wire    [7:0]   dot_36_4k_5_6            ,
    input   wire    [7:0]   dot_36_4k_6_1            ,
    input   wire    [7:0]   dot_36_4k_6_2            ,
    input   wire    [7:0]   dot_36_4k_6_3            ,
    input   wire    [7:0]   dot_36_4k_6_4            ,
    input   wire    [7:0]   dot_36_4k_6_5            ,
    input   wire    [7:0]   dot_36_4k_6_6            ,
    
    input   wire    [7:0]   average                  ,//平均值

    output  wire    [7:0]   final_4k_pixel_1_1       , 
    output  wire    [7:0]   final_4k_pixel_1_2       , 
    output  wire    [7:0]   final_4k_pixel_1_3       , 
    output  wire    [7:0]   final_4k_pixel_1_4       ,
    output  wire    [7:0]   final_4k_pixel_2_1       , 
    output  wire    [7:0]   final_4k_pixel_2_2       , 
    output  wire    [7:0]   final_4k_pixel_2_3       , 
    output  wire    [7:0]   final_4k_pixel_2_4       ,
    output  wire    [7:0]   final_4k_pixel_3_1       , 
    output  wire    [7:0]   final_4k_pixel_3_2       , 
    output  wire    [7:0]   final_4k_pixel_3_3       , 
    output  wire    [7:0]   final_4k_pixel_3_4       ,
    output  wire    [7:0]   final_4k_pixel_4_1       , 
    output  wire    [7:0]   final_4k_pixel_4_2       , 
    output  wire    [7:0]   final_4k_pixel_4_3       , 
    output  wire    [7:0]   final_4k_pixel_4_4       
);

wire    [7:0]   _4k_pixel_1_1  ;
wire    [7:0]   _4k_pixel_1_2  ;
wire    [7:0]   _4k_pixel_1_3  ;
wire    [7:0]   _4k_pixel_1_4  ;
wire    [7:0]   _4k_pixel_2_1  ;
wire    [7:0]   _4k_pixel_2_2  ;
wire    [7:0]   _4k_pixel_2_3  ;
wire    [7:0]   _4k_pixel_2_4  ;
wire    [7:0]   _4k_pixel_3_1  ;
wire    [7:0]   _4k_pixel_3_2  ;
wire    [7:0]   _4k_pixel_3_3  ;
wire    [7:0]   _4k_pixel_3_4  ;
wire    [7:0]   _4k_pixel_4_1  ;
wire    [7:0]   _4k_pixel_4_2  ;
wire    [7:0]   _4k_pixel_4_3  ;
wire    [7:0]   _4k_pixel_4_4  ;
//高斯平滑
gauss_filter gauss_filter_inst0
(
    .dot_9_4k_1_1  (dot_36_4k_1_1)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_1_2)       ,
    .dot_9_4k_1_3  (dot_36_4k_1_3)       ,
    .dot_9_4k_2_1  (dot_36_4k_2_1)       ,
    .dot_9_4k_2_2  (dot_36_4k_2_2)       ,
    .dot_9_4k_2_3  (dot_36_4k_2_3)       ,
    .dot_9_4k_3_1  (dot_36_4k_3_1)       ,
    .dot_9_4k_3_2  (dot_36_4k_3_2)       ,
    .dot_9_4k_3_3  (dot_36_4k_3_3)       ,
   
    .final_4k_pixel(_4k_pixel_1_1)
);
gauss_filter gauss_filter_inst1
(
    .dot_9_4k_1_1  (dot_36_4k_1_2)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_1_3)       ,
    .dot_9_4k_1_3  (dot_36_4k_1_4)       ,
    .dot_9_4k_2_1  (dot_36_4k_2_2)       ,
    .dot_9_4k_2_2  (dot_36_4k_2_3)       ,
    .dot_9_4k_2_3  (dot_36_4k_2_4)       ,
    .dot_9_4k_3_1  (dot_36_4k_3_2)       ,
    .dot_9_4k_3_2  (dot_36_4k_3_3)       ,
    .dot_9_4k_3_3  (dot_36_4k_3_4)       ,
   
    .final_4k_pixel(_4k_pixel_1_2)
);
gauss_filter gauss_filter_inst2
(
    .dot_9_4k_1_1  (dot_36_4k_1_3)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_1_4)       ,
    .dot_9_4k_1_3  (dot_36_4k_1_5)       ,
    .dot_9_4k_2_1  (dot_36_4k_2_3)       ,
    .dot_9_4k_2_2  (dot_36_4k_2_4)       ,
    .dot_9_4k_2_3  (dot_36_4k_2_5)       ,
    .dot_9_4k_3_1  (dot_36_4k_3_3)       ,
    .dot_9_4k_3_2  (dot_36_4k_3_4)       ,
    .dot_9_4k_3_3  (dot_36_4k_3_5)       ,
   
    .final_4k_pixel(_4k_pixel_1_3)
);
gauss_filter gauss_filter_inst3
(
    .dot_9_4k_1_1  (dot_36_4k_1_4)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_1_5)       ,
    .dot_9_4k_1_3  (dot_36_4k_1_6)       ,
    .dot_9_4k_2_1  (dot_36_4k_2_4)       ,
    .dot_9_4k_2_2  (dot_36_4k_2_5)       ,
    .dot_9_4k_2_3  (dot_36_4k_2_6)       ,
    .dot_9_4k_3_1  (dot_36_4k_3_4)       ,
    .dot_9_4k_3_2  (dot_36_4k_3_5)       ,
    .dot_9_4k_3_3  (dot_36_4k_3_6)       ,
   
    .final_4k_pixel(_4k_pixel_1_4)
);
gauss_filter gauss_filter_inst4
(
    .dot_9_4k_1_1  (dot_36_4k_2_1)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_2_2)       ,
    .dot_9_4k_1_3  (dot_36_4k_2_3)       ,
    .dot_9_4k_2_1  (dot_36_4k_3_1)       ,
    .dot_9_4k_2_2  (dot_36_4k_3_2)       ,
    .dot_9_4k_2_3  (dot_36_4k_3_3)       ,
    .dot_9_4k_3_1  (dot_36_4k_4_1)       ,
    .dot_9_4k_3_2  (dot_36_4k_4_2)       ,
    .dot_9_4k_3_3  (dot_36_4k_4_3)       ,
   
    .final_4k_pixel(_4k_pixel_2_1)
);
gauss_filter gauss_filter_inst5
(
    .dot_9_4k_1_1  (dot_36_4k_2_2)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_2_3)       ,
    .dot_9_4k_1_3  (dot_36_4k_2_4)       ,
    .dot_9_4k_2_1  (dot_36_4k_3_2)       ,
    .dot_9_4k_2_2  (dot_36_4k_3_3)       ,
    .dot_9_4k_2_3  (dot_36_4k_3_4)       ,
    .dot_9_4k_3_1  (dot_36_4k_4_2)       ,
    .dot_9_4k_3_2  (dot_36_4k_4_3)       ,
    .dot_9_4k_3_3  (dot_36_4k_4_4)       ,
   
    .final_4k_pixel(_4k_pixel_2_2)
);
gauss_filter gauss_filter_inst6
(
    .dot_9_4k_1_1  (dot_36_4k_2_3)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_2_4)       ,
    .dot_9_4k_1_3  (dot_36_4k_2_5)       ,
    .dot_9_4k_2_1  (dot_36_4k_3_3)       ,
    .dot_9_4k_2_2  (dot_36_4k_3_4)       ,
    .dot_9_4k_2_3  (dot_36_4k_3_5)       ,
    .dot_9_4k_3_1  (dot_36_4k_4_3)       ,
    .dot_9_4k_3_2  (dot_36_4k_4_4)       ,
    .dot_9_4k_3_3  (dot_36_4k_4_5)       ,
   
    .final_4k_pixel(_4k_pixel_2_3)
);
gauss_filter gauss_filter_inst7
(
    .dot_9_4k_1_1  (dot_36_4k_2_4)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_2_5)       ,
    .dot_9_4k_1_3  (dot_36_4k_2_6)       ,
    .dot_9_4k_2_1  (dot_36_4k_3_4)       ,
    .dot_9_4k_2_2  (dot_36_4k_3_5)       ,
    .dot_9_4k_2_3  (dot_36_4k_3_6)       ,
    .dot_9_4k_3_1  (dot_36_4k_4_4)       ,
    .dot_9_4k_3_2  (dot_36_4k_4_5)       ,
    .dot_9_4k_3_3  (dot_36_4k_4_6)       ,
   
    .final_4k_pixel(_4k_pixel_2_4)
);
gauss_filter gauss_filter_inst8
(
    .dot_9_4k_1_1  (dot_36_4k_3_1)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_3_2)       ,
    .dot_9_4k_1_3  (dot_36_4k_3_3)       ,
    .dot_9_4k_2_1  (dot_36_4k_4_1)       ,
    .dot_9_4k_2_2  (dot_36_4k_4_2)       ,
    .dot_9_4k_2_3  (dot_36_4k_4_3)       ,
    .dot_9_4k_3_1  (dot_36_4k_5_1)       ,
    .dot_9_4k_3_2  (dot_36_4k_5_2)       ,
    .dot_9_4k_3_3  (dot_36_4k_5_3)       ,
   
    .final_4k_pixel(_4k_pixel_3_1)
);
gauss_filter gauss_filter_inst9
(
    .dot_9_4k_1_1  (dot_36_4k_3_2)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_3_3)       ,
    .dot_9_4k_1_3  (dot_36_4k_3_4)       ,
    .dot_9_4k_2_1  (dot_36_4k_4_2)       ,
    .dot_9_4k_2_2  (dot_36_4k_4_3)       ,
    .dot_9_4k_2_3  (dot_36_4k_4_4)       ,
    .dot_9_4k_3_1  (dot_36_4k_5_2)       ,
    .dot_9_4k_3_2  (dot_36_4k_5_3)       ,
    .dot_9_4k_3_3  (dot_36_4k_5_4)       ,
   
    .final_4k_pixel(_4k_pixel_3_2)
);
gauss_filter gauss_filter_inst10
(
    .dot_9_4k_1_1  (dot_36_4k_3_3)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_3_4)       ,
    .dot_9_4k_1_3  (dot_36_4k_3_5)       ,
    .dot_9_4k_2_1  (dot_36_4k_4_3)       ,
    .dot_9_4k_2_2  (dot_36_4k_4_4)       ,
    .dot_9_4k_2_3  (dot_36_4k_4_5)       ,
    .dot_9_4k_3_1  (dot_36_4k_5_3)       ,
    .dot_9_4k_3_2  (dot_36_4k_5_4)       ,
    .dot_9_4k_3_3  (dot_36_4k_5_5)       ,
   
    .final_4k_pixel(_4k_pixel_3_3)
);
gauss_filter gauss_filter_inst11
(
    .dot_9_4k_1_1  (dot_36_4k_3_4)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_3_5)       ,
    .dot_9_4k_1_3  (dot_36_4k_3_6)       ,
    .dot_9_4k_2_1  (dot_36_4k_4_4)       ,
    .dot_9_4k_2_2  (dot_36_4k_4_5)       ,
    .dot_9_4k_2_3  (dot_36_4k_4_6)       ,
    .dot_9_4k_3_1  (dot_36_4k_5_4)       ,
    .dot_9_4k_3_2  (dot_36_4k_5_5)       ,
    .dot_9_4k_3_3  (dot_36_4k_5_6)       ,
   
    .final_4k_pixel(_4k_pixel_3_4)
);
gauss_filter gauss_filter_inst12
(
    .dot_9_4k_1_1  (dot_36_4k_4_1)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_4_2)       ,
    .dot_9_4k_1_3  (dot_36_4k_4_3)       ,
    .dot_9_4k_2_1  (dot_36_4k_5_1)       ,
    .dot_9_4k_2_2  (dot_36_4k_5_2)       ,
    .dot_9_4k_2_3  (dot_36_4k_5_3)       ,
    .dot_9_4k_3_1  (dot_36_4k_6_1)       ,
    .dot_9_4k_3_2  (dot_36_4k_6_2)       ,
    .dot_9_4k_3_3  (dot_36_4k_6_3)       ,
   
    .final_4k_pixel(_4k_pixel_4_1)
);
gauss_filter gauss_filter_inst13
(
    .dot_9_4k_1_1  (dot_36_4k_4_2)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_4_3)       ,
    .dot_9_4k_1_3  (dot_36_4k_4_4)       ,
    .dot_9_4k_2_1  (dot_36_4k_5_2)       ,
    .dot_9_4k_2_2  (dot_36_4k_5_3)       ,
    .dot_9_4k_2_3  (dot_36_4k_5_4)       ,
    .dot_9_4k_3_1  (dot_36_4k_6_2)       ,
    .dot_9_4k_3_2  (dot_36_4k_6_3)       ,
    .dot_9_4k_3_3  (dot_36_4k_6_4)       ,
   
    .final_4k_pixel(_4k_pixel_4_2)
);
gauss_filter gauss_filter_inst14
(
    .dot_9_4k_1_1  (dot_36_4k_4_3)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_4_4)       ,
    .dot_9_4k_1_3  (dot_36_4k_4_5)       ,
    .dot_9_4k_2_1  (dot_36_4k_5_3)       ,
    .dot_9_4k_2_2  (dot_36_4k_5_4)       ,
    .dot_9_4k_2_3  (dot_36_4k_5_5)       ,
    .dot_9_4k_3_1  (dot_36_4k_6_3)       ,
    .dot_9_4k_3_2  (dot_36_4k_6_4)       ,
    .dot_9_4k_3_3  (dot_36_4k_6_5)       ,
   
    .final_4k_pixel(_4k_pixel_4_3)
);
gauss_filter gauss_filter_inst15
(
    .dot_9_4k_1_1  (dot_36_4k_4_4)       ,//输入4k图片9个点的像素值
    .dot_9_4k_1_2  (dot_36_4k_4_5)       ,
    .dot_9_4k_1_3  (dot_36_4k_4_6)       ,
    .dot_9_4k_2_1  (dot_36_4k_5_4)       ,
    .dot_9_4k_2_2  (dot_36_4k_5_5)       ,
    .dot_9_4k_2_3  (dot_36_4k_5_6)       ,
    .dot_9_4k_3_1  (dot_36_4k_6_4)       ,
    .dot_9_4k_3_2  (dot_36_4k_6_5)       ,
    .dot_9_4k_3_3  (dot_36_4k_6_6)       ,
   
    .final_4k_pixel(_4k_pixel_4_4)
);

reg [7:0]   d_4k_pixel_1_1  ;
reg [7:0]   d_4k_pixel_1_2  ;
reg [7:0]   d_4k_pixel_1_3  ;
reg [7:0]   d_4k_pixel_1_4  ;
reg [7:0]   d_4k_pixel_2_1  ;
reg [7:0]   d_4k_pixel_2_2  ;
reg [7:0]   d_4k_pixel_2_3  ;
reg [7:0]   d_4k_pixel_2_4  ;
reg [7:0]   d_4k_pixel_3_1  ;
reg [7:0]   d_4k_pixel_3_2  ;
reg [7:0]   d_4k_pixel_3_3  ;
reg [7:0]   d_4k_pixel_3_4  ;
reg [7:0]   d_4k_pixel_4_1  ;
reg [7:0]   d_4k_pixel_4_2  ;
reg [7:0]   d_4k_pixel_4_3  ;
reg [7:0]   d_4k_pixel_4_4  ;
reg [7:0]   d_average       ;
always@(posedge sys_clk) begin
    d_4k_pixel_1_1<=_4k_pixel_1_1 ;
    d_4k_pixel_1_2<=_4k_pixel_1_2 ;
    d_4k_pixel_1_3<=_4k_pixel_1_3 ;
    d_4k_pixel_1_4<=_4k_pixel_1_4 ;
    d_4k_pixel_2_1<=_4k_pixel_2_1 ;
    d_4k_pixel_2_2<=_4k_pixel_2_2 ;
    d_4k_pixel_2_3<=_4k_pixel_2_3 ;
    d_4k_pixel_2_4<=_4k_pixel_2_4 ;
    d_4k_pixel_3_1<=_4k_pixel_3_1 ;
    d_4k_pixel_3_2<=_4k_pixel_3_2 ;
    d_4k_pixel_3_3<=_4k_pixel_3_3 ;
    d_4k_pixel_3_4<=_4k_pixel_3_4 ;
    d_4k_pixel_4_1<=_4k_pixel_4_1 ;
    d_4k_pixel_4_2<=_4k_pixel_4_2 ;
    d_4k_pixel_4_3<=_4k_pixel_4_3 ;
    d_4k_pixel_4_4<=_4k_pixel_4_4 ;
    d_average     <=average ;
end

average_adjust_16point average_adjust_16point_inst
(
    .dot_16_4k_1_1       (d_4k_pixel_1_1)     ,//输入4k图片16个点的像素值
    .dot_16_4k_1_2       (d_4k_pixel_1_2)     ,
    .dot_16_4k_1_3       (d_4k_pixel_1_3)     ,
    .dot_16_4k_1_4       (d_4k_pixel_1_4)     ,
    .dot_16_4k_2_1       (d_4k_pixel_2_1)     ,
    .dot_16_4k_2_2       (d_4k_pixel_2_2)     ,
    .dot_16_4k_2_3       (d_4k_pixel_2_3)     ,
    .dot_16_4k_2_4       (d_4k_pixel_2_4)     ,
    .dot_16_4k_3_1       (d_4k_pixel_3_1)     ,
    .dot_16_4k_3_2       (d_4k_pixel_3_2)     ,
    .dot_16_4k_3_3       (d_4k_pixel_3_3)     ,
    .dot_16_4k_3_4       (d_4k_pixel_3_4)     ,
    .dot_16_4k_4_1       (d_4k_pixel_4_1)     ,
    .dot_16_4k_4_2       (d_4k_pixel_4_2)     ,
    .dot_16_4k_4_3       (d_4k_pixel_4_3)     ,
    .dot_16_4k_4_4       (d_4k_pixel_4_4)     ,
    
    .average             (d_average)     ,//平均值
    
    .adjust_dot_16_4k_1_1(final_4k_pixel_1_1)     ,//输出9点中件点对应4k图片的像素值
    .adjust_dot_16_4k_1_2(final_4k_pixel_1_2)     ,
    .adjust_dot_16_4k_1_3(final_4k_pixel_1_3)     ,
    .adjust_dot_16_4k_1_4(final_4k_pixel_1_4)     ,
    .adjust_dot_16_4k_2_1(final_4k_pixel_2_1)     ,
    .adjust_dot_16_4k_2_2(final_4k_pixel_2_2)     ,
    .adjust_dot_16_4k_2_3(final_4k_pixel_2_3)     ,
    .adjust_dot_16_4k_2_4(final_4k_pixel_2_4)     ,
    .adjust_dot_16_4k_3_1(final_4k_pixel_3_1)     ,
    .adjust_dot_16_4k_3_2(final_4k_pixel_3_2)     ,
    .adjust_dot_16_4k_3_3(final_4k_pixel_3_3)     ,
    .adjust_dot_16_4k_3_4(final_4k_pixel_3_4)     ,
    .adjust_dot_16_4k_4_1(final_4k_pixel_4_1)     ,
    .adjust_dot_16_4k_4_2(final_4k_pixel_4_2)     ,
    .adjust_dot_16_4k_4_3(final_4k_pixel_4_3)     ,
    .adjust_dot_16_4k_4_4(final_4k_pixel_4_4)     
);


endmodule








