# 31 :20 0x148 NEXT_OFFSET:

- Next Capability Offset. This field contains the offset to the next PCI Express
- Capability structure or 000h if no other items exist in the linked list of
- Capabilities. For Extended Capabilities implemented in Configuration Space,
this offset is relative to the beginning of PCI-compatible Configuration Space and thus must always be either 000h (for terminating list of Capabilities) or greater than 0FFh. Note: The access attributes of this field are as follows: -
- Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky)
Note: This register field is sticky. 19:16 0x2 CAP_VERSION:
- Capability Version. This field is a PCI-SIG defined version number that indicates
the version of the Capability structure present. This field must be 2h if the End-End TLP Prefix Supported bit is set and must be 1h or 2h otherwise. Note:
- The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if
(DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x1 CAP_ID:
- AER Extended Capability ID. This field is a PCI-SIG defined ID number that
indicates the nature and format of the Extended Capability. The Extended
- Capability ID for the Advanced Error Reporting Capability is 0001h. Note: The
access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_AER_CAP_UNCORR_ERR_STATUS_OFF_0
where <j> = 4, 8. Description:The Uncorrectable Error Status Register (Offset 04h) indicates error detection status of individual errors on a PCI Express device Function. An individual error status bit that is Set indicates that a particular error was detected; software may clear an error status by writing a 1b to the respective bit. Register bits not implemented by the Function are hardwired to 0b.
- PCIE_X4_EP_PF0_AER_CAP_UNCORR_ERR_STATUS_OFF_0
- PCIE_X8_EP_PF0_AER_CAP_UNCORR_ERR_STATUS_OFF_0
- Offset: 0x104
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0xxx,00x0,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

