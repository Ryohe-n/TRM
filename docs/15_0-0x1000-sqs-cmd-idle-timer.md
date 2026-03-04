# 15 :0 0x1000 SQS_CMD_IDLE_TIMER:

- Send Status Command Idle Timer
- This field indicates to CQE the polling period to use when using
periodic SEND_QUEUE_STATUS (CMD13) polling.
- Periodic polling is used when tasks are pending in the device, but no
data transfer is in progress. When a SEND_QUEUE_STATUS response indicating that no task is ready for execution, CQE counts the configured time until it issues the next SEND_QUEUE_STATUS.
- Timer units are clock periods of the clock whose frequency is
specified in the Internal Timer Clock Frequency field CQCAP register.
- The minimum value is 0001h (1 clock period) and the maximum
value is FFFFh (65535 clock periods). Default interval is: 4096 clock periods.
- For example, a CQCAP field value of 0 indicates a 19.2 MHz clock
frequency (period = 52.08 ns).
- If the setting in CQSST is 1000h, the calculated polling period is

