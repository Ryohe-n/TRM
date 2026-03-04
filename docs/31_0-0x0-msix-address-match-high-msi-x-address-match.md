# 31 :0 0x0 MSIX_ADDRESS_MATCH_HIGH: MSI-X Address Match High Address. Note: This register field is sticky.

- PCIE_X<j>_EP_PF0_PORT_LOGIC_MSIX_DOORBELL_OFF_0
where <j> = 4, 8.
- Description:When you enable the MSI-X Table RAM feature (MSIX_TABLE_EN=1), the controller
implements the logic and RAM required to generate MSI-X requests. For more details, see the Interrupts section in the "Controller Operations" chapter of the Databook. - For AXI configurations: when your local application writes (MWr) to the address defined in MSIX_ADDRESS_MATCH_LOW_OFF, the controller will load this register with the contents of the
- MWr and subsequently create and send MSI-X TLPs. - For non-AMBA configurations: when your
local application writes to this register, the controller will create and send MSI-X TLPs.
- PCIE_X4_EP_PF0_PORT_LOGIC_MSIX_DOORBELL_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_MSIX_DOORBELL_OFF_0

- PCIe x4/x8 Endpoint
- Offset: 0x948
- Read/Write: WO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

