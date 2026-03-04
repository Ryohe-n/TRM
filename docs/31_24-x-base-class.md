# 31 :24 X BASE_CLASS:

- The CLASS_CODE bits identify the generic function of the device and (in some
cases) a specific register-level programming interface. The register is broken into three byte-size fields. The upper byte (at offset 0BH) is a base class code which broadly classifies the type of function the device performs. The middle- byte (at offset 0BH) is a sub-class code which identifies more specifically the function of the device. The lower byte (at offset 09H) identifies a specific register-level programming interface (if any) so that device independent software can interact with the device. The Class Code and Revision ID are defined by parameters per block. 12 = SBC 23:16 X SUB_CLASS: 3 = XUSB 15:8 X PROG_IF: 254 = CUSTOM 7:0 X REVISION_ID:
- The REVISION_ID bits specify a device specific revision identifier. The value is
chosen by the vendor. Zero is an acceptable value. This field should be viewed as a vendor defined extension to the DEVICE_ID. 161 = VAL

- XUSB DEV Registers
T_XUSB_DEV_CFG_3_0
- Offset: 0xc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00XXXXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X HEADER_TYPE_FUNC: 0 = SINGLE 22:16 X HEADER_TYPE_DEVICE:
- The HEADER_TYPE bits identify the layout of the bytes 10h through 3FH in
configuration space and also whether or not the device contains multiple functions. Bit 7 in this register is used to identify a multi-function device. If the bit is 0, then the device is single function. If the bit is 1, then the device has multiple functions. Bits 6 through 0 specify the layout of bytes 10h through 3Fh. The LATENCY_TIMER and HEADER_TYPE are defined by parameters per block. 0 = NON_BRIDGE 15:11 X LATENCY_TIMER:
- The LATENCY_TIMER bits contain, in units of PCI bus clocks, the value of the
- Latency Timer for this PCI bus master. This register must be implemented as
writable by any master that can burst more than two data phases. This register may be implemented as read-only for devices that burst two or fewer data phases, but the hardwired value must be limited to 16 or less. A typical implementation would be to build the five high-order bits (leaving the bottom three as read-only), resulting in a timer granularity of eight clocks. At reset, the register should be set to 0 (if programmable). LATENCY_TIMER bits are writable. 0 = _0_CLOCKS 7:0 X CACHE_LINE_SIZE: 0 = _0 T_XUSB_DEV_CFG_4_0
- Offset: 0x10
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000XXXX (0b0000,0000,0000,0000,0xxx,xxxx,xxxx,xxxx)

- XUSB DEV Registers
- Bit
R/W
- Reset
- Description

