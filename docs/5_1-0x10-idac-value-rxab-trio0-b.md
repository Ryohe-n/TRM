# 5 :1 0x10 IDAC_VALUE_RXAB_TRIO0_B:

- The override value
0x1 SW_SET_IDAC_TRIO0_B:
- Enable the SW override of the IDAC value
- NVCSI_PHY_3_NVCSI_CIL_IDAC_CALIB_DEBUG_0
- Offset: 0x1071b
- Byte Offset: 0x41c6c
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000XXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X
- ZI_HSRX_RXCA_TRIO1_B
X
- ZI_HSRX_RXBC_TRIO1_B
X
- ZI_HSRX_RXAB_TRIO1_B
X
- ZI_HSRX_RXCA_TRIO0_B
X
- ZI_HSRX_RXBC_TRIO0_B
X
- ZI_HSRX_RXAB_TRIO0_B
X
- ZI_HSRX_RXCA_TRIO1_A
X
- ZI_HSRX_RXBC_TRIO1_A
X
- ZI_HSRX_RXAB_TRIO1_A
X
- ZI_HSRX_RXCA_TRIO0_A
X
- ZI_HSRX_RXBC_TRIO0_A
X
- ZI_HSRX_RXAB_TRIO0_A
- NVCSI_PHY_3_NVCSI_CIL_TEST_CONTROL_0
- Offset: 0x1071c
- Byte Offset: 0x41c70

- NVCSI PHY Registers
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 HS_EN_DATA_LANE1_B:
- Force to enable the e_input_hs of the data lane b1, used for impedance
measurements of HS mode 0x0 HS_EN_DATA_LANE0_B:
- Force to enable the e_input_hs of the data lane b0, used for impedance
measurements of HS mode 0x0 HS_EN_DATA_LANE1_A:
- Force to enable the e_input_hs of the data lane a1, used for impedance
measurements of HS mode 0x0 HS_EN_DATA_LANE0_A:
- Force to enable the e_input_hs of the data lane a0, used for impedance
measurements of HS mode 0x0 HS_EN_CLK_LANE_B:
- Force to enable the e_input_hs of the clock lane b, used for impedance
measurements of HS mode 0x0 HS_EN_CLK_LANE_A:
- Force to enable the e_input_hs of the clock lane a, used for impedance
measurements of HS mode
- NVCSI_PHY_3_NVCSI_CIL_PULLDN_CONTROL_0
- Offset: 0x1071d
- Byte Offset: 0x41c74
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 E_PULLDN_IO1_B 0x0 E_PULLDN_IO0_B 0x0 E_PULLDN_IO1_A 0x0 E_PULLDN_IO0_A 0x0 E_PULLDN_CLK_B

- NVCSI PHY Registers
- Bit
- Reset
- Description
0x0 E_PULLDN_CLK_A
- NVCSI_PHY_3_NVCSI_CIL_SPARE_0
- Spare register
- Offset: 0x1071e
- Byte Offset: 0x41c78
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

