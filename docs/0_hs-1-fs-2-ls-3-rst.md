# 0 = HS 1 = FS 2 = LS 3 = RST

- XUSB_AO_UTMIP_SLEEPWALK_STATUS_0
This is an array of four identical register entries; the register fields below apply to each entry. Full register list is: XUSB_AO_UTMIP_SLEEPWALK_STATUS_<i>, among which <i> belongs to <0..3>.
- Offset: 0xa0,..,0xac
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x000000XX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X WAKE_ALARM: A wake event occurred on UTMIP port 0 X USBON_VAL:
- Value of D- line detector for UTMIP port 0
X USBOP_VAL:
- Value of D+ line detector for UTMIP port 0

