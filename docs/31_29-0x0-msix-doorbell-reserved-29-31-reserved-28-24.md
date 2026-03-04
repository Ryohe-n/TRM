# 31 :29 0x0 MSIX_DOORBELL_RESERVED_29_31: Reserved. 28:24 0x0 MSIX_DOORBELL_PF:

- MSIX Doorbell Physical Function. This register determines the Physical
Function for the MSI-X transaction. 23:16 0x0 MSIX_DOORBELL_VF:
- MSIX Doorbell Virtual Function. This register determines the Virtual
Function for the MSI-X transaction. 0x0 MSIX_DOORBELL_VF_ACTIVE:
- MSIX Doorbell Virtual Function Active. This register determines whether
a Virtual Function is used to generate the MSI-X transaction. 14:12 0x0 MSIX_DOORBELL_TC:
- MSIX Doorbell Traffic Class. This register determines which traffic class
to generate the MSI-X transaction with. 0x0 MSIX_DOORBELL_RESERVED_11: Reserved. 10:0 0x0 MSIX_DOORBELL_VECTOR:
- MSI-X Doorbell Vector. This register determines which vector to
generate the MSI-X transaction for.
- PCIE_X<j>_EP_PF0_PORT_LOGIC_MSIX_RAM_CTRL_OFF_0
where <j> = 4, 8.
- Description:When you enable the MSI-X Table RAM feature (MSIX_TABLE_EN=1), the controller
implements the logic and RAM required to generate MSI-X requests. For more details, see the Interrupts section in the "Controller Operations" chapter of the Databook.
- PCIE_X4_EP_PF0_PORT_LOGIC_MSIX_RAM_CTRL_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_MSIX_RAM_CTRL_OFF_0
- Offset: 0x94c
- Read/Write: See table below
- Parity Protection: N
- Shadow: N

- PCIe x4/x8 Endpoint
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description

