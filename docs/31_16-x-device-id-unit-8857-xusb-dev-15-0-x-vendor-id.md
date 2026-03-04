# 31 :16 X DEVICE_ID_UNIT: 8857 = XUSB_DEV 15:0 X VENDOR_ID: 4318 = NVIDIA T_XUSB_DEV_CFG_1_0

- Offset: 0x4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXX0XXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,x0xx,xxxx,x000)

- XUSB DEV Registers
- Bit
R/W
- Reset
- Description
- RO
X DETECTED_PERR:
- The DETECTED_PERR bit indicates that the device has detected a
parity error, even if parity error handing is disabled. (Bit 6 - T_CONFIG_FPCI_PERR_DISABLED) 0 = NOT_ACTIVE
- RO
X
- SIGNALED_SERR: The SIGNALED_SERR bit indicates that the device
has asserted SERR#. 0 = NOT_ACTIVE
- RO
X RECEIVED_MASTER:
- The RECEIVED_MASTER bit indicates that a master device's
transaction (except for Special Cycle) was terminated with a master- abort. This means that no device on the PCI bus responded to the address of the mastered transaction. All master devices must implement this bit. When this bit is set, an interrupt is signaled in the PBUS_INTR_0 register. 0 = NO_ABORT
- RO
X RECEIVED_TARGET:
- The RECEIVED_TARGET bit indicates that a master device's
transaction was terminated with a target-abort. All master devices must implement this bit. When this bit is set, an interrupt is signaled in the PBUS_INTR_0 register. 0 = NO_ABORT
- RO
X SIGNALED_TARGET:
- The SIGNALED_TARGET bit indicates that the device has terminated a
transaction with target-abort. Devices that will never signal target- abort do not need to implement this bit. When this bit is set, an interrupt is signaled in the PBUS_INTR_0 register. 0 = NO_ABORT 26:25
- RO
X DEVSEL_TIMING:
- The DEVSEL_TIMING bits contain the timing of DEVSEL#. There are
three allowable timings for assertion of DEVSEL#. These are encoded as 00b for fast, 01b for medium, and 10b for slow (11b is reserved).
- These bits are read only and must indicate the slowest time that a
device asserts DEVSEL# for any bus command except Configuration
- Read and Configuration Write. FPCI positive decode device are
required to respond with fast DEVSEL# (0-cycle). Only the subtractive
- FPCI function responds with medium DEVSEL# to accept the cycle for
the subtractive bus. 0 = FAST
- RO
X MASTER_DATA_PERR: 0 = NOT_ACTIVE
- RO
X FAST_BACK2BACK:
- The FAST_BACK2BACK bit indicates that the device is capable of
handling back-to-back transfers when the transactions are not to the same agent. This bit can be set to 1 if the device can accept these transactions, and it must be set to 0 otherwise. 1 = CAPABLE
- RO
X _66MHZ:
- The 66 MHz bit indicates that the device is capable of 66 MHz PCI Bus
operation. This value is initialized by a strapping bit. 1 = CAPABLE

- XUSB DEV Registers
- Bit
R/W
- Reset
- Description
- RO
X CAPLIST:
- The CAPLIST bit indicates that the device configuration space
includes a capabilities list starting at the offset indicated by T_XUSB_CFG_13. 1 = PRESENT
- RO
X INTR_STATUS:
- The INTR_STATUS bit is read-only and reflects the state of the
interrupt in the device/function. Only when the INTR_DISABLE bit in the command register is a 0 and this INTR_STATUS bit is a 1, will the device's/function's INTx# signal be asserted. Setting the INTR_DISABLE bit to 1 has no effect on the state of this bit.
- RW
0x0 INTR_DISABLE:
- The INTR_DISABLE bit indicates that it could disable the device/
function from asserting INTx#. A value of 0 enables the assertion of
- INTx#, and a value of 1 disables the assertion of INTx# signal. The
- Device Status register is used to record status information for PCI bus
related events. 0 = ON 1 = OFF
- RO
X BACK2BACK: 0 = DISABLED
- RO
X SERR: 0 = DISABLED
- RO
X STEP: 0 = DISABLED
- RO
X PERR: 0 = DISABLED
- RO
X PALETTE_SNOOP:
- The PALETTE_SNOOP bit indicates that VGA compatible devices
should snoop their palette registers. When this bit is set, special palette snooping behavior is enabled (i.e., device must not respond).
- When the bit is reset, the device should treat palette accesses like all
other accesses. VGA compatible devices should implement this bit. PALETTE_SNOOP is writable. 0 = DISABLED
- RO
X WRITE_AND_INVAL:
- The WRITE_AND_INVAL bit indicates that the device can use the
- Memory Write and Invalidate command when the transfer is aligned,
and 16 bytes and the contents of the Cache Line Size Register is 4 DWORDS. When this bit is 1, masters may generate the command.
- When it is 0, Memory Write must be used instead. State after RST# is
0. This bit must be implemented by master devices that can generate the Memory Write and Invalidate command. 0 = DISABLED
- RO
X SPECIAL_CYCLE: 0 = DISABLED

- XUSB DEV Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 BUS_MASTER:
- The BUS_MASTER bit indicates that the device can act as a master on
the PCI bus. A value of 0 disables the device from generating PCI accesses. A value of 1 allows the device to behave as a bus master. BUS_MASTER is writable. 0 = DISABLED 1 = ENABLED
- RW
0x0 MEMORY_SPACE:
- The MEMORY_SPACE bit indicates that the device will respond to
memory space accesses. A value of 0 disables the device response. A value of 1 allows the device to respond to Memory space accesses. MEMORY_SPACE is writable. 0 = DISABLED 1 = ENABLED
- RW
0x0 IO_SPACE:
- The IO_SPACE bit indicates that the device will respond to I/O space
accesses. A value of 0 disables the device response. A value of 1 allows the device to respond to I/O space accesses. IO_SPACE is writable. 0 = DISABLED 1 = ENABLED T_XUSB_DEV_CFG_2_0
- Offset: 0x8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

