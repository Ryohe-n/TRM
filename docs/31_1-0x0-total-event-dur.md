# 31 :1 0x0 TOTAL_EVENT_DUR:

- Maintains a running count of time (in TICKs) for which the OC_ALARM
input was asserted 0x0 OVERFLOW: A sticky bit to indicate when TOTAL_EVENT_DUR may have wrapped around since last
- LAST_MSB write. Asserts if TOTAL_EVENT_DUR[31] 0->1 && LAST_MSB
== 1 or TOTAL_EVENT_DUR[31] 1->0 && LAST_MSB == 0
- SOC_THERM_EDP_OC_MON_ALARM_OC6_DUR_THRESHOLD2_0
- Offset: 0x4b3c
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0xfffffffe (0b1111,1111,1111,1111,1111,1111,1111,1110)
- Bit
- Reset
- Description

