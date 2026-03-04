# 31 :0 0x0 DEBUG_COUNTER_5: 32 bit debug counter for counting stream related events for debug.

- Writing "0x1" to this register clears DEBUG_COUNTER_5
- NVCSI_GLOBAL_HOST1X_CTRL_0
- Offset: 0x2d
- Byte Offset: 0xb4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x80000014 (0b1xxx,xxxx,xxxx,xxxx,xxxx,xxxx,xx01,0100)
- Bit
- Reset
- Description
0x1 TIMEOUT_EN: Enable the timeout counter for Host Controller read access. 5:0 0x14 TIMEOUT_PERIOD: Timeout threshold for Host Controller read access.
- NVCSI_GLOBAL_INTR_PEND_0

- NVCSI Global Registers
- Offset: 0x2e
- Byte Offset: 0xb8
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,0000,0000,0000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 sw_debug_intr_pend_status: Interrupt from SW trigger pending. 0x0 host1x_intr_pend_status: Interrupt from Host Controller control pending. 0x0 phy_3_cilb_intr_1_pend_status: Interrupt from cil H status 1 pending. 0x0 phy_3_cila_intr_1_pend_status: Interrupt from cil G status 1 pending. 0x0 phy_2_cilb_intr_1_pend_status: Interrupt from cil F status 1 pending. 0x0 phy_2_cila_intr_1_pend_status: Interrupt from cil E status 1 pending. 0x0 phy_1_cilb_intr_1_pend_status: Interrupt from cil D status 1 pending. 0x0 phy_1_cila_intr_1_pend_status: Interrupt from cil C status 1 pending. 0x0 phy_0_cilb_intr_1_pend_status: Interrupt from cil B status 1 pending. 0x0 phy_0_cila_intr_1_pend_status: Interrupt from cil A status 1 pending. 0x0 phy_3_cilb_intr_0_pend_status: Interrupt from cil H status 0 pending. 0x0 phy_3_cila_intr_0_pend_status: Interrupt from cil G status 0 pending. 0x0 phy_2_cilb_intr_0_pend_status: Interrupt from cil F status 0 pending. 0x0 phy_2_cila_intr_0_pend_status: Interrupt from cil E status 0 pending. 0x0 phy_1_cilb_intr_0_pend_status: Interrupt from cil D status 0 pending. 0x0 phy_1_cila_intr_0_pend_status: Interrupt from cil C status 0 pending.

- NVCSI Global Registers
- Bit
- Reset
- Description
0x0 phy_0_cilb_intr_0_pend_status: Interrupt from cil B status 0 pending. 0x0 phy_0_cila_intr_0_pend_status: Interrupt from cil A status 0 pending. 0x0 stream_5_intr_pend_status: Interrupt from stream 5 pending. 0x0 stream_4_intr_pend_status: Interrupt from stream 4 pending. 0x0 stream_3_intr_pend_status: Interrupt from stream 3 pending. 0x0 stream_2_intr_pend_status: Interrupt from stream 2 pending. 0x0 stream_1_intr_pend_status: Interrupt from stream 1 pending. 0x0 stream_0_intr_pend_status: Interrupt from stream 0 pending.
- NVCSI_GLOBAL_CORRECTABLE_ERR_INTR_PEND_0
- FAULT_UDF_TAG_NVCSI_OTHER_CORRECTABLE_ERROR Correctable Error Interrupt (to HSM)
pending register
- Offset: 0x2f
- Byte Offset: 0xbc
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,x000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 host1x_err_intr_pend_status: Error status from Host Controller control pending. 0x0 phy_3_cilb_err_intr_pend_status: Error status from cil H pending. 0x0 phy_3_cila_err_intr_pend_status: Error status from cil G pending. 0x0 phy_2_cilb_err_intr_pend_status: Error status from cil F pending. 0x0 phy_2_cila_err_intr_pend_status: Error status from cil E pending.

- NVCSI Global Registers
- Bit
- Reset
- Description
0x0 phy_1_cilb_err_intr_pend_status: Error status from cil D pending. 0x0 phy_1_cila_err_intr_pend_status: Error status from cil C pending. 0x0 phy_0_cilb_err_intr_pend_status: Error status from cil B pending. 0x0 phy_0_cila_err_intr_pend_status: Error status from cil A pending. 0x0 stream_5_err_intr_pend_status: Error status from stream 5 pending. 0x0 stream_4_err_intr_pend_status: Error status from stream 4 pending. 0x0 stream_3_err_intr_pend_status: Error status from stream 3 pending. 0x0 stream_2_err_intr_pend_status: Error status from stream 2 pending. 0x0 stream_1_err_intr_pend_status: Error status from stream 1 pending. 0x0 stream_0_err_intr_pend_status: Error status from stream 0 pending.
- NVCSI_GLOBAL_UNCORRECTABLE_ERR_INTR_PEND_0
- FAULT_UDF_TAG_NVCSI_OTHER_UNCORRECTABLE_ERROR Uncorrectable Error Interrupt (to HSM)
pending register
- Offset: 0x30
- Byte Offset: 0xc0
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,x000,0000,0000,0000)
- Bit
- Reset
- Description
0x0 host1x_err_intr_pend_status: Error status from Host Controller control pending. 0x0 phy_3_cilb_err_intr_pend_status: Error status from cil H pending. 0x0 phy_3_cila_err_intr_pend_status: Error status from cil G pending.

- NVCSI Global Registers
- Bit
- Reset
- Description
0x0 phy_2_cilb_err_intr_pend_status: Error status from cil F pending. 0x0 phy_2_cila_err_intr_pend_status: Error status from cil E pending. 0x0 phy_1_cilb_err_intr_pend_status: Error status from cil D pending. 0x0 phy_1_cila_err_intr_pend_status: Error status from cil C pending. 0x0 phy_0_cilb_err_intr_pend_status: Error status from cil B pending. 0x0 phy_0_cila_err_intr_pend_status: Error status from cil A pending. 0x0 stream_5_err_intr_pend_status: Error status from stream 5 pending. 0x0 stream_4_err_intr_pend_status: Error status from stream 4 pending. 0x0 stream_3_err_intr_pend_status: Error status from stream 3 pending. 0x0 stream_2_err_intr_pend_status: Error status from stream 2 pending. 0x0 stream_1_err_intr_pend_status: Error status from stream 1 pending. 0x0 stream_0_err_intr_pend_status: Error status from stream 0 pending.
- NVCSI_GLOBAL_INTR_STATUS_HOST1X_0
- Offset: 0x31
- Byte Offset: 0xc4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 intr_host1x_timeout_err:
- Host Controller read access timeout

- NVCSI Global Registers
- NVCSI_GLOBAL_INTR_MASK_HOST1X_0
- Offset: 0x32
- Byte Offset: 0xc8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 intr_mask_host1x_timeout_err:
- Mask the Host Controller read access timeout error, when set to 1, the
interrrupt will not send out.
- NVCSI_GLOBAL_CORRECTABLE_ERR_INTR_STATUS_HOST1X_0
- Offset: 0x33
- Byte Offset: 0xcc
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 err_intr_host1x_timeout_err:
- Host Controller read access timeout
- NVCSI_GLOBAL_UNCORRECTABLE_ERR_INTR_STATUS_HOST1X_0
- Offset: 0x34
- Byte Offset: 0xd0
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)

- NVCSI Global Registers
- Bit
- Reset
- Description
0x0 err_intr_host1x_timeout_err:
- Host Controller read access timeout
- NVCSI_GLOBAL_ERR_INTR_MASK_HOST1X_0
- Offset: 0x35
- Byte Offset: 0xd4
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 err_intr_mask_host1x_timeout_err:
- Mask the Host Controller read access timeout error, when set to 1, the
error will not send out.
- NVCSI_GLOBAL_ERR_INTR_TYPE_HOST1X_0
- Offset: 0x36
- Byte Offset: 0xd8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- Secure: Trust Zone Protected
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 err_intr_type_host1x_timeout_err: The error type for the Host Controller read access timeout send out. 0: corrected error. 1: uncorrected error.
- NVCSI_GLOBAL_SW_DEBUG_INTR_STATUS_0
- Offset: 0x38
- Byte Offset: 0xe0

- NVCSI Global Registers
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 SW_DEBUG_INTR:
- SW trigger interrupt status
- NVCSI_GLOBAL_SW_DEBUG_INTR_TRIG_0
- Offset: 0x39
- Byte Offset: 0xe4
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxxx,xxx0)
- Bit
- Reset
- Description
0x0 TRIGGER:
- Write 1 to this register trigger a SW interrupt
- NVCSI_GLOBAL_SW_ERR_CODE_0
- SW Error Reporting
In certain cases, the IP driver may implement diagnostics in SW.
- Errors detected by such SW diagnostics need to be reported to HSM. To avoid time consuming
IPCs, IP SW can directly write an IP SW defined Error Code into the SW_ERR_CODE register and assert the SW Error. The IP Error Collator adds an additional error input with the below options : err_type = SW err_user - Adds err__user[31:0] as an input to the error collator for the err_x.
- Offset: 0x3a
- Byte Offset: 0xe8
- Read/Write: R/W
- Parity Protection: Y
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,0000,0000)

- NVCSI Global Registers
- Bit
- Reset
- Description

