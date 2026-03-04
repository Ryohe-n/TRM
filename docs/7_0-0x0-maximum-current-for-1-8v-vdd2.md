# 7 :0 0x0 MAXIMUM_CURRENT_FOR_1_8V_VDD2:

- Maximum Current for 1.V VDD2
- SDMMCA_FORCE_EVENT_0
- Force Event for Auto CMD12 Error Status Register
The Force Event Register is not a physically implemented register. Rather, it is an address at which the Auto CMD12 Error Status Register can be written.
- Writing 1 : set each bit of the Auto CMD12 Error Status Register
- Writing 0 : no effect

- SDMMCA Registers
- Offset: 0x50
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,xxxx,xxxx,0x00,0000)
- Bit
- Reset
- Description

