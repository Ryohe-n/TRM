# 2 ^31 - 1), when TSCTRLSSR bit in MAC_Timestamp_Control is reset and 0x3B9A_C9FF (that is, 10^9 - 1), when TSCTRLSSR bit in MAC_Timestamp_Control is set.

- EQOS_EQOS_MAC_MAC_TIMESTAMP_ADDEND_0
Timestamp Addend register. This register value is used only when the system time is configured for
- Fine Update mode (TSCFUPDT bit in the MAC_Timestamp_Control register). The content of this
register is added to a 32-bit accumulator in every clock cycle (of clk_ptp_ref_i) and the system time is updated when the accumulator overflows.
- Offset: 0xb18
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

