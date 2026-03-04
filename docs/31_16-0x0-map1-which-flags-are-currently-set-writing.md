# 31 :16 0x0 MAP1: Which flags are currently set; writing 1 to a bit clears it.

- This field is valid when {sl} = Map3, indicating the master is
TrustZone non-secure). 15:0 0x0 MAP0: Which flags are currently set; writing 1 to a bit clears it.
- This field is valid when {sl} = Map2, indicating the master is
TrustZone secure).
##### 9.7.4.4.12 HSP_DBELL_{db}_PENDING_0
This register indicates which flags are set and enabled, equivalently the input to the OR reduce function that controls the signal doorbell_{db}. The read value for {i} is not guaranteed after execution of an operation on {i}. This register is used for MasterIDs <16(0 to 15). Offset: 0xc + (db * 0x100) | Read/Write: RWC | SCR Protection: DB_{db}_REG_0 | Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Rese
t
- Description

