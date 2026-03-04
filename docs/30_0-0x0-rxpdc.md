# 30 :0 0x0 RXPDC:

- Rx Parser Drop count This 31-bit counter is implemented when a Rx Parser
- Drops a packet due to RF =1. The counter is cleared when the register is
read.
- EQOS_EQOS_MTL_MTL_RXP_ERROR_CNT_0
The MTL_RXP_Error_Cnt register provides the Rx Parser related error occurrence count.
- Offset: 0xcac
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 RXPECOVF:
- Rx Parser Error Counter Overflow Bit When set, this bit indicates that the
MTL_RXP_Error_cnt (RXPEC) Counter field crossed the maximum limit. Access restriction applies. Clears on read. Self-set to 1 on internal event. 30:0 0x0 RXPEC:
- Rx Parser Error count This 31-bit counter is implemented whenr a Rx Parser
encounters following Error scenarios - Entry address >= NVE[] - Number
- Parsed Entries >= NPE[] - Entry address > EOF data entry address The
counter is cleared when the register is read.
- EQOS_EQOS_MTL_MTL_RXP_INDIRECT_ACC_CONTROL_STATUS_0
- The MTL_RXP_Indirect_Acc_Control_Status register provides the Indirect Access control and
status for Rx Parser memory.
- Offset: 0xcb0
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

1G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 STARTBUSY:
- FRP Instruction Table Access Busy - Set to 1 by the software,
indicates to start the Read/Write operation from/to the Rx Parser
- Memory. Software should read this bit as 0 before issuing read or
write request to access the Parser Memory Instructions. - Set to 1 by the IP, indicates that the IP is busy until it is cleared by the IP. Software should not issue read or write operation. 30:23
- RO
0x0 Reserved_30_23: Reserved.
- RW
0x0 RXPEIEC:
- ECC Inject Error Control for Rx Parser Memory When RXPEIEE or
- RXPEIAEE bit of this register is set, following are the errors inserted
based on the value encoded in this field: - 1: Insert 1 bit error. - 0: Insert 2 bit errors.
- RW
0x0 RXPEIAEE:
- ECC Inject Address Error Enable for Rx Parser Memory - 1: Enables
the ECC address error injection feature. - 0: Disables the ECC address error injection feature.
- RW
0x0 RXPEIEE:
- ECC Inject Error Enable for Rx Parser Memory - 1: Enables the ECC
error injection feature. - 0: Disables the ECC error injection feature. 19:17
- RO
0x0 Reserved_19_17: Reserved.
- RW
0x0 WRRDN:
- Read Write Control - 1: Indicates the write operation to the Rx
- Parser Memory. - 0: Indicates the read operation to the Rx Parser
Memory. 15:10
- RO
0x0 Reserved_15_x: Reserved. 9:0
- RW
0x0 ADDR:
- FRP Instruction Table Offset Address This field indicates the ADDR
of the 32-bit entry in Rx parser instruction table. Each entry has 128-bit (4x32-bit words). The X is based on the configurable
- DWC_EQOS_FRP_ENTRIES. If DWC_EQOS_FRP_ENTRIES is - 256: X =

