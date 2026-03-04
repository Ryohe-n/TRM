# 24 :20 X EXCAUSE: 0 = TRAP0 1 = TRAP1 2 = TRAP2 3 = TRAP3 8 = ILL_INS 9 = INV_INS 10 = MISS_INS 11 = DHIT_INS 13 = SP_OVERFLOW 15 = BRKPT_INS 16 = DMEM_MISS_INS 17 = DMEM_DHIT_INS 18 = DMEM_PAFAULT_INS 19 = DMEM_PERMISSION_INS 20 = DMEM_FAULT_INS 19:0 X

- EXPC
- NV_CVIC_FALCON_SVEC_SPR_0
- Offset: 0x3500
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000X0000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)

- Video Image Compositor (VIC) Registers
- Bit
- Reset
- Description
X SIGPASS: 0 = FALSE 1 = TRUE
- NV_CVIC_FALCON_RSTAT0_0
- Offset: 0x3600
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXX0X (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X
- HALTED
X
- WAITING
X
- VALID

