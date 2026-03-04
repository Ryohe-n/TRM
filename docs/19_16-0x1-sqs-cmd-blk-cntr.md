# 19 :16 0x1 SQS_CMD_BLK_CNTR:

- Send Status Command Block Counter
- This field indicates to CQE when to send SEND_QUEUE_STATUS
(CMD13) command to inquire the status of the device task queue. A value of n means CQE shall send status command on the CMD line, during the transfer of data block BLOCK_CNT-n, on the data lines, where BLOCK_CNT is the number of blocks in the current transaction. A value of 0 means that SEND_QUEUE_STATUS (CMD13) command shall not be sent during the transaction. Instead it will be sent only when the data lines are idle. A value of 1 means that STATUS command is to be sent during the last block of the transaction.

- SDMMCAB Registers
- Bit
- Reset
- Description

