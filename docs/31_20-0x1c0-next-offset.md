# 31 :20 0x1c0 NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Extended Capability structure or 000h if no other items exist in the linked
list of Capabilities. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x1 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that
indicates the version of the Capability structure present. This field is depends on version of the specification. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

