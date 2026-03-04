# 31 :16 0x229c DEVICE_ID:

- Device ID. The Device ID register identifies the particular Function. This
identifier is allocated by the vendor. Note: The access attributes of this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x10de VENDOR_ID:
- Vendor ID. The Vendor ID register identifies the manufacturer of the
- Function. Valid vendor identifiers are allocated by the PCI-SIG to ensure
uniqueness. It is not permitted to populate this register with a value of
- FFFFh, which is an invalid value for Vendor ID. Note: The access attributes of
this field are as follows: - Wire: No access. - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X8_RC_PF0_TYPE1_HDR_TYPE1_DEV_ID_VEND_ID_REG_0
- Reset: 0x229a10de (0b0010,0010,1001,1010,0001,0000,1101,1110)
- Bit
- Reset
- Description

