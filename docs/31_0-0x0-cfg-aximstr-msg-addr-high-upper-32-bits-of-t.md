# 31 :0 0x0 CFG_AXIMSTR_MSG_ADDR_HIGH: Upper 32 bits of the programmable AXI address for Messages. Note: This register field is sticky.

- PCIE_X<j>_EP_PF0_PORT_LOGIC_PCIE_VERSION_NUMBER_OFF_0
where <j> = 4, 8.
- Description:The version number is given in hex format. You should convert each pair of hex
characters to ASCII to interpret. Using 4.70a (GA) as an example: - VERSION_NUMBER = 0x3437302a which translates to 470* - VERSION_TYPE = 0x67612a2a which translates to ga**
- Using 4.70a-ea01 as an example: - VERSION_NUMBER = 0x3437302a which translates to 470* -

- PCIe x4/x8 Endpoint
- VERSION_TYPE = 0x65613031 which translates to ea01 GA is a general release available on
www.designware.com EA is an early release available on a per-customer basis.
- PCIE_X4_EP_PF0_PORT_LOGIC_PCIE_VERSION_NUMBER_OFF_0
- PCIE_X8_EP_PF0_PORT_LOGIC_PCIE_VERSION_NUMBER_OFF_0
- Offset: 0x8f8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x3536322a (0b0011,0101,0011,0110,0011,0010,0010,1010)
- Bit
- Reset
- Description

