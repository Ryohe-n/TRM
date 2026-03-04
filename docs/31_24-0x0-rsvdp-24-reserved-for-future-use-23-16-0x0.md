# 31 :24 0x0 RSVDP_24: Reserved for future use. 23:16 0x0 PTM_REQ_NOM_CLOCK_T_INT:

- PTM Requester Nominal Clock Period Integral. Integral part of the nominal
- PTM local clock period. LSB is 1/(2^16) nanoseconds. For more details, see
the PTM section in the Databook. Note: This register field is sticky. 15:0 0x0 PTM_REQ_NOM_CLOCK_T_FRAC:
- PTM Requester Nominal Clock Period Fractional. Fractional part of the
nominal PTM local clock period, in nanoseconds. For more details, see the PTM section in the Databook. Note: This register field is sticky.
- PCIE_X<j>_EP_PF0_PTM_REQ_CAP_PTM_REQ_SCALED_CLOCK_T_OFF_0
where <j> = 4, 8. Description:For more details, see the PTM section in the Databook.
- PCIE_X4_EP_PF0_PTM_REQ_CAP_PTM_REQ_SCALED_CLOCK_T_OFF_0
- Offset: 0x36c
- PCIE_X8_EP_PF0_PTM_REQ_CAP_PTM_REQ_SCALED_CLOCK_T_OFF_0
- Offset: 0x380
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RW
0x0 PTM_REQ_SCALED_CLOCK_T_EN:
- PTM Requester Scaled Clock Period Enable. This bit is cleared
when the core_clk rate starts to change and can only be set when the clock period change is complete. For more details, see the PTM section in the Databook. Note: This register field is sticky.

- PCIe x4/x8 Endpoint
- Bit
R/W
- Reset
- Description

