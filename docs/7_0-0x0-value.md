# 7 :0 0x0 VALUE:

- Writes to ERRSLICE_XXX_MISSIONERR_INJECT registers are disabled until
this register is written with a value of 0xE1.
- This is to prevent an inadvertent safety error injection in the safety plugin
due to: 1. A fault on ERRSLICE_XXX_MISSIONERR_INJECT register itself. 2. Erroneous Software.
- The register shall be written with a value of 0x0 to reestablish the lock after
user has completed the error injection testing. 0xE1: Unlock the MISSIONERR_INJECT Register 0x0: Lock the MISSIONERR_INJECT Register 0 = LOCK 225 = UNLOCK
- FSI_HSM_ERROR_COLLATOR_ERRSLICE0_MISSIONERR_ENABLE_0
- Offset: 0x1030
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000003 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx11)
- Bit
- Reset
- Description
0x1 ERR1: 1'b1 -> Enable Mission Error Reporting for Comparator Error from
- HSM.lockstep

