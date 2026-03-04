# 25 :24 0x0 RESPONSE_CODE:

- Response Code. Defines the type of response to give for accesses matching this
region. This overrides the normal RADM filter response. Note that this feature is not available for any region where Single Address Location Translate is enabled. Note: This register field is sticky. 0x0 SINGLE_ADDR_LOC_TRANS_EN:
- Single Address Location Translate Enable. When enabled, Rx TLPs can be
translated to a single address location as determined by the target address register of the iATU region. The main usage scenario is translation of Messages (such as Vendor Defined or ATS Messages) to MWr TLPs when the AXI bridge is enabled. Note: This register field is sticky. 0x0 MSG_CODE_MATCH_EN:
- Message Code Match Enable (Msg TLPS). Ensures that a successful message Code
- TLP field comparison match (see Message Code field of the "iATU Region Control 2
- Register") occurs (in MSG transactions) for address translation to proceed. ST
- Match Enable (Mem TLPs). Ensures that a successful ST TLP field comparison
match (see ST field of the "iATU Region Control 2 Register") occurs (in MEM transactions) for address translation to proceed. Only Valid when the CX_TPH_ENABLE configuration parameter is '1'. Note: This register field is sticky. 0x0 FUNC_NUM_MATCH_EN:
- Function Number Match Enable. Ensures that a successful Function Number TLP
field comparison match (see Function Number field of the "iATU Region Control 1
- Register") occurs (in MEM-I/O and CFG0/CFG1 transactions) for address translation
to proceed. Note: This register field is sticky. 0x0 ATTR_MATCH_EN:
- ATTR Match Enable. Ensures that a successful ATTR TLP field comparison match
(see ATTR field of the "iATU Region Control 1 Register") occurs for address translation to proceed. Note: This register field is sticky. 0x0 TD_MATCH_EN:
- TD Match Enable. Ensures that a successful TD TLP field comparison match (see
- TD field of the "iATU Region Control 1 Register") occurs for address translation to
proceed. Note: This register field is sticky. 0x0 TC_MATCH_EN:
- TC Match Enable. Ensures that a successful TC TLP field comparison match (see TC
field of the "iATU Region Control 1 Register") occurs for address translation to proceed. Note: This register field is sticky. 0x0 MSG_TYPE_MATCH_MODE:
- Message Type Match Mode. When enabled, and if single address location translate
enable is set, then inbound TLPs of type MSG/MSGd which match the type field of the IATU_REGION_CTRL_1_VIEWPORT_OFF_INBOUND_i register (TYPE[4:3]=2'b10) will be translated. Message type match mode overrides any value of MATCH_MODE field in this register. Usage scenarios for this are translation of VDM or ATS messages when AXI bridge is configured on client interface. Note: This register field is sticky. 10:8 0x0 BAR_NUM:
- BAR Number. When the BAR number of an inbound MEM or IO TLP " that is
matched by the normal internal BAR address matching mechanism " is the same as this field, address translation proceeds (when all other enabled field-matches are successful). This check is only performed if the "Match Mode" bit of the "iATU
- Region Control 2 Register" is set. IO translation would require either 00100b or
00101b in the inbound TLP TYPE; the BAR Number set in the range 000b - 101b and that BAR configured as an IO BAR. Note: This register field is sticky.

- PCIe iATU
- Bit
- Reset
- Description

