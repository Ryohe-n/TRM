# 30 :0 0x0 RXPAC:

- Rx-Parser Accept Counter This 31-bit counter is incremented whenever the
- Rx Parser accepts a packet due to AF = 1 and RF = 0. The packet should
match the Rx Parser acceptance criteria irrespective of its type (length or type) and size (undersize/runt or oversize). The counter is cleared when the register is read.
- MGBE_DWCXG_MTL_DMA_CH8_RXP_ACCEPT_CNT_0
This register can be accessed only via indirect addressing. The register is added in the spec for informational purpose only. Please refer to databook for details to access this register. The DMA_CH(#i)_RXP_Accept_Cnt registers provide the count of the number of frames accepted by Rx
- Parser particular to channel. This is an indirect register which can be access through
MTL_Indirect_Acc_Control_Status and MTL_Indirect_Acc_Data registers.
- Offset: 0x250010b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 RXPACOF:
- Rx-Parser Accept Counter Overflow Bit When set, this bit indicates that the
RXPAC Counter field crossed the maximum limit. Access restriction applies. Clears on read. Self-set to 1 on internal event. 30:0 0x0 RXPAC:
- Rx-Parser Accept Counter This 31-bit counter is incremented whenever the
- Rx Parser accepts a packet due to AF = 1 and RF = 0. The packet should
match the Rx Parser acceptance criteria irrespective of its type (length or type) and size (undersize/runt or oversize). The counter is cleared when the register is read.
- MGBE_DWCXG_MTL_DMA_CH9_RXP_ACCEPT_CNT_0
This register can be accessed only via indirect addressing. The register is added in the spec for informational purpose only. Please refer to databook for details to access this register. The DMA_CH(#i)_RXP_Accept_Cnt registers provide the count of the number of frames accepted by Rx
- Parser particular to channel. This is an indirect register which can be access through
MTL_Indirect_Acc_Control_Status and MTL_Indirect_Acc_Data registers.
- Offset: 0x251010b4
- Read/Write: RO

10G Ethernet Controller Core Registers cont'd 6
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 RXPACOF:
- Rx-Parser Accept Counter Overflow Bit When set, this bit indicates that the
RXPAC Counter field crossed the maximum limit. Access restriction applies. Clears on read. Self-set to 1 on internal event. 30:0 0x0 RXPAC:
- Rx-Parser Accept Counter This 31-bit counter is incremented whenever the
- Rx Parser accepts a packet due to AF = 1 and RF = 0. The packet should
match the Rx Parser acceptance criteria irrespective of its type (length or type) and size (undersize/runt or oversize). The counter is cleared when the register is read.
- MGBE_DWCXG_MTL_MTL_RXP_BYPASS_CNT_0
This register can be accessed only via indirect addressing. The register is added in the spec for informational purpose only. Please refer to databook for details to access this register. The
- MTL_RXP_Bypass_Cnt registers provides the count of the number of frames bypassed by Rx
Parser. This is an indirect register which can be access through MTL_Indirect_Acc_Control_Status and MTL_Indirect_Acc_Data registers.
- Offset: 0x252010b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 RXPBCOF:
- Rx-Parser Bypass Counter Overflow Bit When set, this bit indicates that
the RXPBC Counter field crossed the maximum limit. Access restriction applies. Clears on read. Self-set to 1 on internal event. 30:0 0x0 RXPBC:
- Rx-Parser Bypass Counter This 31-bit counter is implemented whenever a
- Rx Parser Bypass a packet due to AF = 1 and RF = 1. The counter is cleared
when the register is read.
- MGBE_DWCXG_MTL_MTL_RXP_DROP_CNT_0

10G Ethernet Controller Core Registers cont'd 6 This register can be accessed only via indirect addressing. The register is added in the spec for informational purpose only. Please refer to databook for details to access this register. This register provides the number of packets dropped by the Flexible Receive Parser. This is an indirect register which can be accessed through MTL_Indirect_Acc_Control_Status and MTL_Indirect_Acc_Data registers.
- Offset: 0x253010b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 RXPDCOVF:
- RXP Packet Drop Counter Overflow. When set, this bit indicates that the
MTL_RXP_Drop_cnt (RXPDC) counter field has crossed the maximum limit. Access restriction applies. Clears on read. Self-set to 1 on internal event. 30:0 0x0 RXPDC:
- RXP Packet Drop Count. This 31-bit counter is incremented when a Rx
- Parser drops a packet due to AF = 0 and RF = 1. The counter is cleared when
the register is read.
- MGBE_DWCXG_MTL_MTL_RXP_ERROR_CNT_0
This register can be accessed only via indirect addressing. The register is added in the spec for informational purpose only. Please refer to databook for details to access this register. This register provides Error Counts of the Flexible Receive Parser. This is an indirect register which can be access through MTL_Indirect_Acc_Control_Status and MTL_Indirect_Acc_Data registers.
- Offset: 0x254010b4
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 RXPECOVF:
- RXP Error Counter Overflow Bit When set, this bit indicates that the
MTL_RXP_Error_cnt (RXPEC) counter field has crossed the maximum limit. Access restriction applies. Clears on read. Self-set to 1 on internal event.

10G Ethernet Controller Core Registers cont'd 6
- Bit
- Reset
- Description

