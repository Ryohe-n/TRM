# 31 :16 0x229c PCI_TYPE0_DEVICE_ID:

- Device ID. The Device ID register identifies the particular Function. This
identifier is allocated by the vendor. Note: The access attributes of this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/ W(sticky) else R(sticky) Note: This register field is sticky. 15:0 0x10de PCI_TYPE0_VENDOR_ID:
- Vendor ID. The Vendor ID register identifies the manufacturer of the
- Function. Valid vendor identifiers are allocated by the PCI-SIG to ensure
uniqueness. It is not permitted to populate this register with a value of
- FFFFh, which is an invalid value for Vendor ID. Note: The access attributes of
this field are as follows: - Wire: R (sticky) - Dbi: if (DBI_RO_WR_EN == 1) then R/W(sticky) else R(sticky) Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_TYPE0_HDR_STATUS_COMMAND_REG_0
where <j> = 4, 8. Description: This register provides the status and controls the behavior of a function.
- PCIE_X4_EP_PF0_TYPE0_HDR_STATUS_COMMAND_REG_0
- PCIE_X8_EP_PF0_TYPE0_HDR_STATUS_COMMAND_REG_0
- Offset: 0x4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00100000 (0b0000,0000,0001,000x,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 DETECTED_PARITY_ERR: Detected Parity Error.
- RW
0x0 SIGNALED_SYS_ERR: Signaled System Error.
- RW
0x0 RCVD_MASTER_ABORT: Received Master Abort.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x0 RCVD_TARGET_ABORT: Received Target Abort.
- RW
0x0 SIGNALED_TARGET_ABORT: Signaled Target Abort. 26:25
- RO
0x0 DEV_SEL_TIMING:
- DEVSEL Timing. This field was originally described in the PCI Local Bus
- Specification. Its functionality does not apply to PCI Express. The
controller hardwires this field to 00b.
- RW
0x0 MASTER_DPE:
- Master Data Parity Error. This bit is set by a Function if the Parity Error
- Response bit in the Command register is 1b and either of the following
two conditions occurs: - Function receives a Poisoned Completion -
- Function transmits a Poisoned Request If the Parity Error Response bit
is 0b, this bit is never set.
- RO
0x0 FAST_B2B_CAP:
- Fast Back to Back Transaction Capable. This bit was originally
described in the PCI Local Bus Specification. Its functionality does not apply to PCI Express. The controller hardwires this bit to 0b.
- RO
0x0 RSVDP_22: Reserved for future use.
- RO
0x0 FAST_66MHZ_CAP: 66MHz Capable. This bit was originally described in the PCI Local Bus
- Specification. Its functionality does not apply to PCI Express. The
controller hardwires this bit to 0b.
- RO
0x1 CAP_LIST:
- Capabilities List. Indicates the presence of an Extended Capability list
item. Since all PCI Express device Functions are required to implement the PCI Express Capability structure, the controller hardwires this bit to 1b.
- RO
0x0 INT_STATUS:
- Emulation interrupt pending. When set, indicates that an INTx
emulation interrupt is pending internally in the Function. Setting the
- Interrupt Disable bit has no effect on the state of this bit. For
- Functions that do not generate INTx interrupts, the controller
hardwires this bit to 0b. 18:17
- RO
0x0 RSVDP_17: Reserved for future use. 15:11
- RO
0x0 PCI_TYPE_RESERV: Reserved.
- RW
0x0 PCI_TYPE0_INT_EN:
- Interrupt Disable. Controls the ability of a Function to generate INTx
emulation interrupts. - When set, Functions are prevented from asserting INTx interrupts. Note: - Any INTx emulation interrupts already asserted by the Function must be de-asserted when this bit is Set.
- INTx interrupts use virtual wires that must, if asserted, be de-asserted
using the appropriate Deassert_INTx message(s) when this bit is set. -
- Only the INTx virtual wire interrupt(s) associated with the Function(s)
for which this bit is set are affected. - For functions that generate INTx interrupts, this bit is required. For functions that do not generate INTx interrupts, this bit is optional.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RO
0x0 RSVDP_9: Reserved for future use.
- RW
0x0 PCI_TYPE0_SERREN:
- SERR# Enable. When set, this bit enables reporting upstream of Non-
fatal and Fatal errors detected by the Function. Note: The errors are reported if enabled either through this bit or through the PCI Express specific bits in the Device Control register.
- RO
0x0 PCI_TYPE_IDSEL_STEPPING:
- IDSEL Stepping/Wait Cycle Control. This bit was originally described in
the PCI Local Bus Specification. Its functionality does not apply to PCI Express. The controller hardwires this bit to 0b.
- RW
0x0 PCI_TYPE0_PARITY_ERR_EN:
- Parity Error Response. This bit controls the logging of poisoned TLPs in
the Master Data Parity Error bit in the Status register.
- RO
0x0 PCI_TYPE_VGA_PALETTE_SNOOP:
- VGA Palette Snoop. This bit was originally described in the PCI Local
Bus Specification and the PCI-to-PCI Bridge architecture specification.
- Its functionality does not apply to PCI Express, the controller hardwires
this bit to 0b.
- RO
0x0 PCI_TYPE_MWI_ENABLE:
- Memory Write and Invalidate. This bit was originally described in the
- PCI Local Bus Specification and the PCI-to-PCI Bridge architecture
specification. Its functionality does not apply to PCI Express, the controller hardwires this bit to 0b.
- RO
0x0 PCI_TYPE0_SPECIAL_CYCLE_OPERATION:
- Special Cycle Enable. This bit was originally described in the PCI Local
- Bus Specification. Its functionality does not apply to PCI Express. The
controller hardwires this bit to 0b.
- RW
0x0 PCI_TYPE0_BUS_MASTER_EN:
- Bus Master Enable. Controls the ability of a Function to issue Memory
and I/O Read/Write requests. - When this bit is set, the Function is allowed to issue Memory or I/O Requests. - When this bit is clear, the
- Function is not allowed to issue any Memory or I/O Requests. Requests
other than Memory or I/O Requests are not controlled by this bit. Note:
- MSI/MSI-X interrupt Messages are in-band memory writes, setting the
- Bus Master Enable bit to 0b disables MSI/MSI-X interrupt Messages as
well. Note: The access attributes of this field are as follows: - Wire: R/W
- Dbi: R/W
- RW
0x0 PCI_TYPE0_MEM_SPACE_EN:
- Memory Space Enable. Controls a Function's response to Memory
- Space accesses. - When this bit is set, the Function is enabled to
decode the address and further process Memory Space accesses. -
- When this bit is clear, all received Memory Space accesses are caused
to be handled as Unsupported Requests. For a Function does not support Memory Space accesses, the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: ! has_mem_bar ? RO : RW - Dbi: !has_mem_bar ? RO : RW

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description
- RW
0x0 PCI_TYPE0_IO_EN: IO Space Enable. Controls a Function's response to I/O Space accesses.
- When this bit is set, the Function is enabled to decode the address
and further process I/O Space accesses. - When this bit is clear, all received I/O accesses are caused to be handled as Unsupported
- Requests. For a Function that does not support I/O Space accesses,
the controller hardwires this bit to 0b. Note: The access attributes of this field are as follows: - Wire: !has_io_bar ? RO : RW - Dbi: ! has_io_bar ? RO : RW
- PCIE_X<j>_EP_PF0_TYPE0_HDR_CLASS_CODE_REVISION_ID_0
where <j> = 4, 8. Description: This register specifies the class code and revision ID of a function.
- PCIE_X4_EP_PF0_TYPE0_HDR_CLASS_CODE_REVISION_ID_0
- PCIE_X8_EP_PF0_TYPE0_HDR_CLASS_CODE_REVISION_ID_0
- Offset: 0x8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x060400a1 (0b0000,0110,0000,0100,0000,0000,1010,0001)
- Bit
- Reset
- Description

