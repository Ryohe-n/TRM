# 29 :24 0xf TUNING_TRIMMER_RECOVERY_TIME:

- Trimmer output may glitch for 2 or 3 cycles, when tap value is changed
irrespective of its input clock state. We should not use trimmer output during this uncertainty window.
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
- If set, DAT pads output driver will be disabled one cycle after END bit of
DATA pkt sent.
- If cleared, DAT pads output driver will be disabled in the same cycle END
bit is sent. 0x1 DAT_OE_PREAMBLE_EN:
- If set, DAT pads output driver will be enabled one cycle before START bit
of DATA pkt is transmitted on DAT lines.
- If cleared, DAT pads output driver will be enabled in the same cycle
START bit is sent. 0x1 CMD_OE_POSTAMBLE_EN:
- If set, CMD pad output driver will be disabled one cycle after END bit of
CMD pkt sent.
- If cleared, CMD pad output driver will be disabled in the same cycle END
bit is sent. 0x1 CMD_OE_PREAMBLE_EN:
- If set, CMD pad output driver will be enabled one cycle before START bit
of CMD pkt is transmitted on DAT lines.
- If cleared, CMD pad output driver will be enabled in the same cycle
START bit is sent.

- SDMMCAB Registers
- SDMMCAB_VENDOR_CQE_CNTRL0_0
- Offset: 0x208
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xe0000c82 (0b1110,xxxx,xxxx,xxxx,xx00,1100,1000,0010)
- Bit
- Reset
- Description
0x1 TASK_SELECTION_PRIORITY_EN:
- If set to 1, CQE host considers high priority attribute set for a queued
task while selecting a task for execution. 0x1 MASK_CMD_COMPLETE_INTR:
- CMD complete interrupt wont be generated during CQ mode to reduce
CPU overhead.
- But SW can still enable intr generation by clearing this reg field for
debug purpose. 0x1 MASK_DAT_XFER_COMPLETE_INTR:
- DAT transfer complete intrerrupt wont be generated during CQ mode to
reduce CPU overhead.
- But SW can still enable intr generation by clearing this reg field for
debug purpose. 0x0 CQE_SW_CLR_ALL:
- Vendor SW reset for CQE. Can be used in any hang conditions. Resets
CMD Queuing engine but not SD host.
- Active high reset
SW should keep it asserted for 10cycles. No ack would be given by HW.
- Works as module reset - flushes internal data. Can cause data loss, if
issued when bus is busy.
- Can be used along with SW_RESET_ALL of SD host

