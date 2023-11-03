//进行高斯平滑
module gauss_filter
(
    input   wire    [7:0]   dot_9_4k_1_1            ,//输入4k图片9个点的像素值
    input   wire    [7:0]   dot_9_4k_1_2            ,
    input   wire    [7:0]   dot_9_4k_1_3            ,
    input   wire    [7:0]   dot_9_4k_2_1            ,
    input   wire    [7:0]   dot_9_4k_2_2            ,
    input   wire    [7:0]   dot_9_4k_2_3            ,
    input   wire    [7:0]   dot_9_4k_3_1            ,
    input   wire    [7:0]   dot_9_4k_3_2            ,
    input   wire    [7:0]   dot_9_4k_3_3            ,
    
    output  wire    [7:0]   final_4k_pixel   
);

wire    [8:0]   dot_9_4k_1_2_ls1    ;
assign  dot_9_4k_1_2_ls1=dot_9_4k_1_2<<1;

wire    [8:0]   dot_9_4k_2_1_ls1    ;
assign  dot_9_4k_2_1_ls1=dot_9_4k_2_1<<1;

wire    [9:0]   dot_9_4k_2_2_ls2    ;
assign  dot_9_4k_2_2_ls2=dot_9_4k_2_2<<2;

wire    [8:0]   dot_9_4k_2_3_ls1    ;
assign  dot_9_4k_2_3_ls1=dot_9_4k_2_3<<1;

wire    [8:0]   dot_9_4k_3_2_ls1    ;
assign  dot_9_4k_3_2_ls1=dot_9_4k_3_2<<1;

wire    [11:0]  sum_dot_9_4k        ;
assign  sum_dot_9_4k=(((dot_9_4k_1_1+dot_9_4k_1_2_ls1)+(dot_9_4k_1_3+dot_9_4k_2_1_ls1))+((dot_9_4k_2_2_ls2+
                     dot_9_4k_2_3_ls1)+(dot_9_4k_3_1+dot_9_4k_3_2_ls1)))+dot_9_4k_3_3;
                       
assign  final_4k_pixel=sum_dot_9_4k>>4;

                     
endmodule
