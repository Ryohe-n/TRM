# 31 :0 0x0 OSTIAC:

- One-Step Timestamp Ingress Asymmetry Correction. This field contains the
ingress path asymmetry value to be added to correctionField of Sync and
- Pdelay_Resp PTP packet. The programmed value should be in units of
nanoseconds and multiplied by 2^16. For example, 2.5 ns is represented as 0x00028000. The value can also be negative and then is represented in twos complement form with bit 31 representing the sign bit.
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_EGRESS_ASYM_CORR_0
- The MAC Timestamp Egress Asymmetry Correction register contains the Egress Asymmetry
Correction value to be used while updating the correction field in for some PTP message types.
- Offset: 0xd54
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

10G Ethernet Controller Core Registers cont'd 1
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

