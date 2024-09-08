library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hps_fpga_template_top is
   port(
      -- ADC
      --ADC_CONVST  : out std_logic;
      --ADC_DIN     : out std_logic;
      --ADC_DOUT    : in std_logic;
      --ADC_SCLK    : out std_logic;
      
      -- Audio
      --AUD_ADCDAT  : in  std_logic;
      --AUD_ADCLRCK : inout std_logic;
      --AUD_BCLK    : inout std_logic;
      --AUD_DACDAT  : out std_logic;
      --AUD_DACLRCK : inout std_logic;
      --AUD_XCK     : out std_logic;
      
      -- CLOCK
      --CLOCK2_50   : in std_logic;
      --CLOCK3_50   : in std_logic;
      --CLOCK4_50   : in std_logic;
      CLOCK_50    : in std_logic;
      
      -- DRAM
      --DRAM_ADDR   : out std_logic_vector(12 downto 0);
      --DRAM_BA     : out std_logic_vector(1 downto 0);
      --DRAM_CAS_N  : out std_logic;
      --DRAM_CKE    : out std_logic;
      --DRAM_CLK    : out std_logic;
      --DRAM_CS_N   : out std_logic;
      --DRAM_DQ     : inout std_logic_vector(15 downto 0);
      --DRAM_LDQM   : out std_logic;
      --DRAM_RAS_N  : out std_logic;
      --DRAM_UDQM   : out std_logic;
      --DRAM_WE_N   : out std_logic;
      
      -- I2C for Audio and Video-In
      --FPGA_I2C_SCLK: out std_logic;
      --FPGA_I2C_SDAT: inout std_logic;
      
      -- SEG7
      --HEX0        : out std_logic_vector(6 downto 0);
      --HEX1        : out std_logic_vector(6 downto 0);
      --HEX2        : out std_logic_vector(6 downto 0);
      --HEX3        : out std_logic_vector(6 downto 0);
      --HEX4        : out std_logic_vector(6 downto 0);
      --HEX5        : out std_logic_vector(6 downto 0);
      
      -- IR
      --IRDA_RXD    : in std_logic;
      --IRDA_TXD    : out std_logic;
      
      -- KEY
      --KEY         : in std_logic_vector(3 downto 0);
      
      -- LED
      LEDR        : out std_logic_vector(9 downto 0);
      
      -- PS2
      --PS2_CLK     : inout std_logic;
      --PS2_CLK2    : inout std_logic;
      --PS2_DAT     : inout std_logic;
      --PS2_DAT2    : inout std_logic;
      
      -- SW
      SW          : in std_logic_vector(9 downto 0);
      
      -- Video-In
      --TD_CLK27    : in std_logic;
      --TD_DATA     : in std_logic_vector(7 downto 0);
      --TD_HS       : in std_logic;
      --TD_RESET_N  : out std_logic;
      --TD_VS       : in std_logic;
      
      -- VGA
      --VGA_BLANK_N : out std_logic;
      --VGA_B       : out std_logic_vector(7 downto 0);
      --VGA_CLK     : out std_logic;
      --VGA_G       : out std_logic_vector(7 downto 0);
      --VGA_HS      : out std_logic;
      --VGA_R       : out std_logic_vector(7 downto 0);
      --VGA_SYNC_N  : out std_logic;
      --VGA_VS      : out std_logic;
      
      -- UART (revH or later only)
      --UART_CTS    : in std_logic;
      --UART_RTS    : out std_logic;
      --UART_RX     : in std_logic;
      --UART_TX     : out std_logic;
      
      -- QSPI Flash (revH or later only)
      --QSPI_FLASH_CE_n: out std_logic;
      --QSPI_FLASH_DATA: inout std_logic_vector(3 downto 0);
      --QSPI_FLASH_SCLK: out std_logic;
      
      -- RISC-V JTAG (revH or later only)
      --RISCV_JTAG_TCK : in std_logic;
      --RISCV_JTAG_TDI : in std_logic;
      --RISCV_JTAG_TDO : out std_logic;
      --RISCV_JTAG_TMS : in std_logic;
      
      -- HPS
      --HPS_CONV_USB_N : inout std_logic;
      HPS_DDR3_ADDR  : out std_logic_vector(14 downto 0);
      HPS_DDR3_BA    : out std_logic_vector(2 downto 0);
      HPS_DDR3_CAS_N : out std_logic;
      HPS_DDR3_CKE   : out std_logic;
      HPS_DDR3_CK_N  : out std_logic;
      HPS_DDR3_CK_P  : out std_logic;
      HPS_DDR3_CS_N  : out std_logic;
      HPS_DDR3_DM    : out std_logic_vector(3 downto 0);
      HPS_DDR3_DQ    : inout std_logic_vector(31 downto 0);
      HPS_DDR3_DQS_N : inout std_logic_vector(3 downto 0);
      HPS_DDR3_DQS_P : inout std_logic_vector(3 downto 0);
      HPS_DDR3_ODT   : out std_logic;
      HPS_DDR3_RAS_N : out std_logic;
      HPS_DDR3_RESET_N: out std_logic;
      HPS_DDR3_RZQ   : in std_logic;
      HPS_DDR3_WE_N  : out std_logic;
      HPS_ENET_GTX_CLK: out std_logic;
      HPS_ENET_INT_N : inout std_logic;
      HPS_ENET_MDC   : out std_logic;
      HPS_ENET_MDIO  : inout std_logic;
      HPS_ENET_RX_CLK: in std_logic;
      HPS_ENET_RX_DATA: in std_logic_vector(3 downto 0);
      HPS_ENET_RX_DV : in std_logic;
      HPS_ENET_TX_DATA: out std_logic_vector(3 downto 0);
      HPS_ENET_TX_EN : out std_logic;
      --HPS_FLASH_DATA : inout std_logic_vector(3 downto 0);
      --HPS_FLASH_DCLK : out std_logic;
      --HPS_FLASH_NCSO : out std_logic;
      --HPS_GSENSOR_INT: inout std_logic;
      --HPS_I2C1_SCLK  : inout std_logic;
      --HPS_I2C1_SDAT  : inout std_logic;
      --HPS_I2C2_SCLK  : inout std_logic;
      --HPS_I2C2_SDAT  : inout std_logic;
      --HPS_I2C_CONTROL: inout std_logic;
      --HPS_KEY        : inout std_logic;
      --HPS_LED        : inout std_logic;
      --HPS_LTC_GPIO   : inout std_logic;
      HPS_SD_CLK     : out std_logic;
      HPS_SD_CMD     : inout std_logic;
      HPS_SD_DATA    : inout std_logic_vector(3 downto 0);
      --HPS_SPIM_CLK   : out std_logic;
      --HPS_SPIM_MISO  : in std_logic;
      --HPS_SPIM_MOSI  : out std_logic;
      --HPS_SPIM_SS    : inout std_logic;
      HPS_UART_RX    : in std_logic;
      HPS_UART_TX    : out std_logic;
      HPS_USB_CLKOUT : in std_logic;
      HPS_USB_DATA   : inout std_logic_vector(7 downto 0);
      HPS_USB_DIR    : in std_logic;
      HPS_USB_NXT    : in std_logic;
      HPS_USB_STP    : out std_logic);
end hps_fpga_template_top;

architecture hps_fpga_template_top_rtl of hps_fpga_template_top is   
   component hps_fpga is
        port (
            clk_clk                             : in    std_logic                     := 'X';             -- clk
            hps_io_hps_io_emac1_inst_TX_CLK     : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
            hps_io_hps_io_emac1_inst_TXD0       : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
            hps_io_hps_io_emac1_inst_TXD1       : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
            hps_io_hps_io_emac1_inst_TXD2       : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
            hps_io_hps_io_emac1_inst_TXD3       : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
            hps_io_hps_io_emac1_inst_RXD0       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
            hps_io_hps_io_emac1_inst_MDIO       : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
            hps_io_hps_io_emac1_inst_MDC        : out   std_logic;                                        -- hps_io_emac1_inst_MDC
            hps_io_hps_io_emac1_inst_RX_CTL     : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
            hps_io_hps_io_emac1_inst_TX_CTL     : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
            hps_io_hps_io_emac1_inst_RX_CLK     : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
            hps_io_hps_io_emac1_inst_RXD1       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
            hps_io_hps_io_emac1_inst_RXD2       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
            hps_io_hps_io_emac1_inst_RXD3       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
            hps_io_hps_io_sdio_inst_CMD         : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
            hps_io_hps_io_sdio_inst_D0          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
            hps_io_hps_io_sdio_inst_D1          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
            hps_io_hps_io_sdio_inst_CLK         : out   std_logic;                                        -- hps_io_sdio_inst_CLK
            hps_io_hps_io_sdio_inst_D2          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
            hps_io_hps_io_sdio_inst_D3          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
            hps_io_hps_io_usb1_inst_D0          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
            hps_io_hps_io_usb1_inst_D1          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
            hps_io_hps_io_usb1_inst_D2          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
            hps_io_hps_io_usb1_inst_D3          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
            hps_io_hps_io_usb1_inst_D4          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
            hps_io_hps_io_usb1_inst_D5          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
            hps_io_hps_io_usb1_inst_D6          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
            hps_io_hps_io_usb1_inst_D7          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
            hps_io_hps_io_usb1_inst_CLK         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
            hps_io_hps_io_usb1_inst_STP         : out   std_logic;                                        -- hps_io_usb1_inst_STP
            hps_io_hps_io_usb1_inst_DIR         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
            hps_io_hps_io_usb1_inst_NXT         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
            hps_io_hps_io_uart0_inst_RX         : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
            hps_io_hps_io_uart0_inst_TX         : out   std_logic;                                        -- hps_io_uart0_inst_TX
            hps_io_hps_io_gpio_inst_GPIO35      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
            memory_mem_a                        : out   std_logic_vector(14 downto 0);                    -- mem_a
            memory_mem_ba                       : out   std_logic_vector(2 downto 0);                     -- mem_ba
            memory_mem_ck                       : out   std_logic;                                        -- mem_ck
            memory_mem_ck_n                     : out   std_logic;                                        -- mem_ck_n
            memory_mem_cke                      : out   std_logic;                                        -- mem_cke
            memory_mem_cs_n                     : out   std_logic;                                        -- mem_cs_n
            memory_mem_ras_n                    : out   std_logic;                                        -- mem_ras_n
            memory_mem_cas_n                    : out   std_logic;                                        -- mem_cas_n
            memory_mem_we_n                     : out   std_logic;                                        -- mem_we_n
            memory_mem_reset_n                  : out   std_logic;                                        -- mem_reset_n
            memory_mem_dq                       : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
            memory_mem_dqs                      : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
            memory_mem_dqs_n                    : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
            memory_mem_odt                      : out   std_logic;                                        -- mem_odt
            memory_mem_dm                       : out   std_logic_vector(3 downto 0);                     -- mem_dm
            memory_oct_rzqin                    : in    std_logic                     := 'X';             -- oct_rzqin
            pio_leds_external_connection_export : out   std_logic_vector(9 downto 0)                      -- export
        );
    end component hps_fpga;
begin
    u0 : component hps_fpga
        port map (
            clk_clk                             => CLOCK_50,                  -- clk.clk
            hps_io_hps_io_emac1_inst_TX_CLK     => HPS_ENET_GTX_CLK,          -- hps_io.hps_io_emac1_inst_TX_CLK
            hps_io_hps_io_emac1_inst_TXD0       => HPS_ENET_TX_DATA(0),       -- .hps_io_emac1_inst_TXD0
            hps_io_hps_io_emac1_inst_TXD1       => HPS_ENET_TX_DATA(1),       -- .hps_io_emac1_inst_TXD1
            hps_io_hps_io_emac1_inst_TXD2       => HPS_ENET_TX_DATA(2),       -- .hps_io_emac1_inst_TXD2
            hps_io_hps_io_emac1_inst_TXD3       => HPS_ENET_TX_DATA(3),       -- .hps_io_emac1_inst_TXD3
            hps_io_hps_io_emac1_inst_RXD0       => HPS_ENET_RX_DATA(0),       -- .hps_io_emac1_inst_RXD0
            hps_io_hps_io_emac1_inst_MDIO       => HPS_ENET_MDIO,             -- .hps_io_emac1_inst_MDIO
            hps_io_hps_io_emac1_inst_MDC        => HPS_ENET_MDC,              -- .hps_io_emac1_inst_MDC
            hps_io_hps_io_emac1_inst_RX_CTL     => HPS_ENET_RX_DV,            -- .hps_io_emac1_inst_RX_CTL
            hps_io_hps_io_emac1_inst_TX_CTL     => HPS_ENET_TX_EN,            -- .hps_io_emac1_inst_TX_CTL
            hps_io_hps_io_emac1_inst_RX_CLK     => HPS_ENET_RX_CLK,           -- .hps_io_emac1_inst_RX_CLK
            hps_io_hps_io_emac1_inst_RXD1       => HPS_ENET_RX_DATA(1),       -- .hps_io_emac1_inst_RXD1
            hps_io_hps_io_emac1_inst_RXD2       => HPS_ENET_RX_DATA(2),       -- .hps_io_emac1_inst_RXD2
            hps_io_hps_io_emac1_inst_RXD3       => HPS_ENET_RX_DATA(3),       -- .hps_io_emac1_inst_RXD3
            hps_io_hps_io_sdio_inst_CMD         => HPS_SD_CMD,                -- .hps_io_sdio_inst_CMD
            hps_io_hps_io_sdio_inst_D0          => HPS_SD_DATA(0),            -- .hps_io_sdio_inst_D0
            hps_io_hps_io_sdio_inst_D1          => HPS_SD_DATA(1),            -- .hps_io_sdio_inst_D1
            hps_io_hps_io_sdio_inst_CLK         => HPS_SD_CLK,                -- .hps_io_sdio_inst_CLK
            hps_io_hps_io_sdio_inst_D2          => HPS_SD_DATA(2),            -- .hps_io_sdio_inst_D2
            hps_io_hps_io_sdio_inst_D3          => HPS_SD_DATA(3),            -- .hps_io_sdio_inst_D3
            hps_io_hps_io_usb1_inst_D0          => HPS_USB_DATA(0),           -- .hps_io_usb1_inst_D0
            hps_io_hps_io_usb1_inst_D1          => HPS_USB_DATA(1),           -- .hps_io_usb1_inst_D1
            hps_io_hps_io_usb1_inst_D2          => HPS_USB_DATA(2),           -- .hps_io_usb1_inst_D2
            hps_io_hps_io_usb1_inst_D3          => HPS_USB_DATA(3),           -- .hps_io_usb1_inst_D3
            hps_io_hps_io_usb1_inst_D4          => HPS_USB_DATA(4),           -- .hps_io_usb1_inst_D4
            hps_io_hps_io_usb1_inst_D5          => HPS_USB_DATA(5),           -- .hps_io_usb1_inst_D5
            hps_io_hps_io_usb1_inst_D6          => HPS_USB_DATA(6),           -- .hps_io_usb1_inst_D6
            hps_io_hps_io_usb1_inst_D7          => HPS_USB_DATA(7),           -- .hps_io_usb1_inst_D7
            hps_io_hps_io_usb1_inst_CLK         => HPS_USB_CLKOUT,            -- .hps_io_usb1_inst_CLK
            hps_io_hps_io_usb1_inst_STP         => HPS_USB_STP,               -- .hps_io_usb1_inst_STP
            hps_io_hps_io_usb1_inst_DIR         => HPS_USB_DIR,               -- .hps_io_usb1_inst_DIR
            hps_io_hps_io_usb1_inst_NXT         => HPS_USB_NXT,               -- .hps_io_usb1_inst_NXT
            hps_io_hps_io_uart0_inst_RX         => HPS_UART_RX,               -- .hps_io_uart0_inst_RX
            hps_io_hps_io_uart0_inst_TX         => HPS_UART_TX,               -- .hps_io_uart0_inst_TX
            hps_io_hps_io_gpio_inst_GPIO35      => HPS_ENET_INT_N,            -- .hps_io_gpio_inst_GPIO35
            memory_mem_a                        => HPS_DDR3_ADDR,             -- memory.mem_a
            memory_mem_ba                       => HPS_DDR3_BA,               -- .mem_ba
            memory_mem_ck                       => HPS_DDR3_CK_P,             -- .mem_ck
            memory_mem_ck_n                     => HPS_DDR3_CK_N,             -- .mem_ck_n
            memory_mem_cke                      => HPS_DDR3_CKE,              -- .mem_cke
            memory_mem_cs_n                     => HPS_DDR3_CS_N,             -- .mem_cs_n
            memory_mem_ras_n                    => HPS_DDR3_RAS_N,            -- .mem_ras_n
            memory_mem_cas_n                    => HPS_DDR3_CAS_N,            -- .mem_cas_n
            memory_mem_we_n                     => HPS_DDR3_WE_N,             -- .mem_we_n
            memory_mem_reset_n                  => HPS_DDR3_RESET_N,          -- .mem_reset_n
            memory_mem_dq                       => HPS_DDR3_DQ,               -- .mem_dq
            memory_mem_dqs                      => HPS_DDR3_DQS_P,            -- .mem_dqs
            memory_mem_dqs_n                    => HPS_DDR3_DQS_N,            -- .mem_dqs_n
            memory_mem_odt                      => HPS_DDR3_ODT,              -- .mem_odt
            memory_mem_dm                       => HPS_DDR3_DM,               -- .mem_dm
            memory_oct_rzqin                    => HPS_DDR3_RZQ,              -- .oct_rzqin
            pio_leds_external_connection_export => LEDR                       -- pio_leds_external_connection.export
        );
end hps_fpga_template_top_rtl;