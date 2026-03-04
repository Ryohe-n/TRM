# 15 :12 0x0 LOADADJ:

- LOAD ADJ value to be connected to the pad
not used for CSI functional mode. used only for IO bist 0x1 PDVCLAMP:
- Power down regular which supplies current to de-serializer logic. Active
High. 7:5 0x0
- SEL_CKTEST
0x0 E_CKTEST: Enable clock test output. 3:1 0x0
- SEL_ATEST
0x0 E_ATEST: Enable analog test voltage output.
- NVCSI_PHY_3_NVCSI_CIL_PAD_CONFIG_1_0
- Offset: 0x10707
- Byte Offset: 0x41c1c
- Read/Write: R/W
- Parity Protection: Y

- NVCSI PHY Registers
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

