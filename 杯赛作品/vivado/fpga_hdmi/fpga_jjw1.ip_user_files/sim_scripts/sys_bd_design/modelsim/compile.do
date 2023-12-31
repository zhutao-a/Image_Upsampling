vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_4
vlib modelsim_lib/msim/processing_system7_vip_v1_0_6
vlib modelsim_lib/msim/util_vector_logic_v2_0_1
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/fifo_generator_v13_2_3
vlib modelsim_lib/msim/lib_fifo_v1_0_12
vlib modelsim_lib/msim/blk_mem_gen_v8_4_2
vlib modelsim_lib/msim/lib_bmg_v1_0_11
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_datamover_v5_1_20
vlib modelsim_lib/msim/axi_vdma_v6_3_6
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/v_tc_v6_1_13
vlib modelsim_lib/msim/v_vid_in_axi4s_v4_0_9
vlib modelsim_lib/msim/v_axi4s_vid_out_v4_0_10
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_18
vlib modelsim_lib/msim/axi_data_fifo_v2_1_17
vlib modelsim_lib/msim/axi_crossbar_v2_1_19
vlib modelsim_lib/msim/xlconstant_v1_1_5
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_18

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 modelsim_lib/msim/axi_vip_v1_1_4
vmap processing_system7_vip_v1_0_6 modelsim_lib/msim/processing_system7_vip_v1_0_6
vmap util_vector_logic_v2_0_1 modelsim_lib/msim/util_vector_logic_v2_0_1
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_3 modelsim_lib/msim/fifo_generator_v13_2_3
vmap lib_fifo_v1_0_12 modelsim_lib/msim/lib_fifo_v1_0_12
vmap blk_mem_gen_v8_4_2 modelsim_lib/msim/blk_mem_gen_v8_4_2
vmap lib_bmg_v1_0_11 modelsim_lib/msim/lib_bmg_v1_0_11
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_20 modelsim_lib/msim/axi_datamover_v5_1_20
vmap axi_vdma_v6_3_6 modelsim_lib/msim/axi_vdma_v6_3_6
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap v_tc_v6_1_13 modelsim_lib/msim/v_tc_v6_1_13
vmap v_vid_in_axi4s_v4_0_9 modelsim_lib/msim/v_vid_in_axi4s_v4_0_9
vmap v_axi4s_vid_out_v4_0_10 modelsim_lib/msim/v_axi4s_vid_out_v4_0_10
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_18 modelsim_lib/msim/axi_register_slice_v2_1_18
vmap axi_data_fifo_v2_1_17 modelsim_lib/msim/axi_data_fifo_v2_1_17
vmap axi_crossbar_v2_1_19 modelsim_lib/msim/axi_crossbar_v2_1_19
vmap xlconstant_v1_1_5 modelsim_lib/msim/xlconstant_v1_1_5
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_protocol_converter_v2_1_18 modelsim_lib/msim/axi_protocol_converter_v2_1_18

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_6 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0/sim/sys_bd_design_processing_system7_0_0.v" \
"../../../bd/sys_bd_design/ip/sys_bd_design_top_0_0/sim/sys_bd_design_top_0_0.v" \
"../../../bd/sys_bd_design/ip/sys_bd_design_key_debounce_0_0/sim/sys_bd_design_key_debounce_0_0.v" \

vlog -work util_vector_logic_v2_0_1 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_util_vector_logic_0_0/sim/sys_bd_design_util_vector_logic_0_0.v" \
"../../../bd/sys_bd_design/ipshared/6bb8/hdl/axi_ddr_rw_v1_0_M_AXI.v" \
"../../../bd/sys_bd_design/ipshared/6bb8/hdl/axi_ddr_rw_v1_0.v" \
"../../../bd/sys_bd_design/ip/sys_bd_design_axi_ddr_rw_0_0/sim/sys_bd_design_axi_ddr_rw_0_0.v" \
"../../../bd/sys_bd_design/sim/sys_bd_design.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/sys_bd_design/ip/sys_bd_design_rst_ps7_0_50M_0/sim/sys_bd_design_rst_ps7_0_50M_0.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_12 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \

vlog -work blk_mem_gen_v8_4_2 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_11 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/556c/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_20 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vlog -work axi_vdma_v6_3_6 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.v" \

vcom -work axi_vdma_v6_3_6 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/sys_bd_design/ip/sys_bd_design_axi_vdma_0_1/sim/sys_bd_design_axi_vdma_0_1.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work v_tc_v6_1_13 -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/a92c/hdl/v_tc_v6_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/sys_bd_design/ip/sys_bd_design_v_tc_0_1/sim/sys_bd_design_v_tc_0_1.vhd" \

vlog -work v_vid_in_axi4s_v4_0_9 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \

vlog -work v_axi4s_vid_out_v4_0_10 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/a87e/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_v_axi4s_vid_out_0_1/sim/sys_bd_design_v_axi4s_vid_out_0_1.v" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ab26/src/mmcme2_drp.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ab26/src/axi_dynclk_S00_AXI.vhd" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ab26/src/axi_dynclk.vhd" \
"../../../bd/sys_bd_design/ip/sys_bd_design_axi_dynclk_0_1/sim/sys_bd_design_axi_dynclk_0_1.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_17 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_19 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_xbar_2/sim/sys_bd_design_xbar_2.v" \
"../../../bd/sys_bd_design/ipshared/31a1/src/asyn_rst_syn.v" \
"../../../bd/sys_bd_design/ipshared/31a1/src/dvi_encoder.v" \
"../../../bd/sys_bd_design/ipshared/31a1/src/serializer_10_to_1.v" \
"../../../bd/sys_bd_design/ipshared/31a1/src/dvi_transmitter_top.v" \
"../../../bd/sys_bd_design/ip/sys_bd_design_DVI_Transmitter_0_0/sim/sys_bd_design_DVI_Transmitter_0_0.v" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/sim/bd_267f.v" \

vlog -work xlconstant_v1_1_5 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_267f_one_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_267f_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_267f_arsw_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_267f_rsw_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_267f_awsw_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_267f_wsw_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_267f_bsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_267f_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_267f_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_267f_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_267f_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_267f_sarn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_267f_srn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_267f_sawn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_267f_swn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_267f_sbn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_267f_s01mmu_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_267f_s01tr_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_267f_s01sic_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_267f_s01a2s_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_267f_sarn_1.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_267f_srn_1.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_267f_m00s2a_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_267f_m00arn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_267f_m00rn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_267f_m00awn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_267f_m00wn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_267f_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_267f_m00e_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_267f_m01s2a_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_267f_m01arn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_267f_m01rn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_267f_m01awn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_267f_m01wn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_267f_m01bn_0.sv" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_267f_m01e_0.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/sim/sys_bd_design_smartconnect_0_0.v" \

vlog -work axi_protocol_converter_v2_1_18 -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0" "+incdir+D:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/sys_bd_design/ip/sys_bd_design_auto_pc_0/sim/sys_bd_design_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

