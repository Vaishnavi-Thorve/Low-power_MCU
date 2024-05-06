library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulpio_top_pads is 
    port( clk            : in std_logic;
          rst_n          : in std_logic;
          testmode_i     : in std_logic;
          fetch_enable_i : in std_logic;
          spi_clk_i      : in std_logic;
          spi_cs_i       : in std_logic;
          spi_mode_o     : out std_logic_vector (1 downto 0);
          spi_sdo0_o     : out std_logic;
          spi_sdo1_o     : out std_logic;
	  spi_sdo2_o     : out std_logic;
	  spi_sdo3_o     : out std_logic;
	  spi_sdi0_i     : in std_logic;
	  spi_sdi1_i     : in std_logic;
	  spi_sdi2_i     : in std_logic;
	  spi_sdi3_i     : in std_logic;
	  uart_tx        : out std_logic;
	  uart_rx        : in std_logic;
          uart_rts       : out std_logic;
	  uart_dtr       : out std_logic;
	  uart_cts       : in std_logic;
	  uart_dsr       : in std_logic;
	  gpio_out       : out std_logic;
	  tck_i          : in std_logic;
	  trstn_i        : in std_logic;
	  tms_i          : in std_logic;
	  tdi_i          : in std_logic;
	  tdo_o          : out std_logic
         );
end pulpino_top_pads;

architecture pulpino_top_pads_arch of pulpino_top_pads is 

-- signal definations
	signal clk_sig : std_logic;
	signal rst_n_sig : std_logic;
	signal testmode_i_sig : std_logic;
	signal fetch_enable_i_sig : std_logic;
	signal spi_clk_i_sig : std_logic;
	signal spi_cs_i_sig : std_logic;
	signal spi_mode_o_sig : std_logic_vector(1 downto 0);
	signal spi_sdo0_o_sig : std_logic;
	signal spi_sdo1_o_sig : std_logic;
	signal spi_sdo2_o_sig : std_logic;
	signal spi_sdo3_o_sig : std_logic;
	signal spi_sdi0_i_sig : std_logic;
	signal spi_sdi1_i_sig : std_logic;
	signal spi_sdi2_i_sig : std_logic;
	signal spi_sdi3_i_sig : std_logic;
	signal uart_tx_sig : std_logic;
	signal uart_rx_sig : std_logic;
	signal uart_rts_sig : std_logic;
	signal uart_dtr_sig : std_logic;
	signal uart_cts_sig : std_logic;
	signal uart_dsr_sig : std_logic;
	signal gpio_out_sig : std_logic;
	signal tck_i_sig : std_logic;
	signal trstn_i_sig : std_logic;
	signal tms_i_sig : std_logic;
	signal tdi_i_sig : std_logic;
	signal tdo_o_sig : std_logic;

-- component

component pulpino_top is 
  port(   clk            : in std_logic;
          rst_n          : in std_logic;
          testmode_i     : in std_logic;
          fetch_enable_i : in std_logic;
          spi_clk_i      : in std_logic;
          spi_cs_i       : in std_logic;
          spi_mode_o     : out std_logic_vector (1 downto 0);
          spi_sdo0_o     : out std_logic;
          spi_sdo1_o     : out std_logic;
	  spi_sdo2_o     : out std_logic;
	  spi_sdo3_o     : out std_logic;
	  spi_sdi0_i     : in std_logic;
	  spi_sdi1_i     : in std_logic;
	  spi_sdi2_i     : in std_logic;
	  spi_sdi3_i     : in std_logic;
	  uart_tx        : out std_logic;
	  uart_rx        : in std_logic;
          uart_rts       : out std_logic;
	  uart_dtr       : out std_logic;
	  uart_cts       : in std_logic;
	  uart_dsr       : in std_logic;
	  gpio_out       : out std_logic;
	  tck_i          : in std_logic;
	  trstn_i        : in std_logic;
	  tms_i          : in std_logic;
	  tdi_i          : in std_logic;
	  tdo_o          : out std_logic

);
end component;

component CPAD_S_74x50u_IN is 
    port (
        COREIO : out std_logic;
        PADIO : in std_logic
        );
end component; 

component CPAD_S_74x50u_OUT is 
    port (
        COREIO : in std_logic;
        PADIO : out std_logic
        );
end component; 

begin

clk_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => clk_sig,
        PADIO => clk
        );

rst_n_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => rst_n_sig,
        PADIO => rst_n
        );

testmode_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => testmode_i_sig,
        PADIO => testmode_i
        );

fetch_enable_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => fetch_enable_i_sig,
        PADIO => fetch_enable_i
        );

spi_clk_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => spi_clk_i_sig,
        PADIO => spi_clk_i
        );

spi_cs_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => spi_cs_i_sig,
        PADIO => spi_cs_i
        );

spi_sdi0_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => spi_sdi0_i_sig,
        PADIO => spi_sdi0_i
        );
spi_sdi1_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => spi_sdi1_i_sig,
        PADIO => spi_sdi1_i
        );

spi_sdi2_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => spi_sdi2_i_sig,
        PADIO => spi_sdi2_i
        );

spi_sdi3_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => spi_sdi3_i_sig,
        PADIO => spi_sdi3_i
        );

uart_rx_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => uart_rx_sig,
        PADIO => uart_rx
        );

uart_cts_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => uart_cts_sig,
        PADIO => uart_cts
        );

uart_dsr_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => uart_dsr_sig,
        PADIO => uart_dsr
        );

tck_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => tck_i_sig,
        PADIO => tck_i
        );

trstn_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => trstn_i_sig,
        PADIO => trstn_i
        );

tms_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => tms_i_sig,
        PADIO => tms_i
        );

tdi_i_pad: CPAD_S_74x50u_IN 
    port map(
        COREIO => tdi_i_sig,
        PADIO => tdi_i
        );

spi_mode_o_pads : for i in 0 to 1 generate
spi_mode_o_pads : CPAD_S_74x50u_OUT 
    port map(
        COREIO => spi_mode_o_sig,
        PADIO => spi_mode_o
        );
end generate spi_mode_o_pads;

spi_sdo0_o_pad : CPAD_S_74x50u_OUT 
    port map(
        COREIO => spi_sdo0_o_sig,
        PADIO => spi_sdo0_o
        );

spi_sdo1_o_pad : CPAD_S_74x50u_OUT 
    port map(
        COREIO => spi_sdo1_o_sig,
        PADIO => spi_sdo1_o
        );

spi_sdo2_o_pad : CPAD_S_74x50u_OUT 
    port map(
        COREIO => spi_sdo2_o_sig,
        PADIO => spi_sdo0_o
        );

spi_sdo3_o_pad : CPAD_S_74x50u_OUT 
    port map(
        COREIO => spi_sdo3_o_sig,
        PADIO => spi_sdo0_o
        );

uart_tx_pad : CPAD_S_74x50u_OUT 
    port map(
        COREIO => uart_tx_sig,
        PADIO => uart_tx
        );

uart_rts_pad : CPAD_S_74x50u_OUT 
    port map(
        COREIO => uart_rts_sig,
        PADIO => uart_rts
        );

uart_dtr_pad : CPAD_S_74x50u_OUT 
    port map(
        COREIO => uart_dtr_sig,
        PADIO => uart_dtr
        );

gpio_out_pads : CPAD_S_74x50u_OUT 
    port map(
        COREIO => gpio_out_sig,
        PADIO => gpio_out
        );

tdo_o_pad : CPAD_S_74x50u_OUT 
    port map(
        COREIO => tdo_o_sig,
        PADIO => tdo_o
        );

TOP_module: pulpino_top 

port map (clk            => clk_sig,
          rst_n          => rst_n_sig,
          testmode_i     => testmode_i_sig,
          fetch_enable_i => fetch_enable_i_sig,
          spi_clk_i      => spi_clk_i_sig,
          spi_cs_i       => spi_cs_i_sig
          spi_mode_o     => spi_mode_o_sig,
          spi_sdo0_o     => spi_sdo0_o_sig,
          spi_sdo1_o     => spi_sdo1_o_sig,
	  spi_sdo2_o     => spi_sdo2_o_sig,
	  spi_sdo3_o     => spi_sdo3_o_sig,
	  spi_sdi0_i     => spi_sdi0_i_sig,
	  spi_sdi1_i     => spi_sdi1_i_sig,
	  spi_sdi2_i     => spi_sdi2_i_sig,
	  spi_sdi3_i     => spi_sdi3_i_sig,
	  uart_tx        => uart_tx_sig,
	  uart_rx        => uart_rx_sig,
          uart_rts       => uart_rts_sig,
	  uart_dtr       => uart_dtr_sig,
	  uart_cts       => uart_cts_sig,
	  uart_dsr       => uart_dsr_sig,
	  gpio_out       => gpio_out_sig,
	  tck_i          => tck_i_sig,
	  trstn_i        => trstn_i_sig,
	  tms_i          => tms_i_sig,
	  tdi_i          => tdi_i_sig,
	  tdo_o          => tdo_o_sig

);

end pulpino_top_pads_arch;
