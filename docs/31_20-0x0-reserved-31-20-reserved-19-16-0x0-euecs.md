# 31 :20 0x0 Reserved_31_20: Reserved. 19:16 0x0 EUECS:

- MAC/MTL ECC Uncorrectable Error Counter Status Based on the EMS
field of MTL_ECC_Err_Cntr_Rctl register, this field holds the respective memory's uncorrectable error count value. 15:8 0x0 Reserved_15_8: Reserved. 7:0 0x0 ECECS:
- MAC/MTL ECC Correctable Error Counter Status Based on the EMS field
of MTL_ECC_Err_Cntr_Rctl register, this field holds the respective memory's correctable error count value.
- MGBE_DWCXG_MTL_MTL_DPP_CONTROL_0
The MTL_DPP_Control establishes the operating mode of Data Parity protection and error injection.
- Offset: 0x10e0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

