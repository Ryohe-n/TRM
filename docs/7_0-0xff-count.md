# 7 :0 0xff COUNT:

- Threshold value for all SEC Fault Reporting Units connected to this error
collator.
- SEC Errors are logged once the threshold is reached and the overflow bit
is set. 7'b0 : Log SEC error after receiving 1 Error. 7'b1 : Log SEC error after receiving 2 Errors. ... 7'bFF : Log SEC error after receiving 256 Errors.
- GPCDMA_ERRCOLLATOR_MISSIONERR_INJECT_UNLOCK_0
- Offset: 0xff1c
- Read/Write: R/W
- Parity Protection: N
- SCR Protection: EC_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)

- GPC-DMA Registers
- Bit
- Reset
- Description

