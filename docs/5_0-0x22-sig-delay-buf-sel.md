# 5 :0 0x22 SIG_DELAY_BUF_SEL:

- For glitch filtering, the requirement from various wakes is to filter
glitches on width ~2ns. This register needs to be configured to 0xE before delay filer is enabled.
- WAKE_AOWAKE_DET_EN_0
- One SCR for the following register
- Offset: 0x4f0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: WAKE_SCR_GLB_CNTRL_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- Scratch Registers
- Bit
- Reset
- Description
- FALSE
DET_ENABLE:
- This field is used to enable detection of wake inputs. This should be enabled
on SC7 entry after all other wake configuration steps are complete. SC7 HW sequencer also enables this bit befor VDD_RTC is powered off. In this case, all wake events that occured until that point are lost. Hence recommendation is for SW to explicitly set this bit on SC7 entry. 0 = FALSE 1 = TRUE
- WAKE_AOWAKE_CTRL_0
- Offset: 0x4f4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: WAKE_SCR_GLB_CNTRL_SCR_0
- Reset: 0x00000002 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx10)
- Bit
- Reset
- Description
- TRUE
GLOBAL_COAL_EN: 0: Disable Coal Across all wakes, 1: Individual Coal_en takes effect. This field is a bit to disable coalescing for all wake events at one shot. There is a mandatory requirement from HW angle to enable coelescing for all wake events. Hence this bit should never be set to 0. 0 = FALSE 1 = TRUE
- FALSE
INTR_POLARITY:
- INTR polarity, specified for PMIC interrupt

