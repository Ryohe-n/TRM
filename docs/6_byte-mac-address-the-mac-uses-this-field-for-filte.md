# 6 -byte MAC address. The MAC uses this field for filtering the received packets and inserting the MAC address in the Transmit Flow Control (Pause) Packets.

- MGBE_DWCXG_CORE_MAC_INDIR_ACCESS_CTRL_0
This register provides the Indirect Access control and status for MAC_IndReg(#AOFF) registers.
- Offset: 0x700
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

10G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 SNPS_R:
- Synopsys Reserved This bit must be set to 0. This field is reserved for
- Synopsys Internal use, and must always be set to 0 unless instructed by
- Synopsys. Setting any bit to 1 might cause unexpected behavior in the
IP.
- RO
0x0 Reserved_30: Reserved. 29:26
- RW
0x0 MSEL:
- Mode Select This field is used in indirect access of
- MAC_(MSEL)_IndReg(#AOFF) registers. This field must be set along
with initiation of read/write to MAC_(MSEL)_IndReg(#AOFF) registers and should not be changed until the OB is reset. Values: - 0x0: DChSel (DMA_Channel_Select) - 0x1: PCCtrl (Policing_Counter_Control) - 0x2:
- PCntr (Policing_Counter) - 0x3: DPCSel (DA_Policing_Pounter_Select) -
0x4: VPCSel (VLAN_Policing_Counter_Select) - 0x5: LPCSel (L3L4_Policing_Counter_Select) - 0x6: FPCSel (Additional_Event_Policing_Counter_Select) - 0x7: PCStatus (Policing_Counter_Status for DA, VLAN, L3L4 and Additional_Event) - 0x8: EXT_DAH (External DA Hashtable) - 0x9: EXT_ROVTL (External Rx
- Outer VLAN Lookup) - 0xA: EXT_RIVTL (External Rx Inner VLAN Lookup)
- 0xB - 0xF: Reserved for future use.

