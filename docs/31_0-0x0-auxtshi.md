# 31 :0 0x0 AUXTSHI:

- Auxiliary Timestamp High. Contains the lower 32 bits of the Seconds
field of the auxiliary timestamp.
- MGBE_DWCXG_CORE_MAC_TIMESTAMP_INGRESS_ASYM_CORR_0
MAC_TIMESTAMP_INGRESS_ASYM_CORR offset(decimal)=3408/0xd50 size=32 (32'bit reset value: 0x0 Description: The MAC Timestamp Ingress Asymmetry Correction register contains the Ingress Asymmetry Correction value to be used while updating correction field in some PTP messages.
- Ideally, Ingress Asymmetry correction needs to be done in the receive side, when the
corresponding packet is received. But when one-step time stamping is enabled, the controller performs ingress asymmetry correction on the transmit (egress) side, which still holds good for packets that are received and transmitted on the same port (for example, Pdelay Resp, which is sent for a Pdelay Request received in the same port). In other cases (for example, transparent bridge), this feature can still be used if all receive ports have the same ingress correction value. If not, then OSTIAC must be programmed to 0x0.)
- Offset: 0xd50
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

