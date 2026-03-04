# 26 :24 0x2 HASHTBLSZ:

- Hash Table Size. This field indicates the size of the hash table: - 3'b000: No
hash table selected - 3'b001: 64 - 3'b010: 128 - 3'b011: 256 - 3'b100: 512 - 3'b101: 1024 - 3'b110: 2048 - 3'b111: 4096 23:21 0x7 NUMTC:
- Number of Traffic Classes. This field indicates the number of traffic classes
selected: - 3'b000: 1 Traffic Class - 3'b001: 2 Traffic Classes - 3'b010: 3 Traffic
- Classes - ... - 3'b111: 8 Traffic
0x1 RSSEN:
- Internal Register based RSS Feature Enabled
0x1 DBGMEMA:
- Debug Memory Interface Enabled. This bit is set to 1 when the Enable Debug
Memory Access option is selected. 0x1 TSOEN:
- TCP Segmentation Offload Enable. This bit is set to 1 when the Enable TCP
Segmentation Offloading for TCP/IP Packets option is selected. 0x1 SPHEN:
- Header-Payload Split Feature Enable. This bit is set to 1 when the Enable
Header-Payload Split Structure option is selected. 0x1 DCBEN:
- DCB Feature Enable. This bit is set to 1 when the Enable Data Center Bridging
option is selected. 15:14 0x1 ADDR64:
- Address Width. This field indicates the configured address width: - 2'b00: 32 -

