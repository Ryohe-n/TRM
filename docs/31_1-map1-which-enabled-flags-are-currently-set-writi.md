# 31 :1 MAP1: Which enabled flags are currently set. Writing 1 to a bit clears the equivalent bit in the HSP_DBELL_{db}_RAW_0 register, and thus implicitly clears the same bit in this register. This field is valid when {sl} = Map1, indicating the master is TrustZone non-secure). 15:0 MAP0: Which enabled flags are currently set. Writing 1 to a bit clears the equivalent bit in the HSP_DBELL_{db}_RAW_0 register, and thus implicitly clears the same bit in this register. This field is valid when {sl} = Map0, indicating the master is TrustZone secure).


- HSP Registers
##### 9.7.4.4.13 HSP_DBELL_{db}_PENDING_SLICE1_0
This register indicates which flags are set and enabled, equivalently the input to the OR reduce function that controls the signal doorbell_{db}. The read value for {i} is not guaranteed after execution of an operation on {i}. This register is used for 15 < MasterIDs <32(16 to 31).
- Offset: 0x2c+ (db * 0x100)
- Read/Write: R/W
- SCR Protection: HSP_DBELL_SCR_DB_0_REG_0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description

