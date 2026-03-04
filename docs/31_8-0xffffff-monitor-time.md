# 31 :8 0xffffff MONITOR_TIME:

- Time in micro-seconds that the controller counts the incoming pulses and
compares against UPPER_THRESHOLD/LOWER_THRESHOLD when time expires. This field is used when ERR_CONFIG=MONITOR_PULSES 0x0 ERR_CONFIG:
- Hardware can monitor the tach input and detect variation in RPM. This
can be done in two ways: 1.
- MONITOR_PERIOD - Detect variation in RPM by monitoring the
tach input period for the programmed win_length (absolute RPM monitor).
- MONITOR_PULSES - Detect variation in RPM by monitoring the
tach input pulses (number of rising edges of tach input) for a programmed time (MONITOR_TIME). 2.
- In this configuration, Hardware does not wait for a tach pulse to be
detected (average RPM monitor). 0 = MONITOR_PERIOD 1 = MONITOR_PULSES 0x0 STOP_ON_ERR:
- If stop_on_error field is set, Tach will wait until the interrupt is serviced
and cleared by Software, else it will continue monitoring. 0 = DISABLE 1 = ENABLE 0x0 LOAD_CONFIG:
- Software is required to set this bit to 1 after programming the threshold
values and ERR_CONFIG into respective registers. Setting the bit to 1 triggers Hardware to update the threshold values internally and reset the current counters. Hardware starts counting the period on the next pulse from fan when ERR_CONFIG = MONITOR_PERIOD or
- Hardware starts counting the pulses immediately when ERR_CONFIG =
- MONITOR_PULSES. Once the internal update is done, Hardware auto
clears this bit. Since Hardware will be busy with internal update, Software should not write the threshold register or ERR_CONFIG again until this bit is cleared by Hardware. 0 = DISABLE 1 = ENABLE
- TACH_FAN_TACH_ERR_STATUS_0
- Offset: 0x18
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0b0000,0000,0000,0000,0000,0000,xxxx,xx00)

- Fan Tachometer Registers
- Bit
R/W
- Reset
- Description

