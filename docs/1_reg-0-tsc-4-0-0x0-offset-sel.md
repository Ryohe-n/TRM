# 1 = REG 0 = TSC 4:0 0x0 OFFSET_SEL:

- TSC offset selection
#### 10.9.4.1 CAN Core Registers
- An issue exists with some of the register bits, where the expected function reset-on-read
and set-on-read does not work. Workarounds are noted in the register tables below. The following register status bits inside CAN do not get reset when read: ECR.CEL, PSR.PXE, PSR.RFDF, PSR.RBRS, PSR.RESI. The following register status bits inside CAN do not get set when read: PSR.DLEC, PSR.LEC. M_TTCAN_CORE_CREL_0
- Offset: 0x0
- Read/Write: RO
- Parity Protection: N

- CAN Core Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x32380609 (0b0011,0010,0011,1000,0000,0110,0000,1001)
- Bit
- Reset
- Description

