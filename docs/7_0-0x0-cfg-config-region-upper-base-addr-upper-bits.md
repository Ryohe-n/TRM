# 7 :0 0x0 CFG_CONFIG_REGION_UPPER_BASE_ADDR: Upper bits of base address. Refer CFG_CONFIG_REGION_BASE_ADDR.

- PCIE_RP_APPL_CFG_CONFIG_REGION_BASE_ADDR_0
BASE_LIMIT is required to perform address decodes to identify whether an outbound request is targeting PCIE configuration address space.
- Offset: 0x158
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x6fffffff (0b011x,1111,1111,1111,1111,1111,1111,1111)
- Bit
- Reset
- Description
0x0 CFG_CONFIG_REGION_EN: When set to 1, PCIE configuration region translation is enabled. This region controls the translation to Type0/Type1 CfgRd. 0x1 CFG_CONFIG_ECAM_MODE:
- When set to 1, 256 MB Address is translated to form
{Bus,Dev,Func,4'b0,Register} as per PCIe specification. 0x1 CFG_CONFIG_LIMIT_MODE:
- When ECAM_MODE=0, set this bit to enable complete 4GB region
of PCIE configuration space. 27:0 0xfffffff CFG_CONFIG_REGION_BASE_LIMIT:
- Defines the size of PCIE Configuration to be translated should
always be programmed to a value 2^N-1.
- PCIE_RP_PCIE_MISC_0
- Offset: 0x15c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)

- PCIe Root Port
- Bit
- Reset
- Description
0x0 INT_SEGREGATION_EN:
- When enabled, will route the interrupts to 4 separate lines
0x0 CFG_5G_MODE:
- When enabled, will route the inbound reads from link and DMA read
requests on AXI to a dedicated low latency port. Applicable only for C5 controller only. Do not set for other controllers.
- PCIE_RP_PTM_CTRL_0_0
- Offset: 0x160
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

