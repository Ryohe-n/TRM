# 4 Source Port number field is enabled for inverse matching. When this bit is reset, the Layer 4 Source Port number field is enabled for perfect matching. This bit is valid and applicable only when the L4SPM0 bit is set high.

- RW
0x0 L4SPM7:
- Layer 4 Source Port Match Enable When this bit is set, the Layer 4
- Source Port number field is enabled for matching. When this bit is
reset, the MAC ignores the Layer 4 Source Port number field for matching.
- RO
0x0 Reserved_17: Reserved.
- RW
0x0 L4PEN7:
- Layer 4 Protocol Enable When this bit is set, the Source and Destination
- Port number fields of UDP packets are used for matching. When this
bit is reset, the Source and Destination Port number fields of TCP packets are used for matching. The Layer 4 matching is done only when the L4SPM0 or L4DPM0 bit is set. 15:11
- RW
0x0 L3HDBM7:
- Layer 3 IP DA Higher Bits Match IPv4 Packets: This field contains the
number of higher bits of IP Destination Address that are matched in the IPv4 packets. The following list describes the values of this field: - 0:
- No bits are masked. - 1: LSb[0] is masked - 2: Two LSbs [1:0] are
masked - .. - 31: All bits except MSb are masked. IPv6 Packets:
- Bits[12:11] of this field correspond to Bits[6:5] of L3HSBM0 which
indicate the number of lower bits of IP Source or Destination Address that are masked in the IPv6 packets. The following list describes the concatenated values of the L3HDBM0[1:0] and L3HSBM0 bits: - 0: No bits are masked. - 1: LSb[0] is masked. - 2: Two LSbs [1:0] are masked
- .. - 127: All bits except MSb are masked. This field is valid and
applicable only when the L3DAM0 or L3SAM0 bit is set. 10:6
- RW
0x0 L3HSBM7:
- Layer 3 IP SA Higher Bits Match IPv4 Packets: This field contains the
number of lower bits of IP Source Address that are masked for matching in the IPv4 packets. The following list describes the values of this field: - 0: No bits are masked. - 1: LSb[0] is masked - 2: Two LSbs [1:0] are masked - .. - 31: All bits except MSb are masked. IPv6 Packets:
- This field contains Bits[4:0] of L3HSBM0. These bits indicate the
number of higher bits of IP Source or Destination Address matched in the IPv6 packets. This field is valid and applicable only when the L3DAM0 or L3SAM0 bit is set high.
- RW
0x0 L3DAIM7:
- Layer 3 IP DA Inverse Match Enable When this bit is set, the Layer 3 IP
- Destination Address field is enabled for inverse matching. When this bit
is reset, the Layer 3 IP Destination Address field is enabled for perfect matching. This bit is valid and applicable only when the L3DAM0 bit is set high.
- RW
0x0 L3DAM7:
- Layer 3 IP DA Match Enable When this bit is set, the Layer 3 IP
- Destination Address field is enabled for matching. When this bit is
reset, the MAC ignores the Layer 3 IP Destination Address field for matching. Note: When the L3PEN0 bit is set, you should set either this bit or the L3SAM0 bit because either IPv6 DA or SA can be checked for filtering.

1G Ethernet Controller Core Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 L3SAIM7:
- Layer 3 IP SA Inverse Match Enable When this bit is set, the Layer 3 IP
- Source Address field is enabled for inverse matching. When this bit
reset, the Layer 3 IP Source Address field is enabled for perfect matching. This bit is valid and applicable only when the L3SAM0 bit is set.
- RW
0x0 L3SAM7:
- Layer 3 IP SA Match Enable When this bit is set, the Layer 3 IP Source
- Address field is enabled for matching. When this bit is reset, the MAC
ignores the Layer 3 IP Source Address field for matching. Note: When the L3PEN0 bit is set, you should set either this bit or the L3DAM0 bit because either IPv6 SA or DA can be checked for filtering.
- RO
0x0 Reserved_1: Reserved.
- RW
0x0 L3PEN7:
- Layer 3 Protocol Enable When this bit is set, the Layer 3 IP Source or
- Destination Address matching is enabled for IPv6 packets. When this
bit is reset, the Layer 3 IP Source or Destination Address matching is enabled for IPv4 packets. The Layer 3 matching is done only when the L3SAM0 or L3DAM0 bit is set.
- EQOS_EQOS_MAC_MAC_LAYER4_ADDRESS7_0
- The MAC_Layer4_Address(#i), MAC_L3_L4_Control(#i), MAC_Layer3_Addr0_Reg(#i),
- MAC_Layer3_Addr1_Reg(#i), MAC_Layer3_Addr2_Reg(#i) and MAC_Layer3_Addr3_Reg(#i) registers
are reserved (RO with default value) if Enable Layer 3 and Layer 4 Packet Filter option is not selected while configuring the IP. You can configure the Layer 3 and Layer 4 Address Registers to be double-synchronized by selecting the Synchronize Layer 3 and Layer 4 Address Registers to Rx Clock Domain option while configuring the IP. When you select this option, the synchronization is triggered only when Bits[31:24] (in little-endian mode) or Bits[7:0] (in big-endian mode) of the Layer 3 and Layer 4 Address Registers are written. For proper synchronization updates, you should perform consecutive writes to same Layer 3 and Layer 4 Address Registers after at least four clock cycles delay of the destination clock.)
- Offset: 0xa54
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

1G Ethernet Controller Core Registers
- Bit
- Reset
- Description

