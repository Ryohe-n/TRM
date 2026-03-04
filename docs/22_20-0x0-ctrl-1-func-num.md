# 22 :20 0x0 CTRL_1_FUNC_NUM:

- Function Number. - When the address of an outbound TLP is matched to this
region and the FUNC_BYPASS field in the "iATU Region Control 2 Register" is '0', then the function number used in generating the function part of the requester ID (RID) field of the TLP is taken from this 5-bit register. The value in this register must be 0x0 unless multifunction operation in the controller is enabled (CX_NFUNC > 1). - When you are using the AXI Bridge, then this field is swapped before AXI decomposition occurs so that the correct "Max_Read_Request_Size" and "Max_Payload_Size" values are used. Note: This register field is sticky. 0x0 INCREASE_REGION_SIZE:
- Increase the maximum ATU Region size. When set, the maximum ATU Region
size is determined by CX_ATU_MAX_REGION_SIZE. When clear, the maximum ATU Region size is 4 GB (default). Note: This register field is sticky. 10:9 0x0 ATTR:
- When the address of an outbound TLP is matched to this region, then the ATTR
field of the TLP is changed to the value in this register. Note: This register field is sticky. 0x0 TD: This is a reserved field. Do not use. Note: This register field is sticky. 7:5 0x0 TC:
- When the address of an outbound TLP is matched to this region, then the TC
field of the TLP is changed to the value in this register. Note: This register field is sticky. 4:0 0x0 TYPE:
- When the address of an outbound TLP is matched to this region, then the TYPE
field of the TLP is changed to the value in this register. Note: This register field is sticky.
- PCIE_IATU_CAP_PF0_ATU_CAP_IATU_REGION_CTRL_2_OFF_OUTBOUND_7_0
Description: Using this register you can enable/disable the outbound iATU optional features.
- Offset: 0xe04
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0x00,0xxx,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 REGION_EN: Region Enable. This bit must be set to '1' for address translation to take place. Note: This register field is sticky.

- PCIe iATU
- Bit
- Reset
- Description
0x0 INVERT_MODE:
- Invert Mode. When set the address matching region is inverted. Therefore, an
address match occurs when the untranslated address is in the region outside the defined range (Base Address to Limit Address). Note: This register field is sticky. 0x0 CFG_SHIFT_MODE:
- CFG Shift Mode. The iATU uses bits [27:12] of the untranslated address (on the
- XALI0/1/2 interface or AXI slave interface address) to form the BDF number of
the outgoing CFG TLP. This supports the Enhanced Configuration Address
- Mapping (ECAM) mechanism (Section 7.2.2 of the PCI Express Base 3.1
- Specification, revision 1.0) by allowing all outgoing I/O and MEM TLPs (that
have been translated to CFG) to be mapped from memory space into any 256 MB region of the PCIe configuration space. Note: This register field is sticky. 0x0 DMA_BYPASS:
- DMA Bypass Mode. Allows request TLPs which are initiated by the DMA
controller to pass through the iATU untranslated. Note: This field is reserved for the SW product. You must set it to '0'. Note: This register field is sticky. 0x0 HEADER_SUBSTITUTE_EN:
- Header Substitute Enable. When enabled and region address is matched, the
iATU fully substitutes bytes 8-11 (for 3 DWORD header) or bytes 12-15 (for 4
- DWORD header) of the outbound TLP header with the contents of the
LWR_TARGET_RW field in IATU_LWR_TARGET_ADDR_OFF_OUTBOUND_i. Encodings are as above. Note: This register field is sticky. 0x0 INHIBIT_PAYLOAD:
- Inhibit TLP Payload Data for TLP's in Matched Region; assign iATU region to be
- TLP without data. When enabled and region address is matched, the iATU
marks all TLPs as having no payload data by forcing the TLP header Fmt[1] bit =0, regardless of the application inputs such as slv_wstrb. Encoding are define as above. Note: This register field is sticky. 0x0 TLP_HEADER_FIELDS_BYPASS:
- TLP Header Fields Translation Bypass. In this mode header fields of the
translated TLP is taken from your application transmit interface or, if AMBA is configured, from the AMBA sideband bus (slv_awmisc_info) and not from the corresponding fields of the IATU_REGION_CTRL_1_OFF_OUTBOUND_i or
- IATU_REGION_CTRL_2_OFF_OUTBOUND_i registers. The header fields are - TC
- PH - TH - ST - AT - Attr (IDO, RO and NS). Note: This register field is sticky.
0x0 SNP:
- Serialize Non-Posted Requests. In this mode, when the AXI Bridge is populated,
same AXI ID Non-Posted Read/Write Requests are transmitted on the wire if there are no other same ID Non-Posted Requests outstanding. Note: This register field is sticky. 0x0 FUNC_BYPASS:
- Function Number Translation Bypass. In this mode, the function number of the
translated TLP is taken from your application transmit interface and not from the CTRL_1_FUNC_NUM field of the "iATU Region Control 1 Register" or the
- VF_NUMBER field of the "iATU Control 3 Register." Note: This register field is
sticky. 18:17 0x0 MSB2BITS_TAG:
- TAG. Two most significant bits of the substituted TAG field in the outgoing TLP
header when TAG_SUBSTITUTE_EN is set. Note: This register field is sticky.

- PCIe iATU
- Bit
- Reset
- Description
0x0 TAG_SUBSTITUTE_EN:
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
- PCIE_IATU_CAP_PF0_ATU_CAP_IATU_LWR_BASE_ADDR_OFF_OUTBOUND_7_0
Description: The CX_ATU_MIN_REGION_SIZE configuration parameter (Value Range: 4 kB, 8 kB, 16 kB, 32 kB, 64 kB defaults to 64 kB) specifies the minimum size of an address translation region. For example, if set to 64 kB; the lower 16 bits of the Base, Limit and Target registers are zero and all address regions are aligned on 64 kB boundaries. More precisely, the lower log2(CX_ATU_MIN_REGION_SIZE) bits are zero.
- Offset: 0xe08
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

