# 13 :3 X FRAME: 0 = INIT 2:0 X UFRAME: 0 = INIT T_XUSB_DEV_XHCI_PORTPM_0

- Port PM Status and Control Register
- Offset: 0x4c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0Xffff01 (0b0000,11x0,1111,1111,1111,1111,0000,0x01)

- USB 3.0 Device Controller Memory-Mapped I/O Registers
- Bit
R/W
- Reset
- Description
- RW
0x0 PNG_CYA: 0 = INIT
- RW
0x0
- FRWE: Enables the port to generate resume signaling. This bit
reflects the Function Remote Wake Enable bit captured in the
- SET_FEATURE device request. This field shall be set to 0x0 by the
transition of Port Reset from 0x0 to 0x1. 0 = INIT
- RW
0x0
- U2E: Enables the port to initiate U2 entry or accept U2/L1 entry
requests. Software sets this bit when U2 is enabled by the
- SET_FEATURE device request and software clears this bit when U2
is disabled by the CLEAR_FEATURE device request. This field shall be set to 0x0 by the transition of Port Reset from 0x0 to 0x1. 0 = INIT
- RW
0x0
- U1E: Enables the port to initiate U1 entry or accept U1 entry
requests. Software sets this bit when U1 is enabled by the
- SET_FEATURE device request and software clears this bit when U1
is disabled by the CLEAR_FEATURE device request. This field shall be set to 0x0 by the transition of Port Reset from 0x0 to 0x1. 0 = INIT
- RW
0x1
- WOD: Wake on Disconnection - Writing this bit to 0x1 enables the
port to be sensitive to Vbus disconnects as system wake-up events. 1 = INIT
- RW
0x1
- WOC: Writing this bit to 0x1 enables the port to be sensitive to
- Vbus connects as system wake-up events. This bit is not valid for
the Debug Capability. The host PORTSC register is used to control the wake on connect for host ports. 1 = INIT
- RO
X
- VBA: Indicates whether Vbus is detected at the port. 0x1 indicates
Vbus is present and 0x0 indicates Vbus is not detected. 0 = INIT
- RW
0x0 FLA: 0 = INIT 23:16
- RW
0xff U1TIMEOUT: 255 = INIT 15:8
- RW
0xff U2TIMEOUT: 255 = INIT 7:4
- RW
0x0 HIRD: 0 = INIT
- RW
0x0 RWE: 0 = DISABLED 1 = ENABLED 1:0
- RW
0x1 L1S: 0 = DROP 1 = ACCEPT 2 = NYET 3 = STALL T_XUSB_DEV_XHCI_EP_HALT_0

- USB 3.0 Device Controller Memory-Mapped I/O Registers
- EP HALT register used by software to program an EP to respond to host request with STALL
transaction. When this bit is set, hardware preserves certain EP parameters but software can modify the transfer ring after setting this bit.
- Offset: 0x50
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

