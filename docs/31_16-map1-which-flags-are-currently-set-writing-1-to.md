# 31 :16 MAP1: Which flags are currently set; writing 1 to a bit clears it.

- This field is valid when {sl} = Map1, indicating the master is
TrustZone non-secure). 15:0 MAP0: Which flags are currently set; writing 1 to a bit clears it.
- This field is valid when {sl} = Map0, indicating the master is
TrustZone secure).
##### 9.7.4.4.11 HSP_DBELL_{db}_RAW_SLICE1_0
This register indicates which flags have been set as a result of a write to the {db}_TRIGGER register. This register is used for 15 < MasterIDs <32(16 to 31).
- Offset: 0x28+ (db * 0x100)
- Read/Write: R/W
- SCR Protection: HSP_DBELL_SCR_DB_0_REG_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

