# 5 :4 0x1 AFE_FREQBAND_IO1_A: RX AFE bandwidth selection. 2'b00: <1.5GS/s, 2'b01: 1.5~3GS/s, 2'b10: 3~5GS/s, 2'b11: reserved. 3:2 0x1 AFE_FREQBAND_IO0_A: RX AFE bandwidth selection. 2'b00: <1.5GS/s, 2'b01: 1.5~3GS/s, 2'b10: 3~5GS/s, 2'b11: reserved. 1:0 0x0 AFE_FREQBAND_CLK_A: RX AFE bandwidth selection. 2'b00: <1.5GS/s, 2'b01: 1.5~3GS/s, 2'b10: 3~5GS/s, 2'b11: reserved.

- NVCSI_PHY_3_NVCSI_CIL_A_PAD_CONFIG_0
- Offset: 0x10723
- Byte Offset: 0x41c8c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected

- NVCSI PHY Registers
- SCR Protection: 0
- Reset: 0x00070000 (0b0000,0000,0000,x111,xxxx,0000,0000,0000)
- Bit
- Reset
- Description
0x0 LP_RX_SELECT_IO1_A: LP mode receiver select for partition A lane 1.
- DPHY mode: controls IO1P_A and IO1N_A
CPHY mode: controls IO1P_A, IO1N_A and IOCLKN_A. 0x0 LP_RX_SELECT_IO0_A: LP mode receiver select for partition A lane 0.
- DPHY mode: controls IO0P_A and IO0N_A
CPHY mode: controls IO0P_A, IO0N_A and IOCLKP_A. 0x0 LP_RX_SELECT_CLK_A: LP mode receiver select. 0: Schmitt receiver. 1: self-biased receiver. DPHY mode: controls IOCLKP_A and IOCLKN_A. CPHY mode: dummy. 0x0 E_LPRX_HYS_N_IO1_A: Enable LP-RX hysteresis. 0: enable hysteresis 1: disable hysteresis 0x0 E_LPRX_HYS_N_IO0_A: Enable LP-RX hysteresis. 0: enable hysteresis 1: disable hysteresis 0x0 E_LPRX_HYS_N_CLK_A: Enable LP-RX hysteresis. 0: enable hysteresis 1: disable hysteresis 0x0 E_HS_TERM_N_IO1_A: Enable the HS termination of Partition A Lane 1. 0x0 E_HS_TERM_N_IO0_A: Enable the HS termination of Partition A Lane 0. 0x0 E_HS_TERM_N_CLK_A: Enable the HS termination of Clock partition A. 0x0 E_INPUT_LP_IO1_A:
- Enable LP receiver of Partition A Lane 1
Applicable in both CPHY and DPHY case. 0x0 E_INPUT_LP_IO0_A:
- Enable LP receiver of Partition A Lane 0
Applicable in both CPHY and DPHY case. 0x0 E_INPUT_LP_CLK_A: enable LP receiver of Clock partition A
- Applicable in DPHY case. N/A for CPHY
0x1 PD_CLK_A: Power down for CLk of Partition A.
- Applicable in DPHY case. N/A for CPHY
0x1 PD_IO1_A: Power down for Trio 1 and Lane 1 of Partition A. Applicable in both CPHY and DPHY case.

- NVCSI PHY Registers
- Bit
- Reset
- Description
0x1 PD_IO0_A: Power down for Trio 0 and Lane 0 of Partition A. Applicable in both CPHY and DPHY case. 11:8 0x0 SPARE_CLK_A:
- Spare control bits for pad control. Bit 11 is used as E_PULLDN_CLK_A control
(0 - Pull down of Clock Lane enabled, 1 - Pull down of Clock Lane enabled).
- Functionality of other bits currently not defined. Undefined register bits are
reserved for future use. Pull down may be enabled when Clock Lane is unused to minimized interference. 7:4 0x0 SPARE_IO1_A:
- Spare control bits for pad control. Functionality of other bits currently not
defined. Undefined register bits are reserved for future use. Pull down may be enabled when Data Lane-1 is unused to minimized interference. 3:0 0x0 SPARE_IO0_A:
- Spare control bits for pad control. Functionality of other bits currently not
defined. Undefined register bits are reserved for future use. Pull down may be enabled when Data Lane-0 is unused to minimized interference.
- NVCSI_PHY_3_NVCSI_CIL_A_PAD_CONFIG_1_0
- Offset: 0x10724
- Byte Offset: 0x41c90
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000002 (0b0000,0000,0000,0000,0000,0000,xx00,0010)
- Bit
- Reset
- Description

