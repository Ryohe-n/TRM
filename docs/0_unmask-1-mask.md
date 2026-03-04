# 0 = UNMASK 1 = MASK

- PMC_IMPL_RAMDUMP_CTL_STATUS2_0
- Offset: 0x8e8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_RAMDUMP_COM2_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
- DISABLE
RAMDUMP_EN:
- Ramdump enable. This bit is only writable when
SECURE_BOOT_MODE is 1. This bit enables/disables the RamDump state machine in PMC. 1 = ENABLE 0 = DISABLE
- PMC_IMPL_IO_SYS_DPD_REQ_0
Puts IO rails in dpd mode or out of dpd mode , even when chip is not in SC7 mode. Multiple bits are allowed to be set at the same time. There is one DPD Sequencer per IO_DPD_REQ register. All DPD requests keyyed in before setting CODE bit are sequenced at the same time. Note there is a single sample bit (CODE field) per IO_DPD_REQ register. No new operation wil be triggered until previous one completes. Consequtive operations issued before the completion time of first one, will be dropped, but register will be still updated. There is no wait required to write between DPD_REQ,
- DPD2_REQ, DPD7_REQ, DPD8_REQ as HW has been updated to execute the 4 instructions in
parallel through 4 different sequencers. After writing to IO_DPD_REQ register, S/W should wait for sometime before writing to the same register again (after reading the status) There is a timing relationship between sel_dpd assertion to e_dpd assertion (similarly sel_dpd deassertion to e_dpd deassertion). This is controlled by a programmable timer (SEL_DPD_TIM register in the same page). When IO_DPD_REQ register is written, sel_dpd of the corresponding pads get asserted and after the SEL_DPD_TIM delay expiry, e_dpd gets asserted. state machine goes to idle only after this. So, the time between consecutive writes to IO_DPD_REQ twice should be - apb clock frequency

- PMC IMPL Registers
multiplied by (SEL_DPD_TIM value plus few apb clocks). Say : apb clock frequency *(SEL_DPD_TIM + 5). Same delay is applicable before S/W reads IO_DPD*_STATUS register after the corresponding IO_DPD*_REQ is written SEL_DPD_TIM should be set to safe value, but it can be lowered if APB clock is slower. (minimum 200 ns required) Note that SEL_DPD_TIM has to be set first to the required value and only then key in DPD requests in IO_DPD_REQ registers. SEL_DPD_TIM is not expected to be changed while the sequencer is active.
- Offset: 0xe014
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_IO_SYS_SCR_0
- Reset: 0x00000000 (0b00xx,xxxx,xxxx,xxxx,xxxx,xxx0,0000,0000)
- Bit
- Reset
- Description

