# 0 = DISABLE 1 = ENABLE

- FSI_HSM_ERROR_COLLATOR_ERRSLICE0_LATENTERR_FORCE_0
- Offset: 0x1044
- Read/Write: WO
- Parity Protection: N

- HSM Registers
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 ERR1: 1'b1 -> Force Assertion of Latent Error Reporting for Comparator Error from HSM.lockstep 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE 0x0 ERR0: 1'b1 -> Force Assertion of Latent Error Reporting for Register Parity Error from NV_SCE_HSM_EC_err_collator 1'b0 -> Do Nothing 0 = NOFORCE 1 = FORCE
- FSI_HSM_ERROR_COLLATOR_ERRSLICE0_LATENTERR_STATUS_0
Software must write 1 to clear the fields of this register. Bits in this register continue to be logged independent of the value of LatentError_Enable register, to avoid silent dropping of errors.
- Offset: 0x1048
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 ERR1: 1'b1 -> Error_1_pulse[1:0] for Comparator Error from HSM.lockstep was equal to 2'b00 or 2'b11. 1'b0 -> Error_1_pulse[1:0] for Comparator Error from HSM.lockstep was equal to 2'b01 or 2'b10, but no latent error. 0x0 ERR0: 1'b1 -> Error_0_pulse[1:0] for Register Parity Error from NV_SCE_HSM_EC_err_collator was equal to 2'b00 or 2'b11. 1'b0 -> Error_0_pulse[1:0] for Register Parity Error from
- NV_SCE_HSM_EC_err_collator was equal to 2'b01 or 2'b10, but no latent
error.
- FSI_HSM_ERROR_COLLATOR_ERRSLICE0_COUNTER_RELOAD_0
- Offset: 0x1050
- Read/Write: WO

- Safety Cluster Engine (SCE)
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx00)
- Bit
- Reset
- Description
0x0 ERR1: 1'b1 -> Reload Error Counter for Comparator Error from HSM.lockstep 1'b0 -> Do Nothing 0 = NORELOAD 1 = RELOAD 0x0 ERR0: 1'b1 -> Reload Error Counter for Register Parity Error from
- NV_SCE_HSM_EC_err_collator

