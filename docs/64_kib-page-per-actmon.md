# 64 KiB page per ACTMON.

- HOST1X_THOST_ACTMON_NVENC_GLB_CTRL_0
These are Host Controller ACTMON registers per client.
- ACTMON_ENABLE
Enable Monitor. Set by Software to enable sampling. Cleared in one of the following ways: (a) When Software intends to stop the monitor, it can do so by clearing this field; (b) when the sampling period expires (and we are not in the periodic mode)
- CONSECUTIVE_ABOVE_WMARK_NUM
Number (N+1) of consecutive upper watermark breaches that need to occur to raise an interrupt.
- CONSECUTIVE_BELOW_WMARK_NUM

- Host Controller ACTMON Registers
Number (N+1) of consecutive lower watermark breaches that need to occur to raise an interrupt.
- CONSECUTIVE_ABOVE_WMARK_EN
- Enable interrupt when consecutive CONSECUTIVE_UPPER_NUM upper watermark breaches are
detected.
- CONSECUTIVE_BELOW_WMARK_EN
- Enable interrupt when consecutive CONSECUTIVE_LOWER_NUM lower watermark breaches are
detected.
- AVG_ABOVE_WMARK_EN
Enable interrupt when AVG value is above its upper watermark value.
- AVG_BELOW_WMARK_EN
Enable interrupt when AVG value is below its lower watermark value.
- AT_END_EN
Enable interrupt at the end of sample period.
- ENB_PERIODIC
- Enable periodic mode. Sample for one sample period or periodic sampling. Periodic mode is
disabled, samples for only 1 period. Periodic mode is enabled, keeps on sampling and updating value after every sample period. K_VAL Variable for IIR filter. Default is 6, which translates to 2^(K+1) = 128.
- SAMPLE_PERIOD
Sample period value. The actual sample period is dependent on the SOURCE field in CTRL register. Actual Sample period= (Sample period value +1) in units mentioned in the SOURCE field in CTRL register >> UPPER_WMARK Upper Watermark Register Upper watermark for count value. >> LOWER_WMARK Lower Watermark Register Lower watermark for count value.

- Host Controller ACTMON Registers
>> AVG_UPPER_WMARK AVG Upper Watermark Register Average Upper watermark for count value. >> AVG_LOWER_WMARK AVG Lower Watermark Register Average Lower watermark for count value. >> INIT_AVG Initial AVG value, specified by Software to set up the filter. >> COUNT Monitor Status0 Register Indicates the number of active count pulses in one period. >> AVG_COUNT Monitor Status1 Register Indicates the AVG count value. >> INTR_STATUS Monitor Interrupt Status Register
- CONSECUTIVE_UPPER_INTR
Assert at the end of sampling period, if count value crosses upper watermark value consecutively for the number of times specified in CONSECUTIVE_UPPER_NUM field. A write value of 1 clears this interrupt, writing a 0 has no effect. 0 = interrupt not detected 1 = interrupt detected
- CONSECUTIVE_LOWER_INTR
Assert at the end of sampling period, if count value crosses lower watermark value consecutively for the number of times specified in CONSECUTIVE_LOWER_NUM field. A write value of 1 clears this interrupt, writing a 0 has no effect. 0 = interrupt not detected 1 = interrupt detected
- AVG_BELOW_WMARK_INTR
Assert at the end of sampling period, if average count value crosses lower average watermark value. A write value of 1 clears this interrupt, writing a 0 has no effect. 0 = interrupt not detected 1 = interrupt detected
- AVG_ABOVE_WMARK_INTR

- Host Controller ACTMON Registers
Assert at the end of sampling period, if average count value crosses upper average watermark value. A write value of 1 clears this interrupt, writing a 0 has no effect. 0 = interrupt not detected 1 = interrupt detected
- AT_END_INTR
Assert at the end of sampling period, if interrupt at end of sample period is enabled. A write value of 1 clears this interrupt, writing a 0 has no effect. 0 = interrupt not detected 1 = interrupt detected
- Offset: 0xf0000
- Read/Write: See table below
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxx0,xxxx,0000,0000,0000)
- Bit
R/W
- Reset
- Description
- RO
0x0
- PAUSE_STATUS
- RW
0x0
- PAUSE
- RW
0x0 SAMPLE_TICK: 0 = TICK_256 1 = TICK_65536 9:8
- RW
0x0 SOURCE: 0 = MSEC 1 = USEC 2 = TICK 7:0
- RW
0x0
- SAMPLE_PERIOD
- HOST1X_THOST_ACTMON_NVENC_GLB_INT_EN_0
- Offset: 0xf0004
- Read/Write: R/W
- Parity Protection: N
- Shadow: N
- SCR Protection: 0
- Reset: 0x00000000 (0bxxxx,xxxx,xxxx,xxxx,xxxx,xxxx,0000,0000)

- Host Controller ACTMON Registers
- Bit
- Reset
- Description

