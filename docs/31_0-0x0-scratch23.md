# 31 :0 0x0 SCRATCH23:

- To detect corruption of RAM based secure scratch during SC7
- SCRATCH_SCRATCH_SCRUB_STATUS_0
- Offset: 0x2078
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0
- SCRUB_DONE
#### 4.2.4.4 PMC Miscellaneous Registers
- PMC_MISC_DISP_SECURE_CTL_0
This register provides sticky bits to control SOR secure protection. It is programmed once during boot time.
- Offset: 0x0
- Read/Write: R/W
- Parity Protection: Y

- PMC Miscellaneous Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxx0,0000,0000,0000)
- Bit
- Reset
- Description
0x0 DISP_DSI_PAD_CTRL_OWNER:
- Write once sticky bit. This is a new bit from PMC required to allow SW to
select the owner between DCE and BPMP only or
- DCE, BPMP and CCPLEX. This bit will be set by MB1 depending whether the
driver is run from Nouveau stack or Nvidia stack. 0 = FALSE 1 = TRUE 0x0 DISP_PNL_CTRL_OWNER:
- Write once sticky bit. This is a new bit from PMC required to allow SW to
select the owner between DCE and BPMP only or
- DCE, BPMP and CCPLEX. This bit will be set by MB1 depending whether the
driver is run from Nouveau stack or Nvidia stack. 0 = FALSE 1 = TRUE 0x0 DISP_PNL_RD_CTRL_OWNER:
- Write once sticky bit. This is a new bit from PMC required to allow SW to
select the owner between DCE and BPMP only or
- DCE, BPMP and CCPLEX. This bit will be set by MB1 depending whether the
driver is run from Nouveau // stack or Nvidia stack. 0 = FALSE 1 = TRUE 0x0 DISP_CLK_CTRL_OWNER:
- Write once sticky bit. This is a new bit from PMC required to allow SW to
select the owner between DCE only and DCE and CCPLEX. This is required to support the Nouveau usecases.
- This bit will be set by MB1 depending whether the driver is run from
Nouveau stack or Nvidia stack. 0 = FALSE 1 = TRUE 0x0 SOR_CLK_LINK_SEC_OWNER:
- Write once sticky bit. This is a new bit from PMC required to allow SW to
select the owner between TSEC- HS and MB1 for NV_PDISP_FE_CMGR_CLK_LINK_SEC_CTRL register.
- This register is one per physical link and protects the
links AVDD0.9, AVDD1.0 level and BG temperature controls from damaging the chip. 0 = FALSE 1 = TRUE 0x0 RESERVED7:
- Reserved. No sticky behaviour

