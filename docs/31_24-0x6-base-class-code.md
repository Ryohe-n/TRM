# 31 :24 0x6 BASE_CLASS_CODE:

- Base Class Code. A code that broadly classifies the type of operation the
- Function performs. Encodings for base class, are provided in the PCI Code and
ID Assignment Specification. All unspecified encodings are Reserved. Note:
- The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if
(DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 23:16 0x4 SUBCLASS_CODE:
- Sub-Class Code. Specifies a base class sub-class, which identifies more
specifically the operation of the Function. Encodings for sub-class are provided in the PCI Code and ID Assignment Specification. All unspecified encodings are Reserved. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:8 0x0 PROGRAM_INTERFACE:
- Programming Interface. This field identifies a specific register-level
programming interface (if any) so that device independent software can interact with the Function. Encodings for interface are provided in the PCI
- Code and ID Assignment Specification. All unspecified encodings are
- Reserved. Note: The access attributes of this field are as follows: - Wire: R
(sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
- Reset
- Description

