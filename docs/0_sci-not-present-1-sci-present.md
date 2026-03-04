# 0 – SCI Not present, 1 – SCI present

- Tie-off fields in TCI as shown
- SCB – 0
E – 0 C – 0
- SCI
[135:72]
- This field is sent as SCI field in SecTAG if SC bit is
set to 1. Note:
- Even for the case (ES =1, SC =0), software should
populate this LUT field with the correct value that is with {MAC-SA, 0x0001}.
- VLAN_IN_CLR
[136:136]
- Indicates whether SecTAG header should be
before VLAN or after VLAN. 0 – SecTAG should be before VLAN tag 1 – SecTAG should be after VLAN tag

- MACsec Functional Description
- MACsec Egress Lookup Flow Chart
The following diagram shows the Egress Lookup Flow.
**Figure 10.53 Egress Lookup Flow Chart**
- MACsec ICV GENERATION
The next step after Egress SC lookup stage is ICV generation. AES_CORE for ICV generation requires the following inputs. SAK[255:0] derived from key LUT. The TZ app programs this field. H[127:0] derived from LUT. H=AES(SAK,0) The TZ app programs this field.
- Additional Authenticated Data (AAD) which is packet data from MAC-DA, MAC-SA, SecTAG,
and user data.
- IV = {SCI, PN}. The 64bit SCI is derived from Egress SC Parameter Table and 32bit PN is
derived from Egress SA state Table.

- MACsec Functional Description
- IV is different between two calls to the AESGCM Engine, as every ethernet frame uses a
different PN number. AES-GCM-128 is the default cipher suite. In default mode, key size is 128 bits. In AES-GCM-256 mode, key size is 256 bits. The basic AES core processes 16 bytes of data at a time. For the 128-bit key, it takes 12 clocks to complete processing of 128 bits data. For 256-bit key, it takes 16 clocks to complete processing of one 128-bit data.
**Figure 10.54 ICV Generation Flow**
##### 10.7.2.1.3 MAC Tx
In MGBE wrapper, this block interfaces with PCS through the XGMII interface for MGBE. This block converts internal information like SOP, EOP, data, and so on to XGMII data and control characters. In ETHER_QOS wrapper, this block converts internal information like SOP, EOP, and data to RGMII data and control characters.
- FCS (Ethernet CRC) RECALCULATION
When the MACsec header and ICV are inserted into the packet, FCS is recalculated. For bypass packets with modifications, FCS is regenerated. In short, in the MACsec IP, FCS is always calculated for both, bypassed, and not-bypassed packets.

- MACsec Functional Description
#### 10.7.2.2 MACsec Rx Details
##### 10.7.2.2.1 MAC Rx
In MGBE wrapper, this block interfaces with PCS through the XGMII interface. This block converts XGMII interface data and control signals to internal information like SOP, EOP, and data. In ETHER_QOS wrapper, this block converts RGMII data and control interface signals to internal information like SOP, EOP, and data.
##### 10.7.2.2.2 MACsec Rx Core
The MACsec Rx Flow is used to carry out MACsec operation on the incoming packets. The following table lookups are used in MACsec Ingress flow.
- Ingress Bypass table
- Ingress SCI LUT
- Ingress SC Params table
- Ingress SC state table
- Ingress SA state table
- Ingress SC key table
The lookup classification determines whether the packet should be: Bypassed. Dropped if there is no lookup match or ICV Validation fails. MACsec processed i.e. packet validation and removing SEC_TAG and ICV fields from the PKT.
- Description of MACsec Ingress LUT
The descriptions of Ingress LUT:
- INGRESS Bypass LUT: On Ingress side, non-MACsec packets go through Bypass Lookup
logic. MACsec standard supports the existence of uncontrolled port and controlled port traffic on same physical port. Uncontrolled port traffic should bypass MACsec functionality. To support this feature, Ingress bypass table lookup is provided.
- Ingress Bypass LUT format is specified in the "MACsec Ingress Lookup Table Formats"
section.
- Based on the configuration in MACSEC_RM_TX_BYP CBB BLF register, either TZ or RM can
program this LUT. Default configuration of the BLF allows RM to program this lookup table.

- MACsec Functional Description
- The bypass lookup holds maximum of 32 entries. Software can write/read the entries to/
from this table. Hardware only uses the data from this table to determine whether to bypass the packet. The following fields are extracted from the packet and compared with LUT entries. - - - -
- MAC-SA, MAC-DA,
- VLAN ID, VLAN Priority,
- EtherType

