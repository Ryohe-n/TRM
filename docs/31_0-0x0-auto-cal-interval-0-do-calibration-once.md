# 31 :0 0x0 AUTO_CAL_INTERVAL: 0: Do calibration once

- Otherwise, auto-calibration occurs at intervals equivalent to the
programmed number of microseconds.
- QSPI_AUTO_CAL_STATUS_0
- QSPICOMP pad calibration status
- Offset: 0x1f8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0xx0,0000,xxx0,0000,xxx0,0000,xxx0,0000)
- Bit
- Reset
- Description
0x0 AUTO_CAL_ACTIVE:
- One when auto calibrate is active valid only after auto-calibrate
sequence has completed (AUTO_CAL_ACTIVE == 0) 28:24 0x0 AUTO_CAL_PULLDOWN_ADJ:
- Pulldown code sent to pads

