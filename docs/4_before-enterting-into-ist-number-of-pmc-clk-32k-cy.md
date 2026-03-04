# 4 before enterting into IST. Number of pmc_clk (32K) cycles before L1b reset deassertion 7:0 0x0 0x4 L1ARST:

- Number of pmc_clk (32K) cycles before L1a reset
deassertion
- PMC_IMPL_VFMON_ACTION_0
- VFMON Registers
These are all RWTO because they need to be reset on L0 cold reset since VFMON causes an L1a reset.

- PMC IMPL Registers
- Offset: 0x1d4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_VFMON_CTRL_SCR_0
- Reset: 0x80000005 (0b1xxx,xxxx,xxxx,0000,0000,0000,0000,0101)
- Bit
- Reset
- Description
0x1 VMON_EN: Enable for VMON. 19:18
- NONE
VDD_FSI_MAX_FAULT_ACTION: Action to be triggered upon vdd_fsi rail max threshold breach fault.
- Check L0L1A_RST_SOURCE_EN for only enable

