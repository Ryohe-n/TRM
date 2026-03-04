# 31 :0 0x0 MSI_VECTOR1: Each vector register corresponds to 32 of the possible 256 MSI vectors.

- VECTOR0 corresponds to MSI vectors 31-0. Vector7 corresponds to MSI
vectors 255-223. When an upstream MSI is sent, the bit corresponding to the MSI vector is set to 1 by hardware if the corresponding enable bit is 1. The bit is set to 0 if a 1 is written to its location.
- HDA_MSI_VEC2_0
- Offset: 0x108
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

