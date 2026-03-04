# 31 :30 0x0 Reserved_31_30: Reserved. 29:28 0x2 ASP:

- Automotive Safety Package Following are the encoding for the different
- Safety features
0x1 TBSSEL:
- Time Based Scheduling Enable This bit is set to 1 when the Time Based
Scheduling feature is selected. 0x1 FPESEL:
- Frame Preemption Enable This bit is set to 1 when the Enable Frame
preemption feature is selected. 25:22 0x0 Reserved_25_22: Reserved. 21:20 0x3 ESTWID:
- Width of the Time Interval field in the Gate Control List This field
indicates the width of the Configured Time Interval Field 19:17 0x3 ESTDEP:
- Depth of the Gate Control List This field indicates the depth of Gate
- Control list expressed as Log2(DWC_EQOS_EST_DEP)-5

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description
0x1 ESTSEL:
- Enhancements to Scheduled Traffic Enable This bit is set to 1 when the
Enable Enhancements to Scheduling Traffic feature is selected. 0x0 Reserved_15: Reserved. 14:13 0x2 FRPES:
- Flexible Receive Parser Table Entries size This field indicates the Max
Number of Parser Entries supported by Flexible Receive Parser. 12:11 0x2 FRPBS:
- Flexible Receive Parser Buffer size This field indicates the supported
- Max Number of bytes of the packet data to be Parsed by Flexible
Receive Parser. 0x1 FRPSEL:
- Flexible Receive Parser Selected This bit is set to 1 when the Enable
Flexible Programmable Receive Parser option is selected. 0x1 PDUPSEL:
- Broadcast/Multicast Packet Duplication This bit is set to 1 when the
Broadcast/Multicast Packet Duplication feature is selected. 8:6 0x0 Reserved_7_6: Reserved. 0x1 DVLAN:
- Double VLAN Tag Processing Selected This bit is set to 1 when the
Enable Double VLAN Processing Feature is selected. 0x1 CBTISEL:
- Queue/Channel based VLAN tag insertion on Tx Enable This bit is set to

