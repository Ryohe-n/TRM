# 1 :0 X WALK_PTR:

- Walk pointer for UMTIP port 0
- XUSB_AO_UTMIP_SLEEPWALK_CFG_0

- USB PADCTL and AO Registers
This is an array of four identical register entries; the register fields below apply to each entry. Full register list is: XUSB_AO_UTMIP_SLEEPWALK_CFG_<i>, among which <i> belongs to <0..3>.
- Offset: 0xd0,..,0xdc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00380001 (0bxxxx,xxxx,x011,1000,0000,0000,0000,0001)
- Bit
- Reset
- Description
0x0 MASTER_CFG_SEL:
- Enables low power mode
0x1 LINE_WAKEUP_EN:
- Enables latching line wakeup event

