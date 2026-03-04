# 0 = NONE 1 = INTR

- PMC_IMPL_VFMON_INT_STATUS_0
Writing 0 to this register has no effect. This status is independent of the ACTION selected for each of these fault. This register captures the raw status of the fault.
- Offset: 0x1d8
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_VFMON_ST_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx00,0000,0000)
- Bit
- Reset
- Description
- OFF
VDD_FSI_MAX_FAULT:
- Writing 1 results in Clearing of interrupt status, read gives the current
status 0 = OFF 1 = ON
- OFF
VDD_FSI_MIN_FAULT:
- Writing 1 results in Clearing of interrupt status, read gives the current
status 0 = OFF 1 = ON
- OFF
VDD_CPU1_MAX_FAULT:
- Reserved
- OFF
VDD_CPU1_MIN_FAULT:
- Reserved
- OFF
VDD_CPU0_MAX_FAULT:
- Writing 1 results in Clearing of interrupt status, read gives the current
status 0 = OFF 1 = ON

- PMC IMPL Registers
- Bit
- Reset
- Description
- OFF
VDD_CPU0_MIN_FAULT:
- Writing 1 results in Clearing of interrupt status, read gives the current
status 0 = OFF 1 = ON
- OFF
VDD_SOC_MAX_FAULT:
- Writing 1 results in Clearing of interrupt status, read gives the current
status 0 = OFF 1 = ON
- OFF
VDD_SOC_MIN_FAULT:
- Writing 1 results in Clearing of interrupt status, read gives the current
status 0 = OFF 1 = ON
- OFF
F32K_FAULT:
- Writing 1 results in Clearing of interrupt status, read gives the current
status 0 = OFF 1 = ON
- OFF
FOSC_FAULT:
- Writing 1 results in Clearing of interrupt status, read gives the current
status 0 = OFF 1 = ON
- PMC_IMPL_VFMON_INT_MASK_0
- Note that in order to raise an interrupt to LIC, INTR should be the selected action in
PMC_IMPL_VFMON_ACTION register and UNMASK corresponding field in this register.
- In addition to interrupts, OSC and 32KHz FMON can raise a fault to HSM. Selecting
VFMON_ACTION as INTR raises a fault to HSM, irrespective of the MASK bit. In addition make sure
- FMON_ACTION_FAULT_REPORT_* bit of PMC_IMPL_FMON_ACTION_* register is also enabled to
raise an interrupt/fault from FMONs.
- Offset: 0x1dc
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: PMC_IMPL_SCR_VFMON_ST_SCR_0
- Reset: 0x000003ff (0bxxxx,xxxx,xxxx,xxxx,xxxx,xx11,1111,1111)

- PMC IMPL Registers
- Bit
- Reset
- Description
- MASK
VDD_FSI_MAX_FAULT:
- Whether VDD_CPU1 MAX FAULT causes an interrupt or not

