// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

`include "axi_bus.sv"
`include "apb_bus.sv"
`include "debug_bus.sv"
`include "config.sv"

module peripherals
  #(
    parameter AXI_ADDR_WIDTH       = 32,
    parameter AXI_DATA_WIDTH       = 64,
    parameter AXI_USER_WIDTH       = 6,
    parameter AXI_SLAVE_ID_WIDTH   = 6,
    parameter AXI_MASTER_ID_WIDTH  = 6,
    parameter ROM_START_ADDR       = 32'h8000
  )
  (
    // Clock and Reset
    input logic clk,
    input logic rst_n,

    AXI_BUS.Master axi_spi_master,

    DEBUG_BUS.Master debug,

    input  logic             spi_clk_i,
    input  logic             testmode_i,
    input  logic             spi_cs_i,
    output logic [1:0]       spi_mode_o,
    output logic             spi_sdo0_o,
    output logic             spi_sdo1_o,
    output logic             spi_sdo2_o,
    output logic             spi_sdo3_o,
    input  logic             spi_sdi0_i,
    input  logic             spi_sdi1_i,
    input  logic             spi_sdi2_i,
    input  logic             spi_sdi3_i,

    AXI_BUS.Slave  slave,

    output logic              uart_tx,
    input  logic              uart_rx,
    output logic              uart_rts,
    output logic              uart_dtr,
    input  logic              uart_cts,
    input  logic              uart_dsr,

  // removed spi master and the i2c 

    //input  logic       [31:0] gpio_in,
    output logic          gpio_out,
    //output logic       [31:0] gpio_dir,
    //output logic [31:0] [5:0] gpio_padcfg,

    input  logic              core_busy_i,
    output logic [31:0]       irq_o,
    input  logic              fetch_enable_i,
    output logic              fetch_enable_o,
    output logic              clk_gate_core_o,

    // removed fll and pad mux

    output logic       [31:0] boot_addr_o
  );

  localparam APB_ADDR_WIDTH  = 32;
  localparam APB_NUM_SLAVES  = 8;

  APB_BUS s_apb_bus();

  APB_BUS s_uart_bus();
  APB_BUS s_gpio_bus();
  APB_BUS s_spi_bus();
  APB_BUS s_timer_bus();
  APB_BUS s_event_unit_bus();
  //APB_BUS s_i2c_bus();
  //APB_BUS s_fll_bus();
  APB_BUS s_soc_ctrl_bus();
  APB_BUS s_debug_bus();

  logic [1:0]   s_spim_event;
  logic [3:0]   timer_irq;
  logic [31:0]  peripheral_clock_gate_ctrl;
  logic [31:0]  clk_int;
  logic         s_uart_event;
  //logic         i2c_event;
  logic         s_gpio_event;

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// Peripheral Clock Gating                                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  generate
     genvar i;
       for (i = 0; i < APB_NUM_SLAVES; i = i + 1) begin
        cluster_clock_gating core_clock_gate
        (
          .clk_o     ( clk_int[i]                    ),
          .en_i      ( peripheral_clock_gate_ctrl[i] ),
          .test_en_i ( testmode_i                    ),
          .clk_i     ( clk                         )
        );
      end
   endgenerate

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// SPI Slave, AXI Master                                      ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  axi_spi_slave_wrap
  #(
    .AXI_ADDRESS_WIDTH  ( AXI_ADDR_WIDTH       ),
    .AXI_DATA_WIDTH     ( AXI_DATA_WIDTH       ),
    .AXI_USER_WIDTH     ( AXI_USER_WIDTH       ),
    .AXI_ID_WIDTH       ( AXI_MASTER_ID_WIDTH  )
  )
  axi_spi_slave_i
  (
    .clk      ( clk_int[0]     ),
    .rst_n     ( rst_n          ),

    .test_mode  ( testmode_i     ),

    .axi_master ( axi_spi_master ),

    .spi_clk    ( spi_clk_i      ),
    .spi_cs     ( spi_cs_i       ),
    .spi_mode   ( spi_mode_o     ),
    .spi_sdo0   ( spi_sdo0_o     ),
    .spi_sdo1   ( spi_sdo1_o     ),
    .spi_sdo2   ( spi_sdo2_o     ),
    .spi_sdo3   ( spi_sdo3_o     ),
    .spi_sdi0   ( spi_sdi0_i     ),
    .spi_sdi1   ( spi_sdi1_i     ),
    .spi_sdi2   ( spi_sdi2_i     ),
    .spi_sdi3   ( spi_sdi3_i     )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// AXI2APB Bridge                                             ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  axi2apb_wrap
  #(
      .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH     ),
      .AXI_DATA_WIDTH ( AXI_DATA_WIDTH     ),
      .AXI_USER_WIDTH ( AXI_USER_WIDTH     ),
      .AXI_ID_WIDTH   ( AXI_SLAVE_ID_WIDTH ),
      .APB_ADDR_WIDTH ( APB_ADDR_WIDTH     )
  )
  axi2apb_i
  (
    .clk_i     ( clk      ),
    .rst_ni    ( rst_n      ),
    .test_en_i ( testmode_i ),

    .axi_slave ( slave      ),

    .apb_master( s_apb_bus  )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Bus                                                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  periph_bus_wrap
  #(
     .APB_ADDR_WIDTH( APB_ADDR_WIDTH ),
     .APB_DATA_WIDTH( 32             )
  )
  periph_bus_i
  (
     .clk             ( clk            ),
     .rst_n            ( rst_n            ),

     .apb_slave         ( s_apb_bus        ),

     .uart_master       ( s_uart_bus       ),
     .gpio_master       ( s_gpio_bus       ),
     //.spi_master        ( s_spi_bus        ),
     .timer_master      ( s_timer_bus      ),
     .event_unit_master ( s_event_unit_bus ),
     //.i2c_master        ( s_i2c_bus        ),
     //.fll_master        ( s_fll_bus        ),
     .soc_ctrl_master   ( s_soc_ctrl_bus   ),
     .debug_master      ( s_debug_bus      )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 0: APB UART interface                            ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  `ifndef VERILATOR
  apb_uart apb_uart_i (
    .CLK      ( clk_int[1]   ),
    .RSTN     ( rst_n        ),

    .PSEL     ( s_uart_bus.psel    ),
    .PENABLE  ( s_uart_bus.penable    ),
    .PWRITE   ( s_uart_bus.pwrite     ),
    .PADDR    ( s_uart_bus.paddr[4:2] ),
    .PWDATA   ( s_uart_bus.pwdata     ),
    .PRDATA   ( s_uart_bus.prdata  ),
    .PREADY   ( s_uart_bus.pready  ),
    .PSLVERR  ( s_uart_bus.pslverr ),

    .INT      ( s_uart_event ),   //Interrupt output

    .OUT1N    (),                    //Output 1
    .OUT2N    (),                    //Output 2
    .RTSN     ( uart_rts    ),       //RTS output
    .DTRN     ( uart_dtr    ),       //DTR output
    .CTSN     ( uart_cts    ),       //CTS input
    .DSRN     ( uart_dsr    ),       //DSR input
    .DCDN     ( 1'b1        ),       //DCD input
    .RIN      ( 1'b1        ),       //RI input
    .SIN      ( uart_rx     ),
    .SOUT     ( uart_tx     )
  );
  `else
  apb_uart_sv
    #(
       .APB_ADDR_WIDTH( 3 )
    )
    apb_uart_i
    (
      .CLK      ( clk_int[1]            ),
      .RSTN     ( rst_n                 ),

      .PSEL     ( s_uart_bus.psel       ),
      .PENABLE  ( s_uart_bus.penable    ),
      .PWRITE   ( s_uart_bus.pwrite     ),
      .PADDR    ( s_uart_bus.paddr[4:2] ),
      .PWDATA   ( s_uart_bus.pwdata     ),
      .PRDATA   ( s_uart_bus.prdata     ),
      .PREADY   ( s_uart_bus.pready     ),
      .PSLVERR  ( s_uart_bus.pslverr    ),

      .rx_i     ( uart_rx               ),
      .tx_o     ( uart_tx               ),
      .event_o  ( s_uart_event          )
    );
  `endif

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 1: APB GPIO interface                            ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb_gpio apb_gpio_i
  (
    .HCLK       ( clk_int[2]   ),
    .HRESETn    ( rst_n        ),

    .PADDR      ( s_gpio_bus.paddr[11:0]),
    .PWDATA     ( s_gpio_bus.pwdata     ),
    .PWRITE     ( s_gpio_bus.pwrite     ),
    .PSEL       ( s_gpio_bus.psel       ),
    .PENABLE    ( s_gpio_bus.penable    ),
    .PRDATA     ( s_gpio_bus.prdata     ),
    .PREADY     ( s_gpio_bus.pready     ),
    .PSLVERR    ( s_gpio_bus.pslverr    ),

    //.gpio_in      ( gpio_in       ),
    .gpio_out     ( gpio_out      ),
    //.gpio_dir     ( gpio_dir      ),
    //.gpio_padcfg  ( gpio_padcfg   ),
    .interrupt    ( s_gpio_event  )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 2: APB SPI Master interface  (removed)                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 3: Timer Unit                                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb_timer
  apb_timer_i
  (
    .HCLK       ( clk_int[3]   ),
    .HRESETn    ( rst_n        ),

    .PADDR      ( s_timer_bus.paddr[11:0]),
    .PWDATA     ( s_timer_bus.pwdata     ),
    .PWRITE     ( s_timer_bus.pwrite     ),
    .PSEL       ( s_timer_bus.psel       ),
    .PENABLE    ( s_timer_bus.penable    ),
    .PRDATA     ( s_timer_bus.prdata     ),
    .PREADY     ( s_timer_bus.pready     ),
    .PSLVERR    ( s_timer_bus.pslverr    ),

    .irq_o      ( timer_irq    )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 4: Event Unit                                    ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb_event_unit
  apb_event_unit_i
  (
    .clk_i            ( clk        ),
    .HCLK             ( clk_int[4]   ),
    .HRESETn          ( rst_n        ),

    .PADDR            ( s_event_unit_bus.paddr[11:0]),
    .PWDATA           ( s_event_unit_bus.pwdata     ),
    .PWRITE           ( s_event_unit_bus.pwrite     ),
    .PSEL             ( s_event_unit_bus.psel       ),
    .PENABLE          ( s_event_unit_bus.penable    ),
    .PRDATA           ( s_event_unit_bus.prdata     ),
    .PREADY           ( s_event_unit_bus.pready     ),
    .PSLVERR          ( s_event_unit_bus.pslverr    ),

    .irq_i            ( {timer_irq, s_spim_event, s_gpio_event, s_uart_event, 24'b0} ),
    .event_i          ( {timer_irq, s_spim_event, s_gpio_event, s_uart_event, 24'b0} ),
    .irq_o            ( irq_o              ),

    .fetch_enable_i   ( fetch_enable_i     ),
    .fetch_enable_o   ( fetch_enable_o     ),
    .clk_gate_core_o  ( clk_gate_core_o    ),
    .core_busy_i      ( core_busy_i        )
  );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 5: I2C  (removed)                                         ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  


  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 6: FLL Ctrl      (removed)                                ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

   

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 7: PULPino control                               ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

    apb_pulpino
    #(
      .BOOT_ADDR ( ROM_START_ADDR )
    )
    apb_pulpino_i
    (
      .HCLK        ( clk        ),
      .HRESETn     ( rst_n        ),

      .PADDR       ( s_soc_ctrl_bus.paddr[11:0]),
      .PWDATA      ( s_soc_ctrl_bus.pwdata     ),
      .PWRITE      ( s_soc_ctrl_bus.pwrite     ),
      .PSEL        ( s_soc_ctrl_bus.psel       ),
      .PENABLE     ( s_soc_ctrl_bus.penable    ),
      .PRDATA      ( s_soc_ctrl_bus.prdata     ),
      .PREADY      ( s_soc_ctrl_bus.pready     ),
      .PSLVERR     ( s_soc_ctrl_bus.pslverr    ),

      //.pad_cfg_o   ( pad_cfg_o                  ),
      .clk_gate_o  ( peripheral_clock_gate_ctrl ),
      .pad_mux_o   ( pad_mux_o                  ),
      .boot_addr_o ( boot_addr_o                )
    );

  //////////////////////////////////////////////////////////////////
  ///                                                            ///
  /// APB Slave 8: APB2PER for debug                             ///
  ///                                                            ///
  //////////////////////////////////////////////////////////////////

  apb2per
  #(
    .PER_ADDR_WIDTH ( 15             ),
    .APB_ADDR_WIDTH ( APB_ADDR_WIDTH )
  )
  apb2per_debug_i
  (
    .clk_i                ( clk                   ),
    .rst_ni               ( rst_n                   ),

    .PADDR                ( s_debug_bus.paddr       ),
    .PWDATA               ( s_debug_bus.pwdata      ),
    .PWRITE               ( s_debug_bus.pwrite      ),
    .PSEL                 ( s_debug_bus.psel        ),
    .PENABLE              ( s_debug_bus.penable     ),
    .PRDATA               ( s_debug_bus.prdata      ),
    .PREADY               ( s_debug_bus.pready      ),
    .PSLVERR              ( s_debug_bus.pslverr     ),

    .per_master_req_o     ( debug.req               ),
    .per_master_add_o     ( debug.addr              ),
    .per_master_we_o      ( debug.we                ),
    .per_master_wdata_o   ( debug.wdata             ),
    .per_master_be_o      (                         ),
    .per_master_gnt_i     ( debug.gnt               ),

    .per_master_r_valid_i ( debug.rvalid            ),
    .per_master_r_opc_i   ( '0                      ),
    .per_master_r_rdata_i ( debug.rdata             )
  );
endmodule
