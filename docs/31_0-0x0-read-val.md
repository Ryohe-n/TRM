# 31 :0 0x0 read_val

- IST_RAM_STATUS_0
- RAM status register
bit 0 - Write_done: goes high when the intended number of bytes are written. bit 1 - Read_done: goes high when the intended number of bytes are read. bit 2 - Write_read_overflow: indicates Software is trying to write/read more than requested. It will get asserted irrespective of state of write_lock bit. These bits are cleared when the next read/write RAM_CTRL_NO_DWORDS is programmed.
- Offset: 0x54
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x000)
- Bit
- Reset
- Description
0x0 write_read_overflow 0x0 read_done 0x0 write_done
- IST_RAM_TARGET_DWORD_0
This corresponds to the DWORD number which will be accessed next so that Software can read it for reference
- Offset: 0x58
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- IST Registers
- Bit
- Reset
- Description

