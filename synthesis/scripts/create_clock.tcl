# ALL values are in picosecond

#Setting clock frequencies

#25MHz
set PERIOD_pulp 40000   
#13MHz
set PERIOD_spi 76924   
#~13MHz
set PERIOD_jtag 76924	

#Common parameters
set ClkDomain $DESIGN
set ClkTop $DESIGN
set ClkLatency 500
set ClkRise_uncertainty 200
set ClkFall_uncertainty 200
set ClkSlew 500
set InputDelay 500
set OutputDelay 500

#Pulp clock
set ClkName clk

#SPI clock
set ClkName_spi spi_clk_i

#Jtag clock
set ClkName_jtag tck_i

# Remember to change the -port ClkxC* to the actual name of clock port/pin in your design

#Pulp clk
define_clock -name $ClkName -period $PERIOD_pulp -design $ClkTop -domain $ClkDomain [find / -port clk_in*]

set_attribute clock_network_late_latency $ClkLatency $ClkName
set_attribute clock_source_late_latency  $ClkLatency $ClkName 

set_attribute clock_setup_uncertainty $ClkLatency $ClkName
set_attribute clock_hold_uncertainty $ClkLatency $ClkName 

set_attribute slew_rise $ClkRise_uncertainty $ClkName 
set_attribute slew_fall $ClkFall_uncertainty $ClkName
 
external_delay -input $InputDelay  -clock [find / -clock $ClkName] -name in_con  [find /des* -port ports_in/*]
external_delay -output $OutputDelay -clock [find / -clock $ClkName] -name out_con [find /des* -port ports_out/*]

#SPI clk
define_clock -name $ClkName_spi -period $PERIOD_spi -design $ClkTop -domain $ClkDomain [find / -port clk_in*]

set_attribute clock_network_late_latency $ClkLatency $ClkName_spi
set_attribute clock_source_late_latency  $ClkLatency $ClkName_spi 

set_attribute clock_setup_uncertainty $ClkLatency $ClkName_spi
set_attribute clock_hold_uncertainty $ClkLatency $ClkName_spi 

set_attribute slew_rise $ClkRise_uncertainty $ClkName_spi
set_attribute slew_fall $ClkFall_uncertainty $ClkName_spi
 
external_delay -input $InputDelay  -clock [find / -clock $ClkName_spi] -name in_con  [find /des* -port ports_in/*]
external_delay -output $OutputDelay -clock [find / -clock $ClkName_spi] -name out_con [find /des* -port ports_out/*]

#Jtag clock
define_clock -name $ClkName_jtag -period $PERIOD_jtag -design $ClkTop -domain $ClkDomain [find / -port clk_in*]

set_attribute clock_network_late_latency $ClkLatency $ClkName_jtag
set_attribute clock_source_late_latency  $ClkLatency $ClkName_jtag

set_attribute clock_setup_uncertainty $ClkLatency $ClkName_jtag
set_attribute clock_hold_uncertainty $ClkLatency $ClkName_jtag

set_attribute slew_rise $ClkRise_uncertainty $ClkName_jtag 
set_attribute slew_fall $ClkFall_uncertainty $ClkName_jtag
 
external_delay -input $InputDelay  -clock [find / -clock $ClkName_jtag] -name in_con  [find /des* -port ports_in/*]
external_delay -output $OutputDelay -clock [find / -clock $ClkName_jtag] -name out_con [find /des* -port ports_out/*]

#Setting 3 asynchronous clock domains:
set_clock_groups -asynchronous -group $ClkName -group $ClkName_spi -group $ClkName_jtag
