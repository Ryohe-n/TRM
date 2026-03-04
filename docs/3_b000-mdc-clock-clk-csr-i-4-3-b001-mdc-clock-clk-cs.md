# 3 'b000: MDC clock: clk_csr_i/4 - 3'b001: MDC clock: clk_csr_i/6 - 3'b010:

- MDC clock: clk_csr_i/8 - 3'b011: MDC clock: clk_csr_i/10 - 3'b100: MDC
clock: clk_csr_i/10 - 3'b101: MDC clock: clk_csr_i/14 - 3'b110: MDC clock: clk_csr_i/16 - 3'b111: MDC clock: clk_csr_i/18
- RW
0x0 SAADR:
- Skip Address Frame The application sets this bit to prevent the SMA
from sending address frames before read, write, or post-increment read frames. 17:16
- RW
0x0 CMD:
- Control Command SMA commands are written to these bits. The
command codes are: - 2'b11: SINGLE_READ - 2'b01: SINGLE_WRITE - 2'b10: POST INCREMENT READ OPERATION - 2'b00: Reserved (Results are undefined) 15:0
- RW
0x0 SDATA: Single Write Data For single writes, this field contains data to be written. For single reads, this field contains data that has been read.
- MGBE_DWCXG_CORE_MDIO_CONTINUOUS_WRITE_ADDRESS_0
You can program this register to start continuous write operation.
- Offset: 0x208
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

10G Ethernet Controller Core Registers
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

