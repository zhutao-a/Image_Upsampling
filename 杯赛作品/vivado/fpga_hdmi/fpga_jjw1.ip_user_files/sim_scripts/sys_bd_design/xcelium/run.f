-makelib xcelium_lib/xilinx_vip -sv \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_4 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_6 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_processing_system7_0_0/sim/sys_bd_design_processing_system7_0_0.v" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_top_0_0/sim/sys_bd_design_top_0_0.v" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_key_debounce_0_0/sim/sys_bd_design_key_debounce_0_0.v" \
-endlib
-makelib xcelium_lib/util_vector_logic_v2_0_1 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_util_vector_logic_0_0/sim/sys_bd_design_util_vector_logic_0_0.v" \
  "../../../bd/sys_bd_design/ipshared/6bb8/hdl/axi_ddr_rw_v1_0_M_AXI.v" \
  "../../../bd/sys_bd_design/ipshared/6bb8/hdl/axi_ddr_rw_v1_0.v" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_axi_ddr_rw_0_0/sim/sys_bd_design_axi_ddr_rw_0_0.v" \
  "../../../bd/sys_bd_design/sim/sys_bd_design.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_rst_ps7_0_50M_0/sim/sys_bd_design_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_3 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_12 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_2 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/lib_bmg_v1_0_11 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/556c/hdl/lib_bmg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_20 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_vdma_v6_3_6 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vdma_v6_3_6 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_axi_vdma_0_1/sim/sys_bd_design_axi_vdma_0_1.vhd" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/v_tc_v6_1_13 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/a92c/hdl/v_tc_v6_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_v_tc_0_1/sim/sys_bd_design_v_tc_0_1.vhd" \
-endlib
-makelib xcelium_lib/v_vid_in_axi4s_v4_0_9 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/v_axi4s_vid_out_v4_0_10 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/a87e/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_v_axi4s_vid_out_0_1/sim/sys_bd_design_v_axi4s_vid_out_0_1.v" \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ab26/src/mmcme2_drp.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ab26/src/axi_dynclk_S00_AXI.vhd" \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ab26/src/axi_dynclk.vhd" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_axi_dynclk_0_1/sim/sys_bd_design_axi_dynclk_0_1.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_18 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_17 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_19 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_xbar_2/sim/sys_bd_design_xbar_2.v" \
  "../../../bd/sys_bd_design/ipshared/31a1/src/asyn_rst_syn.v" \
  "../../../bd/sys_bd_design/ipshared/31a1/src/dvi_encoder.v" \
  "../../../bd/sys_bd_design/ipshared/31a1/src/serializer_10_to_1.v" \
  "../../../bd/sys_bd_design/ipshared/31a1/src/dvi_transmitter_top.v" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_DVI_Transmitter_0_0/sim/sys_bd_design_DVI_Transmitter_0_0.v" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/sim/bd_267f.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_5 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_267f_one_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_267f_psr_aclk_0.vhd" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_267f_arsw_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_267f_rsw_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_267f_awsw_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_267f_wsw_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_267f_bsw_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_267f_s00mmu_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_267f_s00tr_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_267f_s00sic_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_267f_s00a2s_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
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
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_267f_m00s2a_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_267f_m00arn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_267f_m00rn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_267f_m00awn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_267f_m00wn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_267f_m00bn_0.sv" \
-endlib
-makelib xcelium_lib/smartconnect_v1_0 -sv \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_267f_m00e_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_267f_m01s2a_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_267f_m01arn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_267f_m01rn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_267f_m01awn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_267f_m01wn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_267f_m01bn_0.sv" \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_267f_m01e_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_smartconnect_0_0/sim/sys_bd_design_smartconnect_0_0.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_18 \
  "../../../../fpga_jjw1.srcs/sources_1/bd/sys_bd_design/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/sys_bd_design/ip/sys_bd_design_auto_pc_0/sim/sys_bd_design_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

