# 0 : Disables the ECC feature for EST memory

- RW
0x0 MRXEE:
- MTL Rx FIFO ECC Enable - 1: Enables the ECC feature for MTL Rx
- FIFO memory. - 0: Disables the ECC feature for MTL Rx FIFO
memory.
- RW
0x0 MTXEE:
- MTL Tx FIFO ECC Enable - 1: Enables the ECC feature for MTL Tx
- FIFO memory - 0: Disables the ECC feature for MTL Tx FIFO memory
- EQOS_EQOS_MTL_MTL_SAFETY_INTERRUPT_STATUS_0
The MTL_Safety_Interrupt_Status registers provides Safety interrupt status.
- Offset: 0xcc4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x0 Reserved_MCSIS: Reserved. 30:2 0x0 Reserved_30_2: Reserved. 0x0 MEUIS:
- MTL ECC Uncorrectable error Interrupt Status This bit indicates that an
uncorrectable error interrupt event in the MTL ECC safety feature. To get the exact cause of the interrupt the application should read the MTL_ECC_Interrupt_Status register. 0x0 MECIS:
- MTL ECC Correctable error Interrupt Status This bit indicates that a
correctable error interrupt event in the MTL ECC safety feature. To get the exact cause of the interrupt the application should read the MTL_ECC_Interrupt_Status register.
- EQOS_EQOS_MTL_MTL_ECC_INTERRUPT_ENABLE_0
The MTL_ECC_Interrupt_Enable register provides enable bits for the ECC interrupts.
- Offset: 0xcc8
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

