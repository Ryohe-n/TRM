# 31 :12 0x0 CFG_CONFIG_REGION_BASE_ADDR:

- If CFG_CONFIG_REGION_EN=1, 256 MB region starting at this address
belongs to PCIE configuration space.
- Value of this field should be aligned to a 256 MB region. Upper bit of
the base address are derived from CFG_CONFIG_REGION_UPPER_BASE_ADDR.
- Size of the region can be reduced by configuring
CFG_CONFIG_REGION_BASE_LIMIT.
- PCIE_RP_APPL_CFG_CONFIG_REGION_UPPER_BASE_ADDR_0
BASE_ADDR is required to perform address decodes to identify whether an outbound request is targeting PCIE configuration address space.
- Offset: 0x154
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PCIe Root Port
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

