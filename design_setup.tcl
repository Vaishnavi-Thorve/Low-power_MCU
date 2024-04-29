# Change this variable to top entity of your own design
set DESIGN pulpino_top 

# Change this variable to the RTL path of your own design
set RTL "/h/d2/m/va6661th-s/etin35/pulpino/rtl"
set RTL2 "/h/d2/m/va6661th-s/etin35/pulpino/rtl/components"
set RTL3 "/h/d2/m/va6661th-s/etin35/pulpino/rtl/includes"

set_attribute script_search_path {/h/d2/m/va6661th-s/etin35/scripts} /

set_attribute init_hdl_search_path $RTL /
set_attribute init_hdl_search_path $RTL2 /
set_attribute init_hdl_search_path $RTL3 /

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
set DESIGN_FILES "${RTL}/apb_mock_uart.sv ${RTL}/axi2apb_wrap.sv ${RTL}/axi_mem_if_SP_wrap.sv ${RTL}/axi_node_intf_wrap.sv ${RTL}/axi_slice_wrap.sv ${RTL}/axi_spi_slave_wrap.sv ${RTL}/boot_code.sv ${RTL}/boot_rom_wrap.sv ${RTL}/clk_rst_gen.sv ${RTL}/core2axi_wrap.sv ${RTL}/core_region.sv ${RTL}/instr_ram_wrap.sv ${RTL}/periph_bus_wrap.sv ${RTL}/peripherals.sv ${RTL}/pulpino_top.sv ${RTL}/ram_mux.sv ${RTL}/random_stalls.sv ${RTL}/sp_ram_wrap.sv ${RTL2}/cluster_clock_gating.sv ${RTL2}/cluster_clock_inverter.sv ${RTL2}/cluster_clock_mux2.sv ${RTL2}/generic_fifo.sv ${RTL2}/pulp_clock_gating.sv ${RTL2}/pulp_clock_inverter.sv ${RTL2}/pulp-clock_mux2.sv ${RTL2}/rstgen.sv ${RTL2}/SPHDL100909.v ${RTL2}/sp_ram.sv ${RTL3}/apb_bus.sv ${RTL3}/ apu_defines.sv ${RTL3}/axi_bus.sv ${RTL3}/config.sv ${RTL3}/debug_bus.sv"


set SYN_EFF medium 
set MAP_EFF medium 
set OPT_EFF medium 

set_attribute syn_generic_effort ${SYN_EFF}
set_attribute syn_map_effort ${MAP_EFF}
set_attribute syn_opt_effort ${OPT_EFF}
set_attribute information_level 5; # Up to maximum 9
