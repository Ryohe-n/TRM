# 0 = OFF 1 = ON

- RW
0x1 _NONE_ APP_CLK_PM_EN: Clock PM feature enabled by application. 0 = OFF 1 = ON
- RW
0x0 _NONE_ APP_XFER_PENDING:
- This bit can be set to indicate that AXI transfers pending and
prevents the core from entering L1. 0 = OFF 1 = ON
- RW
0x0 _NONE_ APP_REQ_EXIT_L1: SELF-CLEAR : Application request to Exit L1. 0 = OFF 1 = ON
- RW
0x1 _NONE_ APP_READY_ENTR_L23:
- Application Logic Ready to Enter L23. This bit should be
Cleared to prevert entry to L2. 0 = OFF 1 = ON
- RW
0x0 _NONE_ APP_REQ_ENTR_L1: SELF-CLEAR : Application request to Enter L1 ASPM state.
- This bit can be used to control L1 entry instead of using the
- L1 entry timer as defined in the PCI Express 3.0
- Specification. It is only effective when L1 is enabled. The
core latches this request when in L0 or L0s; to be acted upon later. 0 = OFF 1 = ON

- PCIe Root Port
- Bit
R/W
- Reset
- PROD
- Description
- RW
0x0 _NONE_ APP_LTSSM_ENABLE:
- HW-CLEAR : Driven low by application after cold, warm or hot
reset to hold the LTSSM in the Detect state until our application is ready for the link training to begin. When SW has finished reprogramming the core configuration registers, it should set this bit to allow the LTSSM to continue link establishment. Cleared by HW based on HW_HOT_RST_EN & HW_HOT_RST_MODE. 0 = OFF 1 = ON
- RW
0x0 0x1 SYS_PRE_DET_STATE:
- Presence Detect State. Indicates whether or not a card is
present in the slot 0 = OFF 1 = ON
- RO
0x0 _NONE_ SYS_PRE_DET_STATUS:
- Status bit to indicate presence detect state (combined
status of register SYS_PRE_DET_STATE and HW signal)
- PCIE_RP_APPL_INTR_EN_L0_0
NOTE: All the level 0 (_L0) status registers are read only. All the level 1 registers are write-one-clear registers. (Software needs to write to the corresponding register bit to clear the interrupt/fault once it services the interrupt/fault.)
- Offset: 0x8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xc0000000 (0b11xx,xxxx,xxx0,0000,0000,0000,00x0,0000)
- Bit
- Reset
- Description
0x1 SYS_MSI_INTR_EN: Global bit to enable/disable MSI interrupt generation. 0 = DIS 1 = EN 0x1 SYS_INTR_EN: Global bit to enable/disable Message interrupt generation. 0 = DIS 1 = EN

- PCIe Root Port
- Bit
- Reset
- Description
0x0 SAFETY_UNCORR_INT_EN:
- Enable for fault generation for the corresponding bit in
- APPL_INTR_STATUS_L1_0

