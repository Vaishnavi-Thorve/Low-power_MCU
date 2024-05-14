version: 3

Orient: R270
Pad: PcornerLL SW PADSPACE_C_74x74u_CH
Orient: R0x3
Pad: PcornerLR SE PADSPACE_C_74x74u_CH
Orient: R90
Pad: PcornerUR NE PADSPACE_C_74x74u_CH
Orient: R180
Pad: PcornerUL NW PADSPACE_C_74x74u_CH

# # ------------------------------------------------ #
# # NORTH
# # ------------------------------------------------ #
Pad: VDD1    		N CPAD_S_74x50u_VDD
Pad: clk_pad    	N CPAD_S_74x50u_IN
Pad: rst_n_pad          N CPAD_S_74x50u_IN
Pad: testmode_i_pad     N CPAD_S_74x50u_IN
Pad: fetch_enable_i_pad N CPAD_S_74x50u_IN
Pad: spi_clk_i_pad 	N CPAD_S_74x50u_IN
Pad: spi_cs_i_pad       N CPAD_S_74x50u_IN
Pad: VDD2   		N CPAD_S_74x50u_VDD
# # ------------------------------------------------ #
# # EAST 
# # ------------------------------------------------ #
Pad: spi_sdi0_i_pad     E CPAD_S_74x50u_IN
Pad: spi_sdi1_i_pad     E CPAD_S_74x50u_IN
Pad: spi_sdi2_i_pad     E CPAD_S_74x50u_IN
Pad: spi_sdi3_i_pad     E CPAD_S_74x50u_IN
Pad: uart_rx_pad  	E CPAD_S_74x50u_IN
Pad: uart_cts_pad 	E CPAD_S_74x50u_IN
Pad: uart_dsr_pad       E CPAD_S_74x50u_IN
Pad: tck_i_pad   	E CPAD_S_74x50u_IN
# # ------------------------------------------------ #
# # SOUTH
# # ------------------------------------------------ #
Pad: GND1 		 S CPAD_S_74x50u_GND
Pad: trstn_i_pad   	 S CPAD_S_74x50u_IN
Pad: tms_i_pad   	 S CPAD_S_74x50u_IN
Pad: tdi_i_pad   	 S CPAD_S_74x50u_IN
Pad: spi_mode_o_pads[0].spi_mode_o_pads S CPAD_S_74x50u_OUT
Pad: spi_mode_o_pads[1].spi_mode_o_pads S CPAD_S_74x50u_OUT
Pad: tdo_o_pad  	 S CPAD_S_74x50u_OUT
Pad: GND2   		 S CPAD_S_74x50u_GND
# # ------------------------------------------------ #
# # WEST 
# # ------------------------------------------------ #
Pad: spi_sdo0_o_pad W CPAD_S_74x50u_OUT
Pad: spi_sdo1_o_pad W CPAD_S_74x50u_OUT
Pad: spi_sdo2_o_pad W CPAD_S_74x50u_OUT
Pad: spi_sdo3_o_pad W CPAD_S_74x50u_OUT
Pad: uart_tx_pad    W CPAD_S_74x50u_OUT
Pad: uart_rts_pad    W CPAD_S_74x50u_OUT
Pad: uart_dtr_pad    W CPAD_S_74x50u_OUT
Pad: gpio_out_pad    W CPAD_S_74x50u_OUT
