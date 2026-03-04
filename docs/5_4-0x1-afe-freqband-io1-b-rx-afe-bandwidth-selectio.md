# 5 :4 0x1 AFE_FREQBAND_IO1_B: RX AFE bandwidth selection. 2'b00: <1.5GS/s, 2'b01: 1.5~3GS/s, 2'b10: 3~5GS/s, 2'b11: reserved. 3:2 0x1 AFE_FREQBAND_IO0_B: RX AFE bandwidth selection. 2'b00: <1.5GS/s, 2'b01: 1.5~3GS/s, 2'b10: 3~5GS/s, 2'b11: reserved. 1:0 0x0 AFE_FREQBAND_CLK_B: RX AFE bandwidth selection. 2'b00: <1.5GS/s, 2'b01: 1.5~3GS/s, 2'b10: 3~5GS/s, 2'b11: reserved.

- NVCSI_PHY_3_NVCSI_CIL_B_PAD_CONFIG_0
- Offset: 0x10763
- Byte Offset: 0x41d8c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00070000 (0b0000,0000,0000,x111,xxxx,0000,0000,0000)
- Bit
- Reset
- Description
0x0 LP_RX_SELECT_IO1_B: LP mode receiver select for partition B lane 1.
- DPHY mode: controls IO1P_B and IO1N_B
CPHY mode: controls IO1P_B, IO1N_B and IOCLKN_B. 0x0 LP_RX_SELECT_IO0_B: LP mode receiver select for partition B lane 0.
- DPHY mode: controls IO0P_B and IO0N_B
CPHY mode: controls IO0P_B, IO0N_B and IOCLKP_B. 0x0 LP_RX_SELECT_CLK_B: LP mode receiver select. 0: Schmitt receiver. 1: self-biased receiver. DPHY mode: controls IOCLKP_B and IOCLKN_B. CPHY mode: dummy.

- NVCSI PHY Registers
- Bit
- Reset
- Description
0x0 E_LPRX_HYS_N_IO1_B: Enable LP-RX hysteresis. 0: enable hysteresis 1: disable hysteresis 0x0 E_LPRX_HYS_N_IO0_B: Enable LP-RX hysteresis. 0: enable hysteresis 1: disable hysteresis 0x0 E_LPRX_HYS_N_CLK_B: Enable LP-RX hysteresis. 0: enable hysteresis 1: disable hysteresis 0x0 E_HS_TERM_N_IO1_B: Enable the HS termination of Partition B Lane 1. 0x0 E_HS_TERM_N_IO0_B: Enable the HS termination of Partition B Lane 0. 0x0 E_HS_TERM_N_CLK_B: Enable the HS termination of Clock partition B. 0x0 E_INPUT_LP_IO1_B:
- Enable LP receiver of Partition B Lane 1
Applicable in both CPHY and DPHY case. 0x0 E_INPUT_LP_IO0_B:
- Enable LP receiver of Partition B Lane 0
Applicable in both CPHY and DPHY case. 0x0 E_INPUT_LP_CLK_B: enable LP receiver of Clock partition B
- Applicable in DPHY case. N/A for CPHY
0x1 PD_CLK_B: Power down for CLk of Partition B.
- Applicable in DPHY case. N/A for CPHY
0x1 PD_IO1_B: Power down for Trio 1 and Lane 1 of Partition B. Applicable in both CPHY and DPHY case. 0x1 PD_IO0_B: Power down for Trio 0 and Lane 0 of Partition B. Applicable in both CPHY and DPHY case. 11:8 0x0 SPARE_CLK_B:
- Spare control bits for pad control. Functionality of other bits currently not
defined. Undefined register bits are reserved for future use. Pull down may be enabled when Clock Lane is unused to minimized interference. 7:4 0x0 SPARE_IO1_B:
- Spare control bits for pad control. Functionality of other bits currently not
defined. Undefined register bits are reserved for future use. Pull down may be enabled when Data Lane-1 is unused to minimized interference.

- NVCSI PHY Registers
- Bit
- Reset
- Description

