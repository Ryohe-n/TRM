# 31 :0 0xfffffc00 BATCH_MASK:

- Specify when to flush the atom out to memory. In order to improve
- MC performace, before line break ATOMP always tries to buffer
more atomps before it writes to MC until below equation satisfied. (cur_addr[39:0] & {8\'hff, batch_flush_mask[31:0]} !
- next_addr[39:0] & {8\'hff, batch_flush_mask[31:0]})
default value is 0xFFFFFC00 to make it flush out @ 1KB boundary
- VI_CFG_PPC_CALCULATION_0
- Offset: 0x102c
- Byte Offset: 0x40b0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- Video Input Registers
- Bit
- Reset
- Description
0x0 USE_NVCSI2VI_BUS: previously VI HW relied on data type to determine whether the current packet is 8ppc or 4ppc; there is a newly added bit on nvcsi->vi bus to indicate if the packet is 8ppc / 4ppc to avoid some DT overriding case this registers controls whether VI HW uses newly added bit to determine 8ppc/4ppc or still use legacy way which is DT based
- VI_CFG_REGISTER_DEBUG_ACCESS_0
- Offset: 0x102d
- Byte Offset: 0x40b4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 WR_ACT_SEL:
- Host write operations operate on both shadow and active register
(debug)
- This is for those double buffered register which do not belong any
channel space for example, FMLITE configuration registers 0x0 RD_MUX_SEL:
- Host read operations are on non-shadowed register (debug)
- This is for those double buffered register which do not belong any
channel space for example, FMLITE configuration registers
- VI_CFG_RESERVE_0_0
- Offset: 0x102e
- Byte Offset: 0x40b8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000XXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

