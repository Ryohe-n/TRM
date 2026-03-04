# 0 – uncontrolled port 1 – controlled port

- DVLAN_PKT
[206:206] Applicable for DVLAN tagged packets.
- Set it to 1 if DVLAN field of the packet needs
to be used in Lookup process.
- DVLAN_OUTERTAG_INNERTAG_S
- EL
[207:207] Applicable for DVLAN tagged packets.
- Selection field to choose between Outer and
- Inner VLANTAG of the DVLAN for lookup
process 0 – INNER TAG is used for the lookup 1 – OUTER TAG is used for the lookup [1] VLAN Valid = 1 means VLAN tag is used when VLAN tag is found in the packet. VLAN Valid=0 means VLAN tag is ignored even if it is found in the packet. [2] Lookup result is used to update the stats. In the case of controlled port bit, the stats counter (InPktsNoTag or InPktsUntagged counter based on MACSEC_CONTROL0_0.VALIDATE_FRAMES bit field settings) is incremented before bypassing the packet. In case of uncontrolled port bit, there will not be any changes in the stats counters. VALID bits of this LUT are moved to register MACSEC_RX_BYP_LUT_VALID_0.
- Ingress SCI Table Lookup
The lookup table structure is shown below.
**Figure 10.56 Ingress SCI Lookup Table Structure**

- MACsec Functional Description
- Table 10.25 Ingress SCI Lookup Table
- Field
- Bit field
bits
- Description
- SC_INDEX
[77:74]
- Lookup Result
- SC_Index
- PREEMPT_MASK
[73]
- Mask Preemption packet
- PREEMPT
[72]
- Preemption packet
- SCI_MASK
[71:64]
- Byte Mask
- SCI
[63:0]
- SCI value
VALID bits of this LUT are moved to register MACSEC_RX_SC_INDX_LUT_VALID_0.
- Ingress SC Params and Key Table
The table structures and table descriptions are shown below.
**Figure 10.57 Ingress Lookup Flow Diagram**

- MACsec Functional Description
- Table 10.26 Ingress SC State Table
- Field
- Bit field
- Bits
- Description
- CURR_AN

