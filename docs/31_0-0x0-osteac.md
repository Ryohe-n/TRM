# 31 :0 0x0 OSTEAC:

- One-Step Timestamp Egress Asymmetry Correction. This field contains the
egress path asymmetry value to be subtracted from correctionField of
- Delay_Req and Pdelay_Req PTP packet. The programmed value must be the
negated value in units of nanoseconds multiplied by 2^16. For example, if the required correction is +2.5 ns, then the programmed value must be 0xFFFD_8000, which is twos complement of 0x0002_8000 (2.5 * 2^16).
- Similarly, if the required correction is -3.3 ns, then the programmed value is
0x0003_4CCC (3.3 * 2^16).
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_INGRESS_CORR_NANOSECOND_0
The MAC Timestamp Ingress Correction Nanosecond register contains the correction value to be used with the captured timestamp value in the ingress path. This is used to compensate the errors due to timestamp synchronization from the PTP clock domain to the MAC Rx clock domain, and the latency incurred between the message timestamp point and the point at which the timestamp snapshot is taken.
- Offset: 0xd58
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

