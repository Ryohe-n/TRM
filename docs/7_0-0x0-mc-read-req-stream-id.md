# 7 :0 0x0 MC_READ_REQ_STREAM_ID:

- MC read transaction stream ID
- SDMMCA_TZ_DMA_CTRL_0
SDMMC DMA requests security attribute control register for DMA transaction (MC transaction) security attributes. This register is used to control write/read access to secure memory region. This register can be accessed only by TZ. Non-secure writes to this register are dropped by controller and reads return all ones. Controller will assert PSLVERR when this register is accessed by a non-secure master. Usage: wsb_ns = AWPROT[1] = ~{SDMMCxx_TZ_DMA_CTRL_MC_WRITE_REQ_TZ_ACCESS_EN}; rsb_ns = ARPROT[1] = ~{SDMMCxx_TZ_DMA_CTRL_MC_READ_REQ_TZ_ACCESS_EN};
- Offset: 0x200
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 MC_WRITE_REQ_TZ_ACCESS_EN:
- TZ must set this bit to 1 to enable write access to secure memory
region. TZ must clear this bit to disable write access to secure memory region. 0x0 MC_READ_REQ_TZ_ACCESS_EN: TZ must set this bit to 1 to enable read access to secure memory region. TZ must clear this bit to disable read access to secure memory region.
- SDMMCA_VENDOR_MISC_CNTRL3_0
- Offset: 0x204

- SDMMCA Registers
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x4f01000f (0b0100,1111,xxxx,xxx1,0000,0000,xxx0,1111)
- Bit
- Reset
- Description
0x0 ALLOW_INTRABLOCK_CLK_STALLING_IN_SDR50:
- This disables the intrablock clock stopping in SDR50 mode
0x1 STOP_TRIM_IN_CLK_DURING_TUNING:
- When set to 1, rx clk trimmer and rx fifos input clock is stopped when
tap value is changed during tuning process.
- When set to 0, rx clk trimmer and rx fifos input clock is not stopped
during tap value change. Trimmer output is also clamped to zero during tuning tap val change. 29:24 0xf TUNING_TRIMMER_RECOVERY_TIME:
- Trimmer output may glitch for 2 or 3 cycles, when tap value is changed
irrespective of its input clock state. We should not use trimmer output during this uncertainity window.
- If STOP_TRIM_IN_CLK_DURING_TUNING is set to 1,
- trimmer input clock is stopped for
- TUNING_TRIMMER_RECOVERY_TIME cycles and
- rx fifos input clock is stopped (trimmer output clock is clamped) for
TUNING_TRIMMER_RECOVERY_TIME cycles.
- This is required not to propagate glitch into FIFOs and other
downstream logic. 0x1 EXTEND_SYNC_INTR_MASK_DURING_ABORT_OR_STOP_CMD:
- When an async abort is issued during read operation, dat_fsm will move
to idle state as soon as CMD12/CMD52 END bit is sent by core.
- This would start sync_intr_period. But due to the intermediate delay
stages present in pipemacro and padmacro, END bit reaches device after some cycles. So, device would not stop data transmission till it sees END bit of ABORT CMD.
- During this time, core controller receives the data already driven by the
device.
- If DAT[1] line has any zeroes during this period, SDIO sync interrupt
detector will generate a spurious card interrupt.
- This register bit is used to mask sync intr detection period to avoid
spurious interrupts. SW should not write into this field unless it is published in TRM/IAS. 15:8 0x0 E_DIFF_DQ: diff/Vref rx selection for DAT[7:0]
- If set to 1, enables differential amplitude receiver for DAT lines in EMMC
IOBRICK. If set to 0, enables vref receiver for DAT lines in EMMC IOBRICK. (default) 0x0 E_DIFF_CMD: diff/Vref rx selection for CMD
- If set to 1, enables differential amplitude receiver for CMD in EMMC
IOBRICK.
- If set to 0, enables vref receiver for CMD in EMMC IOBRICK. (default)
0x1 DAT_OE_POSTAMBLE_EN:
- If set,DAT pads output driver will be disabled one cycle after END bit of
DATA pkt sent.
- If cleared, DAT pads output driver will be disabled in the same cycle END
bit is sent.

- SDMMCA Registers
- Bit
- Reset
- Description
0x1 DAT_OE_PREAMBLE_EN:
- If set,DAT pads output driver will be enabled one cycle before START bit
of DATA pkt is transmitted on DAT lines.
- If cleared, DAT pads output driver will be enabled in the same cycle
START bit is sent. 0x1 CMD_OE_POSTAMBLE_EN:
- If set,CMD pad output driver will be disabled one cycle after END bit of
CMD pkt sent.
- If cleared, CMD pad output driver will be disabled in the same cycle END
bit is sent. 0x1 CMD_OE_PREAMBLE_EN:
- If set,CMD pad output driver will be enabled one cycle before START bit
of CMD pkt is transmitted on DAT lines.
- If cleared, CMD pad output driver will be enabled in the same cycle
START bit is sent.
- SDMMCA_VENDOR_MISC_CNTRL4_0
- SPARE register1
- Offset: 0x20c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xffff0000 (0b1111,1111,1111,1111,0000,0000,0000,0000)
- Bit
- Reset
- Description

