# 8 -bit value used when PWM_MODE is set to COUNTER to determine how many times the PWM will cycle through the 128 cycles before stopping. 21:20 0x0 PWM_MODE:

- PWM Mode
- Continous - after PWM is turned on, continue
through the PWM's 128 cycles repeatedly until the pwm is turned off.
- Single - after PWM is turned on, cycle once through
the 128 cycles and stop.
- Counter - after PWM is turned on, cycle through
the 128 cycles PWM_COUNTER number of times then stop. 23:22 reserved 0 = CONTINUOUS 1 = SINGLE 2 = COUNTER 0x0 PWM_DIRECTION:
- PWM Direction

