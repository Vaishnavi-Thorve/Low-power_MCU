module sp_ram
  #(
    parameter ADDR_WIDTH = 15,
    parameter DATA_WIDTH = 32,
    parameter NUM_WORDS  = 256
  )(
    // Clock and Reset
    input  logic                    clk,
    input  logic                    en_i,
    input  logic [ADDR_WIDTH-1:0]   addr_i,
    input  logic [DATA_WIDTH-1:0]   wdata_i,
    output logic [DATA_WIDTH-1:0]   rdata_o,
    input  logic                    we_i,
    input  logic [DATA_WIDTH/8-1:0] be_i
  );

  
  
  logic [3:0][3:0]    sram_ready;
  logic [3:0]         sram_row_en;
  logic               sram_tbypass;
  logic [3:0][7:0]    sram_row_o[4];                 //[3:0][7:0] is a multidimentional packed array make a 32 bit [4] rows is the unpacked dimension 
  logic [1:0]         addr_row_sel;

  assign sram_tbypass = 1'b0;

  // Taking adddresses [14:13] for row allocations
  always @(posedge clk) begin                               //Delaying it one clock cycle
    addr_row_sel <= addr_i[14:13];
  end

  // choosing SRAM banks based on the given address
  always @(*) begin
    if (en_i) begin
      case (addr_i[14:13]) 
        2'b00   :   sram_row_en = 4'b1110;
        2'b01   :   sram_row_en = 4'b1101;
        2'b10   :   sram_row_en = 4'b1011;
        2'b11   :   sram_row_en = 4'b0111; 
      endcase
    end else begin
      sram_row_en = 4'b1111;
    end
  end

  // generate 16 RAM cells
  genvar x,y;
  generate
    for (x=0; x<4; x++) begin: ram_row                    //Ram row
      for (y=0; y<4; y++) begin: ram_byte                 //Ram byte
        ST_SPHDL_2048x8m8_L sram
        (
          .Q        ( sram_row_o[x][y]          ),
          .RY       ( sram_ready[x][y]          ),
          .CK       ( clk                       ),
          .CSN      ( sram_row_en[x]            ),
          .TBYPASS  ( sram_tbypass              ),
          .WEN      ( ~(we_i & be_i[y])         ),
          .A        ( addr_i[12:2]              ),
          .D        ( wdata_i[(y+1)*8-1:y*8]    )
        );
      end
    end
  endgenerate

  // Multiplex output from all rows into one
  always @(*) begin
    case (addr_row_sel) 
      2'b00   :   rdata_o = sram_row_o[0];
      2'b01   :   rdata_o = sram_row_o[1];
      2'b10   :   rdata_o = sram_row_o[2];
      2'b11   :   rdata_o = sram_row_o[3]; 
    endcase
  end
endmodule
