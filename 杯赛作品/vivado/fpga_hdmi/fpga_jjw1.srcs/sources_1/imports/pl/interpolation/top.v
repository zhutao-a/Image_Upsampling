module top
(
    input   wire                    sys_clk                 ,
    input   wire                    sys_rst_n               ,
    input   wire    [9:0]           col_num                 ,
    input   wire    [9:0]           row_num                 ,
    input   wire    [5*8*3-1:0]     datain                  ,//二维图像一列的元素最上边像素位于该变量的高地址
    input   wire                    receive_flag            ,     

    output  wire                    send_flag               ,
    output  wire    [16*8*3-1:0]    dataout     
);

wire [5*8-1:0] datain_b;
wire [5*8-1:0] datain_g;
wire [5*8-1:0] datain_r;

assign  datain_b={datain[4*24+23:4*24+16],
                  datain[3*24+23:3*24+16],
                  datain[2*24+23:2*24+16],
                  datain[1*24+23:1*24+16],
                  datain[0*24+23:0*24+16]};
assign  datain_g={datain[4*24+15:4*24+8],
                  datain[3*24+15:3*24+8],
                  datain[2*24+15:2*24+8],
                  datain[1*24+15:1*24+8],
                  datain[0*24+15:0*24+8]};
assign  datain_r={datain[4*24+7:4*24],
                  datain[3*24+7:3*24],
                  datain[2*24+7:2*24],
                  datain[1*24+7:1*24],
                  datain[0*24+7:0*24]};

wire [16*8-1:0] dataout_b;
wire [16*8-1:0] dataout_g;
wire [16*8-1:0] dataout_r;

single_color_top single_color_top_b
(
    .sys_clk             (sys_clk             )    ,
    .sys_rst_n           (sys_rst_n           )    ,
    .col_num             (col_num             )    ,
    .row_num             (row_num             )    ,
    .single_color_datain (datain_b )    ,//二维图像一列的元素最上边像素位于该变量的高地址
    .receive_flag        (receive_flag        )    ,     
                          
    .send_flag           (           )    ,
    .single_color_dataout(dataout_b)      
);
single_color_top single_color_top_g
(
    .sys_clk             (sys_clk             )    ,
    .sys_rst_n           (sys_rst_n           )    ,
    .col_num             (col_num             )    ,
    .row_num             (row_num             )    ,
    .single_color_datain (datain_g )    ,//二维图像一列的元素最上边像素位于该变量的高地址
    .receive_flag        (receive_flag        )    ,     
                          
    .send_flag           (           )    ,
    .single_color_dataout(dataout_g)      
);
single_color_top single_color_top_r
(
    .sys_clk             (sys_clk             )    ,
    .sys_rst_n           (sys_rst_n           )    ,
    .col_num             (col_num             )    ,
    .row_num             (row_num             )    ,
    .single_color_datain (datain_r )    ,//二维图像一列的元素最上边像素位于该变量的高地址
    .receive_flag        (receive_flag        )    ,     
                          
    .send_flag           (send_flag           )    ,
    .single_color_dataout(dataout_r)      
);

assign  dataout={dataout_b[15*8+7:15*8],dataout_g[15*8+7:15*8],dataout_r[15*8+7:15*8],
                 dataout_b[14*8+7:14*8],dataout_g[14*8+7:14*8],dataout_r[14*8+7:14*8],
                 dataout_b[13*8+7:13*8],dataout_g[13*8+7:13*8],dataout_r[13*8+7:13*8],
                 dataout_b[12*8+7:12*8],dataout_g[12*8+7:12*8],dataout_r[12*8+7:12*8],
                 dataout_b[11*8+7:11*8],dataout_g[11*8+7:11*8],dataout_r[11*8+7:11*8],
                 dataout_b[10*8+7:10*8],dataout_g[10*8+7:10*8],dataout_r[10*8+7:10*8],
                 dataout_b[ 9*8+7: 9*8],dataout_g[ 9*8+7: 9*8],dataout_r[ 9*8+7: 9*8],
                 dataout_b[ 8*8+7: 8*8],dataout_g[ 8*8+7: 8*8],dataout_r[ 8*8+7: 8*8],
                 dataout_b[ 7*8+7: 7*8],dataout_g[ 7*8+7: 7*8],dataout_r[ 7*8+7: 7*8],
                 dataout_b[ 6*8+7: 6*8],dataout_g[ 6*8+7: 6*8],dataout_r[ 6*8+7: 6*8],
                 dataout_b[ 5*8+7: 5*8],dataout_g[ 5*8+7: 5*8],dataout_r[ 5*8+7: 5*8],
                 dataout_b[ 4*8+7: 4*8],dataout_g[ 4*8+7: 4*8],dataout_r[ 4*8+7: 4*8],
                 dataout_b[ 3*8+7: 3*8],dataout_g[ 3*8+7: 3*8],dataout_r[ 3*8+7: 3*8],
                 dataout_b[ 2*8+7: 2*8],dataout_g[ 2*8+7: 2*8],dataout_r[ 2*8+7: 2*8],
                 dataout_b[ 1*8+7: 1*8],dataout_g[ 1*8+7: 1*8],dataout_r[ 1*8+7: 1*8],
                 dataout_b[ 0*8+7: 0*8],dataout_g[ 0*8+7: 0*8],dataout_r[ 0*8+7: 0*8]};

endmodule
