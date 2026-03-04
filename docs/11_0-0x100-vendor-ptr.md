# 11 :0 0x100 VENDOR_PTR:

- Vendor regs start at 0x100 - offset[11:0]=0x100
- SDMMCA_SLOT_INTERRUPT_STATUS_0
- Slot Interrupt Status Register
--------------------------------------------------------------
- VENDOR_VERSION_NUMBER - Vendor Version Number
- This status is reserved for the vendor version number. The Host Driver

- SDMMCA Registers
should not use this status.
- SPECIFICATION_VERSION_NUMBER - Specification Version Number
- This status indicates the Host Controller Spec. Version. The upper and
lower 4-bits indicate the version. 00 SD Host Specification Version 1.00 01 SD Host Specification Version 2.00
- Including the feature of the ADMA and Test Register,

