# 1 - Force enabled , Blink at 32Khz (16us on and 16us off) 14:0 0x7fff DATA_ON: time on

- PMC_IMPL_NO_IOPOWER_0
- Offset: 0x34
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_NO_IOPOWER_SCR_0
- Reset: 0x00000000 (0bxxxx,x0xx,x0xx,0xxx,x0xx,x00x,x000,00x0)
- Bit
- Reset
- Description
- DISABLE
- Reserved
- PMC_IMPL_E_18V_PWR_0
DDR_PWR This register is used to program the E_18V pin of the pads listed for each of the fields.

- PMC IMPL Registers
- Offset: 0x3c
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_E_18V_PWR_SCR_0
- Reset: 0x00000070 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x111,xx0x)
- Bit
- Reset
- Description
- ENABLE
EQOS: 0 = DISABLE 1 = ENABLE
- ENABLE
SPI: 0 = DISABLE 1 = ENABLE
- ENABLE
DBG: 0 = DISABLE 1 = ENABLE
- DISABLE
UFS: 0 = DISABLE 1 = ENABLE
- PMC_IMPL_E_33V_PWR_0
This register is used to program the E_33V pin of the pads listed for each of the fields.
- Offset: 0x40
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_E_33V_PWR_SCR_0
- Reset: 0x00000053 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,x1x1,xx11)
- Bit
- Reset
- Description
- ENABLE
SDMMC3_HV: 0 = DISABLE 1 = ENABLE
- ENABLE
SDMMC1_HV: 0 = DISABLE 1 = ENABLE
- ENABLE
AUDIO_HV: 0 = DISABLE 1 = ENABLE
- ENABLE
AO_HV: 0 = DISABLE 1 = ENABLE

- PMC IMPL Registers
- PMC_IMPL_OSC_EDPD_OVER_0
- PLLMSB_WB0_OVERRIDE2
This register can be programmed to keep oscillator ON during LP0 mode. It cuts the latency time on LP0 wake if oscillator pad does not have to be restarted. When oscillator pad is on, during LP0 mode, dspare, duty, strength , bypass are controlled by fields bellow Oscillator can be in one in forth modes during LP0 - in DPD, not DPD but not enabled, running, running only when external request is active.
- Offset: 0x60
- Read/Write: R/W
- Parity Protection: See table below
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_CNTRL_SCR_0
- Reset: 0x00000002 (0bxxxx,xxxx,0000,0000,0000,0000,0000,0010)
- Bit
- Parity Protection
- Reset
- Description
Y 0x0 CLK_OK:
- Crystal oscillator clk_ok signal

