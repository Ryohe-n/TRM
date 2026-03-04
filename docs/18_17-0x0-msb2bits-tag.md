# 18 :17 0x0 MSB2BITS_TAG:

- TAG. Two most significant bits of the substituted TAG field in the outgoing TLP
header when TAG_SUBSTITUTE_EN is set. Note: This register field is sticky. 0x0 TAG_SUBSTITUTE_EN:
- TAG Substitute Enable. When enabled and region address is matched, the iATU
substitutes the TAG field of the outbound TLP header with the contents of the
- TAG field in this register. The expected usage scenario is translation from AXI
- MWr to Vendor Defined Msg/MsgD. Note (CX_TPH_ENABLE=1): TAG
substitution for MWr will not occur because this field (byte 6) in the TLP header is the ST field. ST substitution can still take place using the MSG_CODE field in IATU_REGION_CTRL_2_OFF_OUTBOUND_i. Note: This register field is sticky. 15:8 0x0 TAG:
- TAG. The substituted TAG field (byte 6) in the outgoing TLP header when
TAG_SUBSTITUTE_EN is set. Note: This register field is sticky. 7:0 0x0 MSG_CODE:
- MSG TLPs (Message Code). When the address of an outbound TLP is matched
to this region, and the translated TLP TYPE field is Msg or MsgD; then the message field of the TLP is changed to the value in this register. Memory TLPs: (ST: Steering Tag). When the ST field of an outbound TLP is matched to this region, and the translated TLP TYPE field targets memory space; then the ST field of the TLP is changed to the value in this register. Only Valid when the
- CX_TPH_ENABLE configuration parameter is 1. Note: This register field is
sticky.
- PCIE_IATU_CAP_PF0_ATU_CAP_IATU_LWR_BASE_ADDR_OFF_OUTBOUND_2_0
Description: The CX_ATU_MIN_REGION_SIZE configuration parameter (Value Range: 4 kB, 8 kB, 16 kB, 32 kB, 64 kB defaults to 64 kB) specifies the minimum size of an address translation region. For example, if set to 64 kB; the lower 16 bits of the Base, Limit and Target registers are zero and all address regions are aligned on 64 kB boundaries. More precisely, the lower log2(CX_ATU_MIN_REGION_SIZE) bits are zero.
- Offset: 0x408
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

