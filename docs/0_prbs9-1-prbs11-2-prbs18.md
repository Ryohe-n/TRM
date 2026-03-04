# 0 = PRBS9 1 = PRBS11 2 = PRBS18

- MODE1
BIST_MODE:
- BIST control mode
- MODE0: Set the expected error number, BIST logic will keep comparing
the received symbols and the reference PRBS generated symbols. When the expected error number got, BIST logic stop. And report how many word are totally compared.
- MODE11: Set the expected word number, BIST logic will keep comparing
the received symbols and the reference PRBS generated symbols. When the expected words(symbols) are compared, BIST logic stop and report how many errors are found. 0 = MODE0 1 = MODE1

- NVCSI PHY Registers
- NVCSI_PHY_3_NVCSI_CIL_CPHY_BIST_CONFIG_1_0
- Offset: 0x10711
- Byte Offset: 0x41c44
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000100 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxx1,0000,0000)
- Bit
- Reset
- Description
0x1 ERR_TYPE: The expecte error number type. SYMBOL_NUM: symbol error number. 0 = WORD_NUM :WORD_NUM: word error number. 1 = SYMBOL_NUM 7:0 0x0 ERR_NUM: The expected error number, used for BIST MODE 0.
- NVCSI_PHY_3_NVCSI_CIL_CPHY_BIST_CONFIG_2_0
- Offset: 0x10712
- Byte Offset: 0x41c48
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

