# 7 :0 0x0 MSG_CODE:

- MSG TLPs: (Message Code). When the TYPE field of an inbound Msg/MsgD TLP is
matched to this value, then address translation proceeds (when all other enabled field-matches are successful). This check is only performed if the "Message Code Match Enable" bit of the "iATU Region Control 2 Register" is set. Memory TLPs: (ST:
- Steering Tag). When the ST field of an inbound TLP is matched to this value, then
address translation proceeds. This check is only performed if the "ST Match
- Enable" bit of the "iATU Region Control 2 Register" is set. The setting is
independent of the setting of the TH field. Only Valid when the CX_TPH_ENABLE configuration parameter is '1'. Note: This register field is sticky.
- PCIE_IATU_CAP_PF0_ATU_CAP_IATU_LWR_BASE_ADDR_OFF_INBOUND_1_0
Description: The CX_ATU_MIN_REGION_SIZE configuration parameter (Value Range: 4 KiB, 8 KiB, 16 KiB, 32 KiB, 64 KiB defaults to 64 KiB) specifies the minimum size of an address translation region. For example, if set to 64 KiB; the lower 16 bits of the Base, Limit and Target registers are zero and all address regions are aligned on 64 KiB boundaries. More precisely, the lower log2(CX_ATU_MIN_REGION_SIZE) bits are zero.
- Offset: 0x308
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

