# 3 :0 0x4 DEVICE_TYPE: Mode of operation of the controller END_POINT=0x0, ROOT_PORT=0x4. Dual Mode controller only. 0 = END_POINT 4 = ROOT_PORT

- PCIE_RP_APPL_CFG_BASE_ADDR_0
BASE_ADDR is required to perform address decodes to identify whether an outbound request is targeting external devices or the controller's configuration register space, including the shadow registers.
- Offset: 0x104
- Read/Write: R/W

- PCIe Root Port
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x10000000 (0b0001,0000,0000,0000,0000,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description

