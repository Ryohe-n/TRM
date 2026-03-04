# 31 :0 0xfdf9a080 RESP_ERR_MASK:

- Response Mode Error Mask
- This bit is used as in interrupt mask on the device status filed
which is received in R1/R1b responses. Bit Value Description (for any bit i): 1 = When a R1/R1b response is received, with bit i in the device status set, a RED interrupt is generated 0 = When a R1/R1b response is received, bit i in the device status is ignored
- The reset value of this register is set to trigger an interrupt on
all Error type bits in the device status, as defined in Section 6.13 of eMMC5.1 spec.
- Note: Responses to CMD13 (SQS) encode the QSR, so they are
ignored by this logic.
- SDMMCAB_CQE_CQTERRI_0
- Task Error Information

- SDMMCAB Registers
- This register is updated by CQE when an error occurs on data or command related to a task
activity. When such error is detected by CQE or indicated by the eMMC controller CQE stores in
- CQTERRI the task IDs and the command indices of the commands which were executed on the
command line and data lines when the error occurred. Software to use this information in the error recovery procedure.
- Offset: 0xf054
- Read/Write: RO
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0xx0,0000,xx00,0000,0xx0,0000,xx00,0000)
- Bit
- Reset
- Description
0x0 DAT_XFER_ERR_FIELDS_VLD:
- Data Transfer Error Fields Valid
- This bit is updated when an error is detected by CQE, or indicated by
eMMC controller.
- If a data transfer is in progress when the error is detected/indicated,
the bit is set to 1.
- If a no data transfer is in progress when the error is detected/
indicated, the bit is cleared to 0. 28:24 0x0 DAT_XFER_ERR_TASK_ID:
- Data Transfer Error Task ID
- This field indicates the ID of the task which was executed on the data
lines when an error occurred.
- The field is updated if a data transfer is in progress when an error is
detected by CQE, or indicated by eMMC controller. 21:16 0x0 DAT_XFER_ERR_CMD_IDX:
- Data Transfer Error Command Index
- This field indicates the index of the command which was executed on
the data lines when an error occurred.
- The index shall be set to EXECUTE_READ_TASK (CMD46) or
- EXECUTE_WRITE_TASK (CMD47) according to
the data direction. This field is updated if a data transfer is in progress when an error is detected by CQE, or indicated by eMMC controller. 0x0 RESP_ERR_FIELDS_VLD:
- Response Mode Error Fields Valid
- This bit is updated when an error is detected by CQE, or indicated by
eMMC controller.
- If a command transaction is in progress when the error is detected/
indicated, the bit is set to 1.
- If a no command transaction is in progress when the error is
detected/indicated, the bit is cleared to 0. 12:8 0x0 RESP_ERR_TASK_ID:
- Response Mode Error Task ID
- This field indicates the ID of the task which was executed on the
command line when an error occurred.
- The field is updated if a command transaction is in progress when an
error is detected by CQE, or indicated by eMMC controller.

- SDMMCAB Registers
- Bit
- Reset
- Description

