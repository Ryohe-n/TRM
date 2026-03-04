# 0 = DISABLE 1 = ENABLE Notes: 1. Interrupt enable for RXS interrupt (IE_RXS) should be disabled whenever LSR is polled/read to avoid spurious interrupts because of errors detected in receive data. LSR read is an interrupt clearing mechanism for RXS errors.

- In the UART controller, status registers are also masked with corresponding IE bits unlike
conventional controller's implementation. Disable the RXT interrupt before issuing an Rx FIFO flush request. Enable RXT after the flush is done. 2. 3. Interrupt mapping of different UART instances is listed in the table below.
- Interface
- Interrupt Mapping
- UART1
- LIC
- UART2
- LIC
- UART3
- LIC, BPMP, SPE
- UART4
- LIC
- UART5
- LIC
- UART6
- LIC, SPE
- UART8
- LIC, SPE

- Universal Asynchronous Receiver/Transmitter (UART)
#### 10.12.2.20 FIFO Flushing Guidelines
The UART controller provides TX_CLR and RX_CLR bits to flush the FIFOs. The FIFOs can be flushed independently or simultaneously by following the programming guidelines below:
##### 10.12.2.20.1 Non-loopback Node
- Simultaneous flush (TX_FLUSH and RX_FLUSH in single register write)
1. 2. 3. 4. 5. Make sure there is no new data being written to TX_buffer. Program rts_enable to 0 (MCR[6]). Make sure MCR[1] is 0. Wait for 1 character time.
- Issue flush requests - Program TX_CLR to 1 and RX_CLR to 1 (UART_IIR_FCR_0[2],
UART_IIR_FCR_0[1]). Poll for TMTY to be '1' (UART_LSR_0[6]). Poll for RDR to be '0' (UART_LSR_0[0]). Re-enable rts_enable MCR[6]. Perform new transfers. 6. 7. 8. 9.
##### 10.12.2.20.2 Independent Flush Operations (Tx/Rx separately)
Tx flush: 1. 2. 3. 4. Make sure there is no new data being written to TX_buffer. Program TX_CLR to 1 (UART_IIR_FCR_0[2] - TX_FLUSH request). Poll for TMTY to be '1' (UART_LSR_0[6]). Perform new transfers. Rx flush: 1. 2. 3. 4. 5. 6. 7. Program rts_enable to 0 (MCR[6]). Make sure MCR[1] is 0. Wait for 1 character time. Program RX_CLR to 1 (UART_IIR_FCR_0[1] - RX_FLUSH request). Poll for RDR to be '0' (UART_LSR_0[0]). Re-enable rts_enable MCR[6]. Perform new transfers.

- Universal Asynchronous Receiver/Transmitter (UART)
##### 10.12.2.20.3 Loopback Mode
Simultaneous flush operations do not work (TX_FLUSH and RX_FLUSH in a single register write). The only option is to disable the FIFO mode bit. Two independent flushes to be issued as mentioned below to flush both FIFOs: 1. 2. 3. 4. 5. 6. 7. 8. Program rts_enable to 0 (MCR[6]). Make sure MCR[1] is 0. Program TX_CLR to 1 (UART_IIR_FCR_0[2] - TX_FLUSH request). Poll for TMTY to be '1' (UART_LSR_0[6]). Program RX_CLR to 1 (UART_IIR_FCR_0[1] - RX_FLUSH request). Poll for RDR to be '0' (UART_LSR_0[0]). Re-enable rts_enable MCR[6]. Perform new transfers.
#### 10.12.2.21 UART Boot
UART3 is used for boot. The access path is as follows:
- BPMP-R5 → BPMP-NOC → CBB-NOC → AON-NOC → UART
Clock configuration that can be used for UARTC fast boot (@192 MHz baud clock = 12 MHz baud rate) as follows. Clock source options available for UARTC baud clock are:
- PLLP_OUT0, PLLC_OUT0, pllAON_out, PLLC4_muxed (controlled by PLLC4_CLK_SEL), CLK_S,
- CLK_M
To achieve a baud rate as high as 12 MHz, PLLC4 is the right source.
- PLLC4 has three output options, and you can choose PLLC4_OUT2 by programming
- CLK_RST_CONTROLLER_PLLC4_MISC1_0[16:15] = 0x1 (see the Clock Controller chapter for the
details of the CLK_RST_CONTROLLER_PLLC4_MISC1_0 register).
- With an oscillator frequency at 38.4 MHz, a 192 MHz baud clock can be achieved using PLLC4
option as follows:
- Crystal frequency = 38.4 MHz, N = 50, M = 2
- PLLC4_OUT0 = 38.4*(50/2) = 960 MHz (Normal Frequency mode)
- PLLC4_OUT2 = VCO/DIV5 = 960/5 = 192 MHz
- Choosing divisor = 1 (CLK_RST_CONTROLLER_CLK_SOURCE_UARTC_0.UARTC_CLK_DIVISOR = 0),
baud frequency = 192/1 = 192 MHz can be achieved.

- Universal Asynchronous Receiver/Transmitter (UART)
- Set CLK_RST_CONTROLLER_PLLC4_MISC1_0. PLLC4_CLK_SEL[16:15] = 0x1 [To select
- PLLC4_OUT2 which is PLLC4-VCO/5 as the PLLC4_MUXED clock selection]
- Set CLK_RST_CONTROLLER_CLK_SOURCE_UARTC_0. UARTC_CLK_SRC[31:29] = 0x1 [To
select PLLC4_MUXED]
- Set CLK_RST_CONTROLLER_CLK_SOURCE_UARTC_0.UARTC_CLK_DIVISOR = 0x0 [To select
the UART final post-divider value '1,' i.e., the equation is PLL_C4-VCO/5]
- Set CLK_RST_CONTROLLER_CLK_SOURCE_UARTC_0.UARTC_DIV_ENB=0x1 [To select UART
divisor programmed in CAR register] Notes: 1.
- With PLLC4_OUT0 = 998.4 MHz, PLLC4_OUT1 = 332.8 MHz, PLLC4_OUT2=199.68 – normal
EMMC mode selection.
- For Fast boot @ 192 MHz (12 MHz baud), nearest possible value that can be achieved using
- CLK_DIV=0. This gives nearest baud_clk of 199.68 MHz
- Baud clock = PLLC4_OUT2/DIVISOR = (199.68/((0/2)+1)) = 199.68/1 = 199.68 MHz
2. 3.
- Optimized PIO mode programming model to meet fast boot requirement @ 192 MHz baud clock is
as below: RDR generation in the SoC is dependent on trigger setting. So to avoid two reads for each register access as was being done in Boot ROM, use one RDR for every 16-byte read (assuming trigger level set is 16) 1. 2. 3. 4. 5.
- Set Rx trigger level to 16
- Check for RDR
- Issue 16 read data requests to UART
- Go back to step 2
- For any residue bytes which are a non-multiple of 16, read the residue bytes using the
RX_FIFO_EMPTY register available in LSR register.
#### 10.12.2.22 IRDA_CSR Register (UART_IRDA_CSR_0)
The IRDA_CSR register provides configuration bits to enable SIR mode, and pulse width and invert polarity options for CTS/RTS/TXD and RXD pins. Default polarity of TXD/RXD/CTS/RTS pins is active low and usage of invert polarity option reverses polarity to active high. Use the below programming model for the invert_RXD option in case of 4-pin UART: 1. 2. 3. 4.
- Get UART controller out of reset
- Force RTS from the SoC so that data from external device is not sent out
- Program invert_rxd=1 in the SoC
Wait for 1 character time (character sampling may be in progress in the SoC with false start bit interpreted)
- Flush Rx FIFO
5.

- Universal Asynchronous Receiver/Transmitter (UART)
6. 7.
- Release RTS
- Start characters reception from Tx
For the no-flow control case: 1. 2. 3.
- Get UART controller out of reset
- Program invert_rxd=1 in the SoC
Wait for 1 character time (character sampling may be in progress in the SoC with false start bit interpreted)
- Flush Rx FIFO
- Remove external device out of reset
- Start characters reception from Tx
4. 5. 6.
- The same guidelines are applicable when switching the invert_rxd option through register
configuration.
#### 10.12.2.23 Pad and Pinmux Information
The UART uses active-low protocol by default (unless invert rts/cts/txd/rxd options are used). To facilitate sharing with other pads, some of the pins may have pulldown by default. For correct operation, the pins should be pulled up using pad control programming before removing the UART controller from reset.
##### 10.12.2.23.1 UART1/UARTA
UARTA has one pinmux option as the primary interface on UART1 Tx/Rx/RTS/CTS pins.
- PIN
- REGISTER
- PADCTL
I/O PAD
- CTS
- PADCTL_CAM_UART1_CTS_0
- PADCTL_CAM_CFG2TMC_UART1_C
- TS_0
- BDPGLP_JFCR90_VDVXP1P1P1
- RTS
- PADCTL_CAM_UART1_RTS_0
- PADCTL_CAM_CFG2TMC_UART1_R
- TS_0
- BDPGLP_JFCR90_VXVDP1P1P1
- RXD
- PADCTL_CAM_UART1_RX_0
- PADCTL_CAM_CFG2TMC_UART1_R
X_0
- BDPGLPHVIN_EFCR90_VXVDP1P1
- P1
- TXD
- PADCTL_CAM_UART1_TX_0
- PADCTL_CAM_CFG2TMC_UART1_T
X_0
- BDPGLPHVIN_EFCR90_VXVDP1P1
- P1
##### 10.12.2.23.2 UART2/UARTB
UARTB has one pinmux option as the primary interface on UART2 Tx/Rx/RTS/CTS pins.

- Universal Asynchronous Receiver/Transmitter (UART)
- PIN
- REGISTER
- PADCTL
I/O PAD
- CTS
- PADCTL_UART_UART2_CTS_0
- PADCTL_UART_CFG2TMC_UART2_C
- TS_0
- BDPGLP_JFCR90_VDVXP1P1P1
- RTS
- PADCTL_UART_UART2_RTS_0
- PADCTL_UART_CFG2TMC_UART2_R
- TS_0
- BDPGLP_JFCR90_VXVDP1P1P1
- RXD
- PADCTL_UART_UART2_RX_0
- PADCTL_UART_CFG2TMC_UART2_R
X_0
- BDPGLPHVIN_EFCR90_VXVDP1P1
- P1
- TXD
- PADCTL_UART_UART2_TX_0
- PADCTL_UART_CFG2TMC_UART2_T
X_0
- BDPGLPHVIN_EFCR90_VXVDP1P1
- P1
##### 10.12.2.23.3 UART3/UARTC
UARTC has one pinmux option as the primary interface on UART3 Tx/Rx pins.
- PIN
- REGISTER
- PADCTL
I/O PAD
- RXD
- PADCTL_AO_UART3_RX_0
- PADCTL_AO_CFG2TMC_UART3_RX
_0
- BDPGLPHVIN_EFCR90_VDP1P1P1
- TXD
- PADCTL_AO_UART3_TX_0
- PADCTL_AO_CFG2TMC_UART3_TX
_0
- BDPGLPHVIN_EFCR90_VDP1P1P1
##### 10.12.2.23.4 UART4/UARTD
UARTD has one pinmux option as the primary interface on UART4 Tx/Rx/RTS/CTS pins.
- PIN
- REGISTER
- PADCTL
I/O PAD
- CTS
- PADCTL_CONN_UART4_CTS_0
- PADCTL_CONN_CFG2TMC_UART4_
- CTS_0
- BDPGLP_JFCR90_VDVXP1P1P1
- RTS
- PADCTL_CONN_UART4_RTS_0
- PADCTL_CONN_CFG2TMC_UART4_
- RTS_0
- BDPGLP_JFCR90_VXVDP1P1P1
- RXD
- PADCTL_CONN_UART4_RX_0
- PADCTL_CONN_CFG2TMC_UART4_
- RX_0
- BDPGLP_JFCR90_VXVDP1P1P1
- TXD
- PADCTL_CONN_UART4_TX_0
- PADCTL_CONN_CFG2TMC_UART4_T
X_0
- BDPGLP_JFCR90_VXVDP1P1P1
##### 10.12.2.23.5 UART5/UARTE
UARTE has one pinmux option as the primary interface on UART5 Tx/Rx/RTS/CTS pins.
- PIN
- REGISTER
- PADCTL
I/O PAD
- CTS
- PADCTL_UART_UART5_CTS_0
- PADCTL_UART_CFG2TMC_UART5_C
- TS_0
- BDPGLP_JFCR90_VDVXP1P1P1

- Universal Asynchronous Receiver/Transmitter (UART)
- PIN
- REGISTER
- PADCTL
I/O PAD
- RTS
- PADCTL_UART_UART5_RTS_0
- PADCTL_UART_CFG2TMC_UART5_R
- TS_0
- BDPGLP_JFCR90_VXVDP1P1P1
- RXD
- PADCTL_UART_UART5_RX_0
- PADCTL_UART_CFG2TMC_UART5_R
X_0
- BDPGLP_JFCR90_VXVDP1P1P1
- TXD
- PADCTL_UART_UART5_TX_0
- PADCTL_UART_CFG2TMC_UART5_T
X_0
- BDPGLP_JFCR90_VXVDP1P1P1
##### 10.12.2.23.6 UART6/UARTF
I/O pad: BDDPAUX_F3FCR90_VD181818NC UART6 is muxed internally in LSIO with I2C6 that operates on DP-AUX-CH0. Mux Sel is configured in DPAUX_PINMUX_CFG_0 register. I2C6 would be used with DP Aux port and pinmux doesn’t exist for this. I2C vs Aux channel mode selection happens from a register bit field in DP registers.
- Interface has DP_AUX_CH0_P and DP_AUX_CH0_N pins. UART6 would use I2C mode of the DPAUX
pad.
- DPAUX_HYBRID_PADCTL_0
I/O Pad: BDDPAUX_F3FCR90_VD181818NC
- AUX
MODE: 0 = AUX 1 = I2C
- DPAUX_PINMUX_CFG_0
- PINMUX_CFG
This pinmux is implemented in LSIO cluster. It determines the interfaces for I2C6 is connected to real I2C6 or UART6. The pinmux configurations are as follows: 0: DPAUX (Functional / Default) 1: UART6 (Debug) UART is sharing I2C pins internal to LSIO; UART uses I2C mode of pad.
- The signal generated by this register is output of DPAUX and input to LSIO cluster
- Refer to the Display Interfaces: HDMI and DisplayPort chapter for more information on the
DPAUX_HYBRID_PADCTL_0 and DPAUX_PINMUX_CFG_0 registers.

- UART Registers
##### 10.12.2.23.7 UART8/UARTH
UART8 is multiplexed over USB2. Pinmux does not exist for this. UART8 <-> XUSB Pad Macro <-> USB PADLET <-> USB PAD.
- For UART8 to be operational, set either of the following in XUSB_PADCTL_USB2_PAD_MUX_0
register.
- USB2_OTG_PAD_PORT0 = UART
(or)
- USB2_OTG_PAD_PORT1 = UART
- No other PAD programming sequence is needed. Above mentioned settings would configure the
- PAD in test mode as far as UART over USB2 pins is concerned. Note that fields
USB2_OTG_PAD_PORT2 and USB2_OTG_PAD_PORT3 are NA.

