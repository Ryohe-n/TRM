# 31 :18 0x0 CFG_IATU_DMA_BASE_ADDR: 256 KB region starting at this address would be directed to iATU/DMA regions of the Device. Refer : ARPCIE_IATU_DMA documentation for offsets

- PCIE_RP_APPL_COH_IO_ACC_0
- Offset: 0x10c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)

- PCIe Root Port
- Bit
- Reset
- Description
0x0 COH_IO_ACC_OVERRIDE:
- Coherency override value : Override value to be used when
COH_IO_ACC_OVERRIDE_EN is 1. 0 = DIS 1 = EN 0x0 COH_IO_ACC_OVERRIDE_EN:
- Coherency override enable : If set the Snoop attributes on DBB will be
overridden with COH_IO_ACC_OVERRIDE. 0 = DIS 1 = EN
- PCIE_RP_APPL_CFG_MISC_0
- Offset: 0x110
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000cc00 (0bxxxx,xxxx,xxxx,xxxx,1100,1100,00xx,0000)
- Bit
- Reset
- Description
0x1 CFG_SLV_MASK_ERR:
- When enabled, Read data on AXI slave interface is set to all 1. when the
corresponding slverr/decode error is asserted by PCIE controller core. 0 = DIS 1 = EN 0x1 CFG_SLV_EP_MODE:
- When enabled, Read data on AXI slave interface is set to all 1. when the
corresponding completions have EP bit set. 0 = DIS 1 = EN 13:10 0x3 CFG_ARCACHE:
- CACHE attrributes for AXI interface for DBB. Indicates how the
transactions are required to progress thru the system 9:6 0x0 CFG_AWCACHE:
- CACHE attrributes for AXI interface for DBB. Indicates how the
transactions are required to progress thru the system 0x0 CFG_WRITE_RO:
- Outbound TLP attributes for CBB : TLP's RO bit
0x0 CFG_WRITE_NS:
- Outbound TLP attributes for CBB : TLP's NS bit
0x0 CFG_READ_RO:
- Outbound TLP attributes for CBB : TLP's RO bit

- PCIe Root Port
- Bit
- Reset
- Description
0x0 CFG_READ_NS:
- Outbound TLP attributes for CBB : TLP's NS bit
- PCIE_RP_APPL_CFG_SLCG_OVERRIDE_0
- Offset: 0x114
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000022 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx10,0010)
- PROD: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx0x,xx0x)
- Bit
- Reset
- PROD
- Description
0x1 0x0 SLCG_EN_MISC_APBCLK:
- CYA : Bypass for Second Level Clock Gating. If 1,
corresponding clock will always be enabled. Not used. 0x0 _NONE_ SLCG_EN_CTLR_AXISCLK:
- CYA : Bypass for Second Level Clock Gating. If 1,
corresponding clock will always be enabled. Clock gating for
- AXI bridge Slave interface to CBB
0x0 _NONE_ SLCG_EN_CTLR_AXIMCLK:
- CYA : Bypass for Second Level Clock Gating. If 1,
corresponding clock will always be enabled. Clock gating for
- AXI bridge Master interface to DBB
0x0 _NONE_ SLCG_EN_CTLR_RADMCLK:
- CYA : Bypass for Second Level Clock Gating. If 1,
corresponding clock will always be enabled. Clock gating for Rx data path 0x1 0x0 SLCG_EN_CTLR_AUXCLK:
- CYA : Bypass for Second Level Clock Gating. If 1,
corresponding clock will always be enabled. Clock gating for controllers Application Logic register accessible via APB. 0x0 _NONE_ SLCG_EN_MASTER:
- CYA : Bypass for Second Level Clock Gating. Master Switch to
- Disable
- PCIE_RP_APPL_CFG_PLL_0
- Offset: 0x118
- Read/Write: R/W
- Parity Protection: N
- Shadow: N

- PCIe Root Port
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000)
- Bit
- Reset
- Description
0x0 DIS_REFPD_IN_L2:
- CYA : PLL power down disable for corresponding Link State. If set PLLREF_PD
will not be asserted in this Low power state and PLL will lead to higher power consumption. 0x0 DIS_REFPD_IN_L1SUB:
- CYA : PLL power down disable for corresponding Link State. If set PLLREF_PD
will not be asserted in this Low power state and PLL will lead to higher power consumption. 0x0 DIS_REFPD_IN_L1:
- CYA : PLL power down disable for corresponding Link State. If set PLLREF_PD
will not be asserted in this Low power state and PLL will lead to higher power consumption. 0x0 DIS_PD_IN_L2:
- CYA : PLL power down disable for corresponding Link State. If set PLL_PD will
not be asserted in this Low power state and PLL will lead to higher power consumption. 0x0 DIS_PD_IN_L1SUB:
- CYA : PLL power down disable for corresponding Link State. If set PLL_PD will
not be asserted in this Low power state and PLL will lead to higher power consumption. 0x0 DIS_PD_IN_L1:
- CYA : PLL power down disable for corresponding Link State. If set PLL_PD will
not be asserted in this Low power state and PLL will lead to higher power consumption.
- PCIE_RP_INTERRUPT_FAULT_OVERRIDE_0
- Offset: 0x120
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,x000)
- Bit
- Reset
- Description
0x0 FORCE_INTD:
- DEBUG : Force corresponging interrupt line for connectivity verification
0x0 FORCE_INTC:
- DEBUG : Force corresponging interrupt line for connectivity verification
0x0 FORCE_INTB:
- DEBUG : Force corresponging interrupt line for connectivity verification

- PCIe Root Port
- Bit
- Reset
- Description
0x0 FORCE_INTA:
- DEBUG : Force corresponging interrupt line for connectivity verification
0x0 FORCE_SYS_FAULT:
- DEBUG : Force corresponging interrupt line for connectivity verification
0x0 FORCE_SYS_MSI_INTR:
- DEBUG : Force corresponging interrupt line for connectivity verification
0x0 FORCE_SYS_INTR:
- DEBUG : Force corresponging interrupt line for connectivity verification
- PCIE_RP_STAGGER_WINDOW_TIME_0
- Offset: 0x13c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 DISABLE_OPTIONAL_STAGGERING:
- Disable RX_CAL/RX_TRAIN_EN/RX_EOM_EN staggering. Un-used for PEX0
(VDD_SOC controllers) 15:0 0x0 STAGGER_WINDOW_CNT: count in TIMER clock (38.4 MHz, 26ns),value of N means N+1 cycle delay in
- HW, PEX1 stagger time window register. Un-used for PEX0 (VDD_SOC
controllers)
- PCIE_RP_CAR_RESET_PHY_CTRL_0
- Offset: 0x140
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 APP_HOLD_PHY_RST: Hold off Phy reset assertion.

- PCIe Root Port
- PCIE_RP_PCIE_BUS_DEVICE_NUM_0
- Offset: 0x144
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxx0,0000,0000,0000)
- Bit
- Reset
- Description

