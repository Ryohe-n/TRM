# 0 : Enabled 1 : Disabled

- PMC_IMPL_POD_GLOBAL_MONITOR_0
For FSI and CVx, the RTL connections are swapped, please read BE for FE and read FE for BE.
- Offset: 0xf014
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x0000XXXX (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx)
- Bit
- Reset
- Description
X POD_FSI_FE_TRIGGER:
- If set indicates that FSI POD FrontEnd triggered
X POD_FSI_BE_TRIGGER:
- If set indicates that FSI POD Backend triggered
X POD_CV2_FE_TRIGGER:
- If set indicates that CV2 POD FrontEnd triggered
X POD_CV2_BE_TRIGGER:
- If set indicates that CV2 POD Backend triggered
X POD_CV1_FE_TRIGGER:
- If set indicates that CV1 POD FrontEnd triggered
X POD_CV1_BE_TRIGGER:
- If set indicates that CV1 POD Backend triggered
X POD_CV0_FE_TRIGGER:
- If set indicates that CV0 POD FrontEnd triggered

- PMC IMPL Registers
- Bit
- Reset
- Description
X POD_CV0_BE_TRIGGER:
- If set indicates that CV0 POD Backend triggered
X POD_GPU_FE_TRIGGER:
- If set indicates that GPU POD FrontEnd triggered
X POD_GPU_BE_TRIGGER:
- If set indicates that GPU POD Backend triggered
X POD_CPU_FE_TRIGGER:
- If set indicates that CPU POD FrontEnd triggered
X POD_CPU_BE_TRIGGER:
- If set indicates that CPU POD Backend triggered
X POD_SOC_FE_TRIGGER:
- If set indicates that SOC POD FrontEnd triggered
X POD_SOC_BE_TRIGGER:
- If set indicates that SOC POD Backend triggered
X POD_RTC_FE_TRIGGER:
- If set indicates that RTC POD FrontEnd triggered
X POD_RTC_BE_TRIGGER:
- If set indicates that RTC POD Backend triggered
- PMC_IMPL_POD_FE_MONITOR_0
- Offset: 0xf018
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x5555aaaa (0b0101,0101,0101,0101,1010,1010,1010,1010)
- Bit
- Reset
- Description

