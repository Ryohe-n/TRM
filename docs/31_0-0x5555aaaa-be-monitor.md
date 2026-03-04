# 31 :0 0x5555aaaa BE_MONITOR:

- If monitoring is desired, this should be pre-filled to
non-0x5555aaaa pattern by SW.
- Asynchronously reset to 0x5555aaaa by POD BE trigger signal
- PMC_IMPL_SCPM_RESET_EN_0
- Offset: 0xf800
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_SCPM_COMM_SCR_0
- Reset: 0x0000001f (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx1,1111)
- Bit
- Reset
- Description
0x1 FSI_SCPM_RST_OUT_EN:
- Enables system reset when FSI_SCPM error output is triggered (=> 1'b1)
- Enabled by default
0x1 SOC_PSC_SE_CLK_SCPM_RST_OUT_EN:
- Enables system reset when SOC_PSC_SE_CLK_SCPM error output is
triggered (=> 1'b1)
- Enabled by default
0x1 SOC_BPMP_CORE_CLK_SCPM_RST_OUT_EN:
- Enables system reset when SOC_BPMP_CORE_CLK_SCPM error output is
triggered (=> 1'b1)
- Enabled by default
0x1 SOC_XTAL_SCPM_RST_OUT_EN:
- Enables system reset when SOC_XTAL_SCPM error output is triggered
(=> 1'b1)
- Enabled by default
0x1 RTC_XTAL_SCPM_RST_OUT_EN:
- Enables system reset when RTC_XTAL_SCPM error output is triggered
(=> 1'b1)
- Enabled by default
- PMC_IMPL_RTC_XTAL_SCPM_CONFIG_0
- Offset: 0xf900
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N

- PMC IMPL Registers
- SCR Protection: PMC_IMPL_SCR_RTC_XTAL_SCPM_SCR_0
- Reset: 0x80000001 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx01)
- Bit
- Reset
- Description
0x1 HSM_FAULT_EN:
- Enables HSM fault indication when unit SCPM Error output is triggered
(=> 1'b1)
- Disabled by default
0x0 CONFIG_VALID:
- To indicate DATAPATH_DEL select registers output is stable
0x1 EN:
- To disable SCPM completely by clock gating the inout clock when set to

