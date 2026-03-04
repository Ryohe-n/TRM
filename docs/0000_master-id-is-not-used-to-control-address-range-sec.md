# 0000 = Master ID is NOT used to control Address range security firewall 0001 = CCPLEX is allowed to access security firewall 0010 = CCPLEX power management is allowed to access security firewall 0011 = BPMP is allowed to access security firewall 0100 = SPE is allowed to access security firewall 0101 = CPE/SCE is allowed to access security firewall 0110 = DMA_PER is allowed to access security firewall 0111 = TSECA is allowed to access security firewall 1000 = TSECB is allowed to access security firewall 1001 = JTAGM is allowed to access security firewall 1010 = CSITE is allowed to access security firewall 1011 = APE is allowed to access security firewall 1100-1111: RSVD 0x0

- PR7
0x0
- PR6
0x0
- PR5
0x0
- PR4
0x0
- PR3
0x0
- PR2
0x0
- PR1
0x0
- PR0

- AON Registers
- Bit
- Reset
- Description
0x0
- G7W: Privileged Group7 Write. 1 - enable 0 - disable
0x0
- G6W: Privileged Group6 Write. 1 - enable 0 - disable
0x0
- G5W: Privileged Group5 Write. 1 - enable 0 - disable
0x0
- G4W: Privileged Group4 Write. 1 - enable 0 - disable
0x0
- G3W: Privileged Group3 Write. 1 - enable 0 - disable
0x0
- G2W: Privileged Group2 Write. 1 - enable 0 - disable
0x0
- G1W: Privileged Group1 Write. 1 - enable 0 - disable
0x0
- G0W: TrustZone Group0 Write. 1 - enable 0 - disable
0x0
- G7R: Privileged Group7 Read. 1 - enable 0 - disable
0x0
- G6R: Privileged Group6 Read. 1 - enable 0 - disable
0x0
- G5R: Privileged Group5 Read. 1 - enable 0 - disable
0x0
- G4R: Privileged Group4 Read. 1 - enable 0 - disable
0x0
- G3R: Privileged Group3 Read. 1 - enable 0 - disable
0x0
- G2R: Privileged Group2 Read. 1 - enable 0 - disable
0x0
- G1R: Privileged Group1 Read. 1 - enable 0 - disable
0x0
- G0R: TrustZone Group0 Read. 1 - enable 0 - disable
- DMAAPB_AON_SECURITY_BITMASK_1_0
- Offset: 0x88
Read/Write: See table below.
- Parity Protection: N
- SCR Protection: FIREWALL_SCR_1_0
- Reset: 0x00000000 (0bx000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0
- SEC_LCK: SEC_LCK Sticky lock bit and when set, then no master can change the
- Security Control field
0x0
- SEC_WEN: Security Write Control Enable. 1 - enable 0 - disable
0x0
- SEC_REN: Security Read Control Enable. 1 - enable 0 - disable

- AON Registers
- Bit
- Reset
- Description

