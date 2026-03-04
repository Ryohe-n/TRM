# 15 :0 X VENDOR_ID: 4318 = NVIDIA T_XUSB_CFG_1_0 The Device Control Command register provides coarse control over a device's ability to generate and respond to PCI cycles.

- Offset: 0x4
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xXXXX0XXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,x0xx,xxxx,x000)
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
transaction with target-abort. Devices that will never signal target- abort do not need to implement this bit. When this bit is set, an interrupt is signaled in the PBUS_INTR_0 register. 0 = NO_ABORT

- XHCI Controller Configuration Registers
- Bit
R/W
- Reset
- Description

