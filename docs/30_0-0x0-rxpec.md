# 30 :0 0x0 RXPEC:

- Rx Parser Error count This 31-bit counter is incremented when the Rx Parser
encounters the following error scenarios: - Current Instruction Address >
- NVE[] - Number of Parsed Instructions > (NPE + 1) - Current Instruction's
- Frame offset > EOF frame offset or Last Parasable Byte - Parsing is not
complete even after receiving the next to next packet SOF The counter is cleared when the register is read.
- MGBE_DWCXG_DMA_DMA_CH0_TXEXTCFG_0
This register can be accessed only via indirect addressing. The register is added in the spec for informational purpose only. Please refer to databook for details to access this register. This register contains data related to per channel Tx weights used for Weighted Round Robin Arbitration of Tx DMA Data Reads.
- Offset: 0x25503084
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

