# 15 :14 0x3 VM8: This field specifies the access permission for VM8 (Guest OS7). 00 = No Access for VM8 (Guest OS7). 01 = Read Only Access for VM8 (Guest OS7). 10 = Write Only Access for VM8 (Guest OS7). 11 = FULL access for VM8 (Guest OS7). 13:12 0x3 VM7: This field specifies the access permission for VM7 (Guest OS6). 00 = No Access for VM7 (Guest OS6). 01 = Read Only Access for VM7 (Guest OS6). 10 = Write Only Access for VM7 (Guest OS6). 11 = FULL access for VM7 (Guest OS6). 11:10 0x3 VM6: This field specifies the access permission for VM6 (Guest OS5). 00 = No Access for VM6 (Guest OS5). 01 = Read Only Access for VM6 (Guest OS5). 10 = Write Only Access for VM6 (Guest OS5). 11 = FULL access for VM6 (Guest OS5). 9:8 0x3 VM5: This field specifies the access permission for VM5 (Guest OS4). 00 = No Access for VM5 (Guest OS4). 01 = Read Only Access for VM5 (Guest OS4). 10 = Write Only Access for VM5 (Guest OS4). 11 = FULL access for VM5 (Guest OS4). 7:6 0x3 VM4: This field specifies the access permission for VM4 (Guest OS3). 00 = No Access for VM4 (Guest OS3). 01 = Read Only Access for VM4 (Guest OS3). 10 = Write Only Access for VM4 (Guest OS3). 11 = FULL access for VM4 (Guest OS3). 5:4 0x3 VM3: This field specifies the access permission for VM3 (Guest OS2). 00 = No Access for VM3 (Guest OS2). 01 = Read Only Access for VM3 (Guest OS2). 10 = Write Only Access for VM3 (Guest OS2). 11 = FULL access for VM3 (Guest OS2). 3:2 0x3 VM2: This field specifies the access permission for VM2 (Guest OS1). 00 = No Access for VM2 (Guest OS1). 01 = Read Only Access for VM2 (Guest OS1). 10 = Write Only Access for VM2 (Guest OS1). 11 = FULL access for VM2 (Guest OS1). 1:0 0x3 VM1: This field specifies the access permission for VM1 (Guest OS0). 00 = No Access for VM1 (Guest OS0). 01 = Read Only Access for VM1 (Guest OS0). 10 = Write Only Access for VM1 (Guest OS0). 11 = FULL access for VM1 (Guest OS0).


- GPIO Common Control Registers
- GPIO_CTL<kk>_INTERRUPT_STATUS_VM_0,
where <kk> = 0, 1, 2, 3, 4, 5.
- GPIO_CTL0_INTERRUPT_STATUS_VM_0
- Offset: 0x808
- GPIO_CTL1_INTERRUPT_STATUS_VM_0
- Offset: 0x1808
- GPIO_CTL2_INTERRUPT_STATUS_VM_0
- Offset: 0x2808
- GPIO_CTL3_INTERRUPT_STATUS_VM_0
- Offset: 0x3808
- GPIO_CTL4_INTERRUPT_STATUS_VM_0
- Offset: 0x4808
- GPIO_CTL5_INTERRUPT_STATUS_VM_0
- Offset: 0x5808
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: GPIO_CTL<kk>_INTERRUPT_STATUS_VM_SCR_0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)
- Bit
- Reset
- Description

