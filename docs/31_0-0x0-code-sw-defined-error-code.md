# 31 :0 0x0 CODE: SW Defined Error Code.

- Bits from this register connect to the IPs Error Collator
err_<x>_user[31:0] signal.
- NVCSI_GLOBAL_SW_ERR_ASSERT_0
- Offset: 0x3b
- Byte Offset: 0xec
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 SW_ASSERT:
- When written with value 1'b1, this self clearing bit generates a pulse of 1
clock cycle from the unit.
- This pulse is dual_rail_converted by the IP {bit,~bit} and connected to the
- Error Collator err_x
- NVCSI_GLOBAL_SPARE0_0
- Offset: 0x3c
- Byte Offset: 0xf0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

