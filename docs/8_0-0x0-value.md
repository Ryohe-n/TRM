# 8 :0 0x0 VALUE:

- Provides the current value of the counter corresponding to the error in
MissionErr_Index Register.
- Default provides the value of error 0 counter. Bit[8] is the overflow bit post
which the counter saturates and does not counter further.
- FSI_HSM_ERROR_COLLATOR_MISSIONERR_INDEX_0
- Offset: 0x1014
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- HSM Registers
- Bit
- Reset
- Description
0x0 IDX:
- BINARY Encoded. For error number 32, register should be programmed
with value 0x20. Write to this register with Error number updates:
- MISSIONERR_TYPE register with the Error-Code for the Error.
- CURRENT_COUNTER_VALUE register with the error's SEC/DED Counter.
- MISSIONERR_USERVALUE with value of the first error_<i>_user signal.
- The number shall update the MISSIONERR_TYPE register with the error
code and the Current_Counter_Value register with the value of the errors SEC/DED counter. Software can use this register to triage the error.
- FSI_HSM_ERROR_COLLATOR_CORRECTABLE_THRESHOLD_0
- Offset: 0x1018
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

