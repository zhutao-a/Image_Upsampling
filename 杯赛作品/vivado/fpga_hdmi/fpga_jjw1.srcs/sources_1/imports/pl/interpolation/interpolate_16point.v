//最终的根据9点求出中间一点对应4k图像16点的插值函数
module interpolate_16point
(
    input   wire            sys_clk                 ,
    input   wire    [7:0]   dot_9_1k_1_1            ,//输入1k图片9个点的像素值
    input   wire    [7:0]   dot_9_1k_1_2            ,
    input   wire    [7:0]   dot_9_1k_1_3            ,
    input   wire    [7:0]   dot_9_1k_2_1            ,
    input   wire    [7:0]   dot_9_1k_2_2            ,
    input   wire    [7:0]   dot_9_1k_2_3            ,
    input   wire    [7:0]   dot_9_1k_3_1            ,
    input   wire    [7:0]   dot_9_1k_3_2            ,
    input   wire    [7:0]   dot_9_1k_3_3            ,
    
    output  wire    [7:0]   final_dot_16_4k_1_1    ,////输出9点的中间点对应4k图片的像素值
    output  wire    [7:0]   final_dot_16_4k_1_2    ,
    output  wire    [7:0]   final_dot_16_4k_1_3    ,
    output  wire    [7:0]   final_dot_16_4k_1_4    ,
    output  wire    [7:0]   final_dot_16_4k_2_1    ,
    output  wire    [7:0]   final_dot_16_4k_2_2    ,
    output  wire    [7:0]   final_dot_16_4k_2_3    ,
    output  wire    [7:0]   final_dot_16_4k_2_4    ,
    output  wire    [7:0]   final_dot_16_4k_3_1    ,
    output  wire    [7:0]   final_dot_16_4k_3_2    ,
    output  wire    [7:0]   final_dot_16_4k_3_3    ,
    output  wire    [7:0]   final_dot_16_4k_3_4    ,
    output  wire    [7:0]   final_dot_16_4k_4_1    ,
    output  wire    [7:0]   final_dot_16_4k_4_2    ,
    output  wire    [7:0]   final_dot_16_4k_4_3    ,
    output  wire    [7:0]   final_dot_16_4k_4_4    
);

wire    [7:0]   edge_dot_16_4k_1_1     ;
wire    [7:0]   edge_dot_16_4k_1_2     ;
wire    [7:0]   edge_dot_16_4k_1_3     ;
wire    [7:0]   edge_dot_16_4k_1_4     ;
wire    [7:0]   edge_dot_16_4k_2_1     ;
wire    [7:0]   edge_dot_16_4k_2_2     ;
wire    [7:0]   edge_dot_16_4k_2_3     ;
wire    [7:0]   edge_dot_16_4k_2_4     ;
wire    [7:0]   edge_dot_16_4k_3_1     ;
wire    [7:0]   edge_dot_16_4k_3_2     ;
wire    [7:0]   edge_dot_16_4k_3_3     ;
wire    [7:0]   edge_dot_16_4k_3_4     ;
wire    [7:0]   edge_dot_16_4k_4_1     ;
wire    [7:0]   edge_dot_16_4k_4_2     ;
wire    [7:0]   edge_dot_16_4k_4_3     ;
wire    [7:0]   edge_dot_16_4k_4_4     ;

edge_16_generate edge_16_generate_inst
(
    .dot_9_1k_1_1      (dot_9_1k_1_1      )     ,//输入1k图片9个点的像素值
    .dot_9_1k_1_2      (dot_9_1k_1_2      )     ,
    .dot_9_1k_1_3      (dot_9_1k_1_3      )     ,
    .dot_9_1k_2_1      (dot_9_1k_2_1      )     ,
    .dot_9_1k_2_2      (dot_9_1k_2_2      )     ,
    .dot_9_1k_2_3      (dot_9_1k_2_3      )     ,
    .dot_9_1k_3_1      (dot_9_1k_3_1      )     ,
    .dot_9_1k_3_2      (dot_9_1k_3_2      )     ,
    .dot_9_1k_3_3      (dot_9_1k_3_3      )     ,
                      
    .edge_dot_16_4k_1_1(edge_dot_16_4k_1_1)   ,//输出9点中件点对应4k图片的像素值
    .edge_dot_16_4k_1_2(edge_dot_16_4k_1_2)   ,
    .edge_dot_16_4k_1_3(edge_dot_16_4k_1_3)   ,
    .edge_dot_16_4k_1_4(edge_dot_16_4k_1_4)   ,
    .edge_dot_16_4k_2_1(edge_dot_16_4k_2_1)   ,
    .edge_dot_16_4k_2_2(edge_dot_16_4k_2_2)   ,
    .edge_dot_16_4k_2_3(edge_dot_16_4k_2_3)   ,
    .edge_dot_16_4k_2_4(edge_dot_16_4k_2_4)   ,
    .edge_dot_16_4k_3_1(edge_dot_16_4k_3_1)   ,
    .edge_dot_16_4k_3_2(edge_dot_16_4k_3_2)   ,
    .edge_dot_16_4k_3_3(edge_dot_16_4k_3_3)   ,
    .edge_dot_16_4k_3_4(edge_dot_16_4k_3_4)   ,
    .edge_dot_16_4k_4_1(edge_dot_16_4k_4_1)   ,
    .edge_dot_16_4k_4_2(edge_dot_16_4k_4_2)   ,
    .edge_dot_16_4k_4_3(edge_dot_16_4k_4_3)   ,
    .edge_dot_16_4k_4_4(edge_dot_16_4k_4_4)   
);

reg [7:0]   d_edge_dot_16_4k_1_1  ;
reg [7:0]   d_edge_dot_16_4k_1_2  ;
reg [7:0]   d_edge_dot_16_4k_1_3  ;
reg [7:0]   d_edge_dot_16_4k_1_4  ;
reg [7:0]   d_edge_dot_16_4k_2_1  ;
reg [7:0]   d_edge_dot_16_4k_2_2  ;
reg [7:0]   d_edge_dot_16_4k_2_3  ;
reg [7:0]   d_edge_dot_16_4k_2_4  ;
reg [7:0]   d_edge_dot_16_4k_3_1  ;
reg [7:0]   d_edge_dot_16_4k_3_2  ;
reg [7:0]   d_edge_dot_16_4k_3_3  ;
reg [7:0]   d_edge_dot_16_4k_3_4  ;
reg [7:0]   d_edge_dot_16_4k_4_1  ;
reg [7:0]   d_edge_dot_16_4k_4_2  ;
reg [7:0]   d_edge_dot_16_4k_4_3  ;
reg [7:0]   d_edge_dot_16_4k_4_4  ;
reg [7:0]   d_dot_9_1k_2_2        ;
always@(posedge sys_clk) begin
    d_edge_dot_16_4k_1_1<=edge_dot_16_4k_1_1 ;
    d_edge_dot_16_4k_1_2<=edge_dot_16_4k_1_2 ;
    d_edge_dot_16_4k_1_3<=edge_dot_16_4k_1_3 ;
    d_edge_dot_16_4k_1_4<=edge_dot_16_4k_1_4 ;
    d_edge_dot_16_4k_2_1<=edge_dot_16_4k_2_1 ;
    d_edge_dot_16_4k_2_2<=edge_dot_16_4k_2_2 ;
    d_edge_dot_16_4k_2_3<=edge_dot_16_4k_2_3 ;
    d_edge_dot_16_4k_2_4<=edge_dot_16_4k_2_4 ;
    d_edge_dot_16_4k_3_1<=edge_dot_16_4k_3_1 ;
    d_edge_dot_16_4k_3_2<=edge_dot_16_4k_3_2 ;
    d_edge_dot_16_4k_3_3<=edge_dot_16_4k_3_3 ;
    d_edge_dot_16_4k_3_4<=edge_dot_16_4k_3_4 ;
    d_edge_dot_16_4k_4_1<=edge_dot_16_4k_4_1 ;
    d_edge_dot_16_4k_4_2<=edge_dot_16_4k_4_2 ;
    d_edge_dot_16_4k_4_3<=edge_dot_16_4k_4_3 ;
    d_edge_dot_16_4k_4_4<=edge_dot_16_4k_4_4 ;
    d_dot_9_1k_2_2      <=dot_9_1k_2_2 ;
end

average_adjust_16point average_adjust_16point_inst
(
    .dot_16_4k_1_1       (d_edge_dot_16_4k_1_1)     ,//输入4k图片16个点的像素值
    .dot_16_4k_1_2       (d_edge_dot_16_4k_1_2)     ,
    .dot_16_4k_1_3       (d_edge_dot_16_4k_1_3)     ,
    .dot_16_4k_1_4       (d_edge_dot_16_4k_1_4)     ,
    .dot_16_4k_2_1       (d_edge_dot_16_4k_2_1)     ,
    .dot_16_4k_2_2       (d_edge_dot_16_4k_2_2)     ,
    .dot_16_4k_2_3       (d_edge_dot_16_4k_2_3)     ,
    .dot_16_4k_2_4       (d_edge_dot_16_4k_2_4)     ,
    .dot_16_4k_3_1       (d_edge_dot_16_4k_3_1)     ,
    .dot_16_4k_3_2       (d_edge_dot_16_4k_3_2)     ,
    .dot_16_4k_3_3       (d_edge_dot_16_4k_3_3)     ,
    .dot_16_4k_3_4       (d_edge_dot_16_4k_3_4)     ,
    .dot_16_4k_4_1       (d_edge_dot_16_4k_4_1)     ,
    .dot_16_4k_4_2       (d_edge_dot_16_4k_4_2)     ,
    .dot_16_4k_4_3       (d_edge_dot_16_4k_4_3)     ,
    .dot_16_4k_4_4       (d_edge_dot_16_4k_4_4)     ,
                          
    .average             (d_dot_9_1k_2_2      )     ,//平均值
                          
    .adjust_dot_16_4k_1_1(final_dot_16_4k_1_1)     ,//输出9点中件点对应4k图片的像素值
    .adjust_dot_16_4k_1_2(final_dot_16_4k_1_2)     ,
    .adjust_dot_16_4k_1_3(final_dot_16_4k_1_3)     ,
    .adjust_dot_16_4k_1_4(final_dot_16_4k_1_4)     ,
    .adjust_dot_16_4k_2_1(final_dot_16_4k_2_1)     ,
    .adjust_dot_16_4k_2_2(final_dot_16_4k_2_2)     ,
    .adjust_dot_16_4k_2_3(final_dot_16_4k_2_3)     ,
    .adjust_dot_16_4k_2_4(final_dot_16_4k_2_4)     ,
    .adjust_dot_16_4k_3_1(final_dot_16_4k_3_1)     ,
    .adjust_dot_16_4k_3_2(final_dot_16_4k_3_2)     ,
    .adjust_dot_16_4k_3_3(final_dot_16_4k_3_3)     ,
    .adjust_dot_16_4k_3_4(final_dot_16_4k_3_4)     ,
    .adjust_dot_16_4k_4_1(final_dot_16_4k_4_1)     ,
    .adjust_dot_16_4k_4_2(final_dot_16_4k_4_2)     ,
    .adjust_dot_16_4k_4_3(final_dot_16_4k_4_3)     ,
    .adjust_dot_16_4k_4_4(final_dot_16_4k_4_4)     
);


endmodule
