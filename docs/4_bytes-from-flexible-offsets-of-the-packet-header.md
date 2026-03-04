# 4 bytes from flexible offsets of the packet header.

- For the controlled port bypass packet, if MACSEC_CONTROL0_0.VALIDATE_FRAMES
register bit is “STRICT”, the packet is dropped, else it is bypassed. This feature is useful to prevent spoofing attack. If packet is uncontrolled port bypass packet, then packet is always bypassed.
- There is configuration bit to either drop or forward the untagged MACsec packets that do
not have entry in bypass table.
- Software uses indirect addressing mode (as described in the "Steps to configure Tx/Rx
- BYPASS and SC_INDEX LUTs" section) to program all entries in the row. Software can
disable any entry by writing 0 to the corresponding bit position in MACSEC_RX_BYP_LUT_VALID_0 register.
- INGRESS SC LUT: Holds maximum of 16 entries. It stores SCI in each entry that can be used
in SC lookup.
- Based on the configuration in MACSEC_RM_TX_BYP CBB BLF register, either TZ or RM can
program this LUT. Default configuration of the BLF permits the RM to program this lookup table. This table is software controlled. Software can write/read the entries to/from this table. Hardware only uses the data from this table to determine the SC_Index.
- For all MACsec packets, when SC bit (in SECTAG field) is set, SCI is determined as per the
pseudo code.
- If (ES bit is set)
- SCI = {MAC_SA[47:0], 0x0001} //MAC SA is extracted from packet
header
- Else if (SC=1)
- SCI = SECTAG.sci[63:0]
- Else //SC=0

- MACsec Functional Description
Use entry “0” of SC LUT Table for SC_Index. When SC bit is 0 and ES bit is 0, SCI is not included in SECTAG. This SCI value is used to do SC lookup. The output of the lookup is SC_Index, which is used to look up SC table for SC parameters. If multiple entries are hit, then the lowest- numbered index is picked as a winner and result pointing to that entry is used for further processing. Ingress SCI LUT format is specified in the "MACsec Ingress LUT Formats" section.
- Software uses indirect addressing mode (as described in the "Steps to Configure Tx/Rx
- BYPASS and SC_INDEX LUTs" section) to program all fields of the row. Software can
disable any entry by writing 0 in the corresponding bits positions of MACSEC_RX_SC_INDX_LUT_VALID_0 register. Ingress SC_PARAM Table:
- Ingress SC parameter LUT format is specified in the "MACsec Ingress Lookup Table
Formats" section. It has maximum of 16 entries.
- Based on the configuration in MACSEC_RM_TX_BYP CBB BLF register, either TZ or RM can
program this LUT. Default configuration of the BLF allows RM to program this LUT.
- Software uses indirect addressing mode (as described in the "Steps to Configure Tx/Rx
SA_STATE, SC_PARAM and SC_STATE LUTs" section) to program all entries in the row. Software should program: - - - key_index_start to point to start of SC keys in key table LUT. PN_window, if MACsec Rx needs to receive out of order packets. Hardware only uses the data from this table for MACsec processing. Ingress SC_STATE Table: Holds maximum of 16 entries.
- Ingress SC state table format is specified in the "MACsec Ingress Lookup Table Formats"
section.
- Based on the configuration in MACSEC_RM_TX_BYP CBB BLF register, either TZ or RM can
program this LUT. Default configuration of the BLF allows RM to program this LUT.
- Stores the CURRENT_AN info for each SC. Hardware updates this field with the AN of
received MACsec packet.
- Software can read this LUT using indirect addressing mode (as described in the "Steps to
Configure Tx/Rx SA_STATE, SC_PARAM and SC_STATE LUTs" section). Ingress SA_STATE Table: - - Holds maximum of 32 entries. This table stores the NEXT_PN and LOWEST_PN fields.
- Ingress SA state table format is specified in the "MACsec Ingress Lookup Table Formats"
section.

- MACsec Functional Description
-
- Based on the configuration in MACSEC_RM_TX_BYP CBB BLF register, either TZ or RM
can program this LUT. Default configuration of the BLF allows RM to program this LUT.
- Software uses indirect addressing mode (as described in the "Steps to Configure Tx/Rx
SA_STATE, SC_PARAM and SC_STATE LUTs" section) to program all entries in the row. Software initializes Next_PN, Lowest_PN for each secure association.
- When the current RX packet validation is successful, Hardware updates these entries as
per section “Figure 10-4—Management controls and counters for secure frame verification” of IEEE 802.1AE_2018. - - - Ingress Key Table:
- Maximum of 32 entries. This table stores the 256-bit SAK, 128-bit H-Key, and a VALID bit
per entry. Validity of the key is known by the VALID bit. Ingress SAK LUT format is specified in the "MACsec Ingress Lookup Table Formats" section. TZ software programs this LUT.
- Depending on Cipher suite supported, SAK field is programmed with 128-bit key or 256-bit
key. Software should compute H from SAK as shown: - H = AES(SAK,0)
- Software does key programming and sets the VALID bit. When the corresponding PN
saturates, software should clear the VALID bit. (Hardware does not clear the VALID bit.)
- Steps to configure Ingress SAK LUT is described in the "Steps to Configure Tx/Rx KEY
TABLE LUT" section.
- MACsec Ingress LUT Formats
- Ingress Bypass Table Lookup
- The LUT structure is shown in the following figure. The depth of the table is 32. Each
Lookup entry has byte-based Mask or field-based Mask bits.
**Figure 10.55 Ingress Bypass LUT Structure**

- MACsec Functional Description
- Table 10.24 Ingress Bypass LUT
- Field
- Bit field
bits
- Description
- MAC_DA
[47:0]
- MAC Destination Address
- MAC_DA_MASK
[53:48]
- Byte Mask
- MAC_SA
[101:54]
- MAC Source Address
- MAC_SA_MASK
[107:102]
- Byte Mask
- ETYPE
[123:108]
- EtherType
- ETYP_MASK
[124:124]
- Field Mask
- VLAN_PCP
[127:125]
- VLAN Priority
- VLAN_PCP_MASK
[128:128]
- Field Mask
- VLAN_VID
[140:129]
- VLAN ID
- VLAN_VID_MASK
[141:141]
- Field Mask
- VLAN_VALID
[142:142]
- VLAN field valid[1]
- BYTE0_PATTERN
[150:143]
- Flexible byte0 value
- BYTE0_OFFSET
[156:151]
- Offset location within initial 64bytes of the
packet starting from first byte of MAC DA
- BYTE0_MASK
[157:157]
- Field Mask
- BYTE1_PATTERN
[165:158]
- Flexible byte1 value
- BYTE1_OFFSET
[171:166]
- Offset location within initial 64bytes of the
packet starting from first byte of MAC DA
- BYTE1_MASK
[172:172]
- Field Mask
- BYTE2_PATTERN
[180:173]
- Flexible byte2 value
- BYTE2_OFFSET
[186:181]
- Offset location within initial 64bytes of the
packet starting from first byte of MAC DA
- BYTE2_MASK
[187:187]
- Field Mask
- BYTE3_PATTERN
[195:188]
- Flexible byte3 value
- BYTE3_OFFSET
[201:196]
- Offset location within initial 64bytes of the
packet starting from first byte of MAC DA
- BYTE3_MASK
[202:202]
- Field Mask
- PREMPT
[203:203] 0 – Express packet, 1 – Preemptable packet
- PREMPT_MASK
[204:204]
- Field Mask

- MACsec Functional Description
- Field
- Bit field
bits
- Description
- UNCTRL_CTRL
[205:205]
- Lookup result.[2]

