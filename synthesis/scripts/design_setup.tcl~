# Change this variable to top entity of your own design
set DESIGN pulpino_top 

# Change this variable to the RTL path of your own design
set RTL "/h/d2/m/va6661th-s/etin35/pulpino/rtl"
set RTL2 "/h/d2/m/va6661th-s/etin35/pulpino/rtl/components"
set RTL3 "/h/d2/m/va6661th-s/etin35/pulpino/rtl/includes"
set RTL4 "/h/d2/m/va6661th-s/etin35/pulpino/ips/adv_dbg_if/rtl"
set RTL5 "/h/d2/m/va6661th-s/etin35/pulpino/ips"

set_attribute script_search_path {/h/d2/m/va6661th-s/etin35/scripts} /

set_attribute init_hdl_search_path $RTL /
set_attribute init_hdl_search_path $RTL2 /
set_attribute init_hdl_search_path $RTL3 /
set_attribute init_hdl_search_path $RTL4 /
set_attribute init_hdl_search_path $RTL5 /

set_attribute init_lib_search_path { \
/usr/local-eit/cad2/cmpstm/stm065v536/CORE65LPLVT_5.1/libs \
/usr/local-eit/cad2/cmpstm/stm065v536/CLOCK65LPLVT_3.1/libs \
/usr/local-eit/cad2/cmpstm/oldmems/mem2011/SPHD110420-48158@1.0/libs \
/usr/local-eit/cad2/cmpstm/dicp18/lu_pads_65nm \
} /

set_attribute library { \
CLOCK65LPLVT_nom_1.20V_25C.lib \
CORE65LPLVT_nom_1.20V_25C.lib \
SPHD110420_nom_1.20V_25C.lib \
Pads_Oct2012.lib} /

# put all your design files here

set DESIGN_FILES_sv "${RTL}/apb_mock_uart.sv ${RTL}/axi2apb_wrap.sv ${RTL}/axi_mem_if_SP_wrap.sv ${RTL}/axi_node_intf_wrap.sv ${RTL}/axi_slice_wrap.sv ${RTL}/axi_spi_slave_wrap.sv ${RTL}/boot_code.sv ${RTL}/boot_rom_wrap.sv ${RTL}/clk_rst_gen.sv ${RTL}/core2axi_wrap.sv ${RTL}/core_region.sv ${RTL}/instr_ram_wrap.sv ${RTL}/periph_bus_wrap.sv ${RTL}/peripherals.sv ${RTL}/pulpino_top.sv ${RTL}/ram_mux.sv ${RTL}/random_stalls.sv ${RTL}/sp_ram_wrap.sv ${RTL2}/cluster_clock_gating.sv ${RTL2}/cluster_clock_inverter.sv ${RTL2}/cluster_clock_mux2.sv ${RTL2}/generic_fifo.sv ${RTL2}/pulp_clock_gating.sv ${RTL2}/pulp_clock_inverter.sv ${RTL2}/pulp-clock_mux2.sv ${RTL2}/rstgen.sv ${RTL2}/sp_ram.sv ${RTL3}/apb_bus.sv ${RTL3}/ apu_defines.sv ${RTL3}/axi_bus.sv ${RTL3}/config.sv ${RTL3}/debug_bus.sv ${RTL4}/adbg_axi_biu.sv ${RTL4}/adbg_axi_module.sv ${RTL4}/adbg_axionly_top.sv ${RTL4}/adbg_lint_biu.sv ${RTL4}/adbg_lintonly_top.sv ${RTL4}/adbg_or1k_biu.sv ${RTL4}/adbg_or1k_module.sv ${RTL4}/adbg_or1k_status_reg.sv ${RTL4}/adbg_top.sv ${RTL4}/adv_dbg_if.sv ${RTL5}/apb/apb2per/apb2per.sv ${RTL5}/apb/apb_event_unit/apb_event_unit.sv ${RTL5}/apb/apb_event_unit/generic_service_unit.sv ${RTL5}/apb/apb_event_unit/sleep_unit.sv  ${RTL5}/apb/apb_event_unit/include/defines_event_unit.sv ${RTL5}/apb/apb_fll_if/apb_fll_if.sv ${RTL5}/apb/apb_gpio/apb_gpio.sv ${RTL5}/apb/apb_i2c/apb_i2c.sv ${RTL5}/apb/apb_i2c/i2c_master_bit_ctrl.sv ${RTL5}/apb/apb_i2c/i2c_master_byte_ctrl.sv ${RTL5}/apb/apb_i2c/i2c_master_defines.sv ${RTL5}/apb/apb_node/apb_node.sv ${RTL5}/apb/apb_node/apb_node_wrap.sv ${RTL5}/apb/apb_pulpino/apb_pulpino.sv ${RTL5}/apb/apb_spi_master/apb_spi_master.sv ${RTL5}/apb/apb_spi_master/spi_master_apb_if.sv ${RTL5}/apb/apb_spi_master/spi_master_clkgen.sv ${RTL5}/apb/apb_spi_master/spi_master_controller.sv ${RTL5}/apb/apb_spi_master/spi_master_fifo.sv ${RTL5}/apb/apb_spi_master/spi_master_rx.sv ${RTL5}/apb/apb_spi_master/spi_master_tx.sv ${RTL5}/apb/apb_timer/apb_timer.sv ${RTL5}/apb/apb_timer/timer.sv ${RTL5}/apb/apb_uart_sv/apb_uart.sv  ${RTL5}/apb/apb_uart_sv/apb_uart_sv.sv  ${RTL5}/apb/apb_uart_sv/io_generic_fifo.sv  ${RTL5}/apb/apb_uart_sv/uart_interrupt.sv ${RTL5}/apb/apb_uart_sv/uart_rx.sv ${RTL5}/apb/apb_uart_sv/uart_tx.sv ${RTL5}/axi/axi2apb/axi2apb.sv ${RTL5}/axi/axi2apb/axi2apb32.sv  ${RTL5}/axi/axi2apb/AXI_2_APB.sv ${RTL5}/axi/axi2apb/AXI_2_APB_32.sv ${RTL5}/axi/axi_mem_if_DP/axi_mem_if_DP.sv  ${RTL5}/axi/axi_mem_if_DP/axi_mem_if_DP_hybr.sv  ${RTL5}/axi/axi_mem_if_DP/axi_mem_if_MP_Hybrid_multi_bank.sv  ${RTL5}/axi/axi_mem_if_DP/axi_mem_if_SP.sv  ${RTL5}/axi/axi_mem_if_DP/axi_read_only_ctrl.sv ${RTL5}/axi/axi_mem_if_DP/axi_write_onöy_ctrl.sv ${RTL5}/axi/axi_mem_if_DP/tb_axi_DP.sv ${RTL5}/axi/axi_mem_if_DP/tb_axi_write_only.sv ${RTL5}/axi/axi_node/apb_regs_top.sv ${RTL5}/axi/axi_node/axi_address_decoder_AR.sv  ${RTL5}/axi/axi_node/axi_address_decoder_BR.sv ${RTL5}/axi/axi_node/axi_address_decoder_BW.sv ${RTL5}/axi/axi_node/axi_address_decoder_DW.sv  ${RTL5}/axi/axi_node/axi_AR_allocator.sv ${RTL5}/axi/axi_node/axi_ArbitrationTree.sv ${RTL5}/axi/axi_node/axi_AW_allocator.sv ${RTL5}/axi/axi_node/axi_BR_allocator.sv ${RTL5}/axi/axi_node/axi_BW_allocator.sv ${RTL5}/axi/axi_node/axi_DW_allocator.sv ${RTL5}/axi/axi_node/axi_FanInPrimitive_Req.sv ${RTL5}/axi/axi_node/axi_multiplexer.sv  ${RTL5}/axi/axi_node/axi_node.sv ${RTL5}/axi/axi_node/axi_node_wrap.sv ${RTL5}/axi/axi_node/axi_node_wrap_with_slices.sv ${RTL5}/axi/axi_node/axi_regs_top.sv ${RTL5}/axi/axi_node/axi_request_block.sv ${RTL5}/axi/axi_node/axi_response_block.sv ${RTL5}/axi/axi_node/axi_RR_Flag_Req.sv ${RTL5}/axi/axi_slice/axi_ar_buffer.sv ${RTL5}/axi/axi_slice/axi_aw_buffer.sv ${RTL5}/axi/axi_slice/axi_b_buffer.sv ${RTL5}/axi/axi_slice/axi_buffer.sv ${RTL5}/axi/axi_slice/axi_r_buffer.sv ${RTL5}/axi/axi_slice/axi_slice.sv ${RTL5}/axi/axi_slice/axi_w_buffer.sv ${RTL5}/axi/axi_slice_dc/axi_slice_dc_master.sv ${RTL5}/axi/axi_slice_dc/axi_slice_dc-slave.sv ${RTL5}/axi/axi_slice_dc/dc_data-buffer.v ${RTL5}/axi/axi_spi_master/axi_spi_master.sv ${RTL5}/axi/axi_spi_master/spi_master_axi_if.sv ${RTL5}/axi/axi_spi_master/spi_master_clkgen.sv ${RTL5}/axi/axi_spi_master/spi_master-controller.sv ${RTL5}/axi/axi_spi_master/spi_master_fifo.sv ${RTL5}/axi/axi_spi_master/spi_master_rx.sv ${RTL5}/axi/axi_spi_master/spi_master_tx.sv ${RTL5}/axi/axi_spi_slave/axi_spi_slave.sv ${RTL5}/axi/axi_spi_slave/spi_slave_axi_plug.sv ${RTL5}/axi/axi_spi_slave/spi_slave_cmd_praser.sv ${RTL5}/axi/axi_spi_slave/spi_slave_controller.sv ${RTL5}/axi/axi_spi_slave/spi_slave_dc_fifo.sv ${RTL5}/axi/axi_spi_slave/spi_slave_regs.sv ${RTL5}/axi/axi_spi_slave/spi_slave_rx.sv ${RTL5}/axi/axi_spi_slave/spi_slave_syncro.sv ${RTL5}/axi/axi_spi_slave/spi_slave_tx.sv  ${RTL5}/axi/core2axi/core2axi.sv ${RTL5}/riscv/riscv_alu.sv ${RTL5}/riscv/riscv_alu_basic.sv ${RTL5}/riscv/riscv_alu_div.sv ${RTL5}/riscv/riscv_apu_disp.sv ${RTL5}/riscv/riscv_compressed_decoder.sv ${RTL5}/riscv/riscv_controller.sv ${RTL5}/riscv/riscv_core.sv ${RTL5}/riscv/riscv_cs_registers.sv ${RTL5}/riscv/riscv_debug_unit.sv ${RTL5}/riscv/riscv_decoder.sv ${RTL5}/riscv/riscv_ex_stage.sv ${RTL5}/riscv/riscv_fetch_fifo.sv ${RTL5}/riscv/riscv_hwloop_controller.sv ${RTL5}/riscv/riscv_hwloop_regs.sv ${RTL5}/riscv/riscv_id_stage.sv ${RTL5}/riscv/riscv_if_stage.sv ${RTL5}/riscv/riscv_int_controller.sv ${RTL5}/riscv/riscv_L0_buffer.sv ${RTL5}/riscv/riscv_load_store_unit.sv ${RTL5}/riscv/riscv_mult.sv ${RTL5}/riscv/riscv-prefetch_buffer.sv ${RTL5}/riscv/riscv_prefetch_L0_buffer.sv ${RTL5}/riscv/riscv_register-file.sv ${RTL5}/riscv/riscv_register_file_latch.sv ${RTL5}/riscv/riscv_tracer.sv ${RTL5}/riscv/include/apu_core_package.sv ${RTL5}/riscv/include/apu_macros.sv ${RTL5}/riscv/include/riscv_config.sv ${RTL5}/riscv/include/riscv_defines.sv ${RTL5}/riscv/include/riscv_tracer_defines.sv    "

set DESIGN_FILES_v "${RTL2}/SPHDL100909.v ${RTL4}/adbg_axi_defines.v ${RTL4}/adbg_crc32.v ${RTL4}/adbg_defines.v ${RTL4}/adbg_or1k_defines.v ${RTL4}/adbg_tap_defines.v ${RTL4}/adbg_tap_top.v ${RTL4}/bytefifo.v ${RTL4}/syncflop.v ${RTL4}/syncreg.v ${RTL5}/axi/axi_node/defines.v ${RTL5}/axi/axi_slice_dc/dc_full_detector.v ${RTL5}/axi/axi_slice_dc/dc_synchronizer.v ${RTL5}/axi/axi_slice_dc/dc_token-ring.v ${RTL5}/axi/axi_slice_dc/dc_token_ring_fifo_din.v ${RTL5}/axi/axi_slice_dc/dc_token_ring_fifo_dout.v "

set DESIGN_FILES_vhdl " ${RTL5}/apb/apb_uart/apb_uart.vhd  ${RTL5}/apb/apb_uart/slib_clock_div.vhd  ${RTL5}/apb/apb_uart/slib_counter.vhd  ${RTL5}/apb/apb_uart/slib_edge_detect.vhd  ${RTL5}/apb/apb_uart/slib_fifo.vhd  ${RTL5}/apb/apb_uart/slib_input_filter.vhd  ${RTL5}/apb/apb_uart/slib_input_sync.vhd  ${RTL5}/apb/apb_uart/slib_mv_filter.vhd  ${RTL5}/apb/apb_uart/uart_baudgen.vhd  ${RTL5}/apb/apb_uart/uart_interrupt.vhd  ${RTL5}/apb/apb_uart/uart_receiver.vhd  ${RTL5}/apb/apb_uart/uart_transmitter.vhd"


set SYN_EFF medium 
set MAP_EFF medium 
set OPT_EFF medium 

set_attribute syn_generic_effort ${SYN_EFF}
set_attribute syn_map_effort ${MAP_EFF}
set_attribute syn_opt_effort ${OPT_EFF}
set_attribute information_level 5; # Up to maximum 9
