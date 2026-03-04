# 20 :16 X FABRIC_ID: The SoC Supports multiple fabrics based on CBB2.0 Architecture. Each fabric is assigned a unique build time ID.

- This field logs this unique Fabric ID for the access that returns with
error. 0 = CBB_FABRIC_ID 1 = SCE_FABRIC_ID 2 = RCE_FABRIC_ID 3 = DCE_FABRIC_ID 4 = AON_FABRIC_ID 5 = PSC_FABRIC_ID 6 = BPMP_FABRIC_ID 7 = FSI_FABRIC_ID 7:0 X SID:
- Slave ID. This is the ID of the Slavenode in a given fabric (identified by
the FABRIC_ID field of this register).
- RCE_MN_DMA_P_I_LOG_USER_BITS0_0
This register exists only when Error Monitor is built with the Error Logger. This register stores the Nvidia User bits of the access in the order specified in the CBB Socket
- Architecture Specification
User bits = Read User bits or Write User Bits depending on Read or a Write Access which gets logged Write accesses to this register return error.
- Offset: 0x14318
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXX0XXX0X (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

